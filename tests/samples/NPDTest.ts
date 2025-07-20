import { SceneConfig } from '../../src';
import { Scene } from '../../src';
import { UndefinedVariableChecker, UndefinedVariableSolver } from '../../src';
import { Logger, LOG_LEVEL, LOG_MODULE_TYPE } from '../../src';
import { NPDReportManager } from '../../src/core/dataflow/NPDReport';
import { LLMFilter } from '../../src/core/dataflow/LLMFilter';

const logger = Logger.getLogger(LOG_MODULE_TYPE.TOOL, 'NPDTest');
Logger.configure('', LOG_LEVEL.ERROR, LOG_LEVEL.INFO, false);

let config: SceneConfig = new SceneConfig();
// config.buildFromProjectDir("tests/resources/ifds/UndefinedVariable/test");
config.buildFromProjectDir("benchmark/139928");
const scene = new Scene();
scene.buildBasicInfo(config);
scene.buildSceneFromProjectDir(config);

const startTime = Date.now();
logger.info("Test begins.");
const reportManager = new NPDReportManager();
let num = 0;
for (let method of scene.getMethods()) {
    if (method.getName() !== "main")
        continue
    // if (method.getName() === '%dflt') 
    //     continue;
    const cfg = method.getCfg();
    if (cfg !== undefined && cfg !== null) {
        const problem = new UndefinedVariableChecker([...cfg.getBlocks()][0].getStmts()[method.getParameters().length],method);
        const solver = new UndefinedVariableSolver(problem, scene);
        solver.solve();
        solver.toResult(method.getDeclaringArkClass().getName(), method.getName(), method.getParameters(), reportManager);
        num++;
    }
}
logger.info("Total methods analyzed: " + num);

main().catch(err => {
    console.error("程序执行出错：", err);
});

async function main() {
    const llmfilter = new LLMFilter();
    await llmfilter.processReportNormally(scene, reportManager);
    const endTime = Date.now();
    const durationMs = endTime - startTime;
    logger.info(`Test finished. Duration: ${durationMs}ms`);
    reportManager.exportJSONToFile(`./output/report.json`, durationMs);
}