import fs from 'fs';
import path from 'path';
import dotenv from 'dotenv';
import { SceneConfig } from '../../src';
import { Scene } from '../../src';
import { UndefinedVariableChecker, UndefinedVariableSolver } from '../../src';
import { NPDReportManager } from '../../src/core/dataflow/NPDReport';
import { LLMFilter } from '../../src/core/dataflow/LLMFilter';
import * as XLSX from 'xlsx';
import { ArkMethod } from '../../src/core/model/ArkMethod';

dotenv.config();

const projectsRoot = process.env.PROJECTS_ROOT || './projects';
const absoluteRoot = path.resolve(projectsRoot);
const outputDirName = 'output';
const excelOutputFile = 'project_analysis_summary.xlsx';

interface ProjectSummary {
    projectPath: string;
    totalReports: number;
    executionTime: number;
}

async function runAnalysisBatch() {
    console.log(`扫描目录: ${absoluteRoot}`);

    if (!fs.existsSync(absoluteRoot)) {
        console.error(`路径不存在: ${absoluteRoot}`);
        process.exit(1);
    }

    const subDirs = fs.readdirSync(absoluteRoot).filter(entry => {
        const fullPath = path.join(absoluteRoot, entry);
        return fs.statSync(fullPath).isDirectory();
    });

    console.log(`共发现 ${subDirs.length} 个子项目`);

    const summary: ProjectSummary[] = [];

    for (const dirName of subDirs) {
        const projectPath = path.join(absoluteRoot, dirName);
        const outputPath = path.join(projectPath, outputDirName);
        console.log(`正在分析: ${dirName}`);

        try {
            fs.mkdirSync(outputPath, { recursive: true });
            const reportManager = new NPDReportManager();
            await analyzeProject(projectPath, outputPath, reportManager);

            summary.push({
                projectPath: projectPath,
                totalReports: reportManager.getReportCount() ?? 0,
                executionTime: reportManager.getElapsedTime() ?? 0,
            });

            console.log(`${dirName} 分析完成，结果已输出至: ${outputPath}\n`);
        } catch (err) {
            console.error(`${dirName} 分析失败:`, err);
        }
    }
    writeSummaryToExcel(summary);
    console.log('所有项目分析完成');
}

runAnalysisBatch().catch(err => {
    console.error("批量分析执行出错：", err);
})

async function analyzeProject(projectPath: string, outputPath: string, reportManager: NPDReportManager){
    let config: SceneConfig = new SceneConfig();
    config.buildFromProjectDir(projectPath);
    const scene = new Scene();
    scene.buildBasicInfo(config);
    scene.buildSceneFromProjectDir(config);

    const startTime = Date.now();
    for (const method of scene.getMethods()) {
        // if (isExcludedMethod(method))
        //     continue;
        if (!isIncludedMethod(method))
            continue;
        const cfg = method.getCfg();
        if (cfg !== undefined && cfg !== null) {
            const problem = new UndefinedVariableChecker([...cfg.getBlocks()][0].getStmts()[method.getParameters().length],method);
            const solver = new UndefinedVariableSolver(problem, scene);
            solver.solve();
            solver.toResult(method.getDeclaringArkClass().getName(), method.getName(), method.getParameters(), reportManager);
        }
    }

    const llmFilter = new LLMFilter();
    await llmFilter.processReportConcurrently(scene, reportManager);
    // await llmFilter.processReportNormally(scene, reportManager);
    const endTime = Date.now();
    const durationMs = endTime - startTime;
    const reportFile = path.join(outputPath, 'report.json');
    reportManager.exportJSONToFile(reportFile, durationMs);

    // main().catch(err => {
    //     console.error("程序执行出错：", err);
    // });

    // async function main() {
    //     const llmFilter = new LLMFilter();
    //     await llmFilter.processReportNormally(scene, reportManager);
    //     const endTime = Date.now();
    //     const durationMs = endTime - startTime;
    //     const reportFile = path.join(outputPath, 'report.json');
    //     reportManager.exportJSONToFile(reportFile, durationMs);
    // }
}

// function isExcludedMethod(methods: ArkMethod): boolean {
//     const excludedMethods = [
//         '%dflt', '%instInit', '%statInit', 'constructor'
//     ]
//     return excludedMethods.includes(methods.getName());
// }

function isIncludedMethod(methods: ArkMethod): boolean {
    const includedClass = "Ability";
    const mainMethodName = "main";
    const NPDClassName = "NullPointerDereference";
    if (methods.getDeclaringArkClass().getName().includes(includedClass) || methods.getName() === mainMethodName || methods.getSignature().getMethodSubSignature().getMethodName().includes(NPDClassName)) {
        return true;
    } else {
        return false;
    }
}

function writeSummaryToExcel(data: ProjectSummary[]) {
    const wsData = [
        ['Project Path', 'Total Reports', 'Execution Time (ms)'],
        ...data.map(d => [d.projectPath, d.totalReports, d.executionTime]),
    ];

    const ws = XLSX.utils.aoa_to_sheet(wsData);
    const wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb, ws, 'Summary');
    XLSX.writeFile(wb, excelOutputFile);
}



