import { Scene } from '../../Scene';
import { ArkMethod } from '../model/ArkMethod';
import { NPDReportManager, NPDReport } from './NPDReport';
import { Stmt } from '../base/Stmt';
import { Local } from '../base/Local';
import OpenAI from 'openai';
import dotenv from 'dotenv';
import pLimit from 'p-limit';

// 在一个方法内，区分传播路径行号和最终原因所在的行号
interface MethodLineDetail {
    propagationLines: number[]; // 传播路径涉及的行号
    sinkLine: number | null;      // 路径终点（原因）所在的行号
}

// 新的层级化路径摘要
interface DetailedHierarchicalPathSummary {
    [fileName: string]: {
        [className: string]: {
            [methodName: string]: MethodLineDetail;
        };
    };
}

// 更新 "Fact" 接口来使用新的摘要结构
interface AggregatedFact {
    factVariable: string;
    reason: string;
    node: string;
    line: number;   
    pathSummary: DetailedHierarchicalPathSummary;
}

// 顶层报告结构
interface ProcessedReport {
    [analyzedMethod: string]: AggregatedFact[];
}

export class LLMFilter {
    apiKey: string;
    model: string;
    baseUrl: string;
    openai: OpenAI;
    constructor() {
        dotenv.config();
        this.apiKey = process.env.DEEPSEEK_API_KEY ?? "";
        this.model = process.env.DEEPSEEK_MODEL ?? "";
        this.baseUrl = process.env.DEEPSEEK_API_URL ?? "";
        this.openai = new OpenAI({
            apiKey: this.apiKey,
            baseURL: this.baseUrl
        });
    }
    
    /**
    * * 处理 NPD 报告，区分传播路径和最终落点(Sink)。
    * @param reportPath 报告文件路径
    * @returns ProcessedReport 结构化的报告对象
    */
    processJsonReport(jsonData: any): ProcessedReport {
        console.log("开始处理报告...");
        const aggregatedReport: ProcessedReport = {};

        for (const [methodName, facts] of Object.entries(jsonData)) {
            aggregatedReport[methodName] = [];

            (facts as any[]).forEach((fact: any) => {
                const pathSummary: DetailedHierarchicalPathSummary = {};
                const path = fact.path;

                if (path && Array.isArray(path) && path.length > 0) {
                    const addPathInfo = (step: any, isSink: boolean) => {
                        if (step.line === undefined) return;

                        const fileName = step.method.declaringClassSignature.declaringFileSignature.fileName;
                        const className = step.method.declaringClassSignature.className;
                        const methodName = step.method.methodSubSignature.methodName;
                        const line = step.line;

                        // 逐层初始化对象
                        pathSummary[fileName] = pathSummary[fileName] || {};
                        pathSummary[fileName][className] = pathSummary[fileName][className] || {};
                        pathSummary[fileName][className][methodName] = pathSummary[fileName][className][methodName] || { propagationLines: [], sinkLine: null };

                        const detail = pathSummary[fileName][className][methodName];
                        if (isSink) {
                            detail.sinkLine = line;
                        } else {
                            // 避免重复添加传播路径行号
                            if (!detail.propagationLines.includes(line)) {
                                detail.propagationLines.push(line);
                            }
                        }
                    };

                    const sinkStep = path[path.length - 1];
                    addPathInfo(sinkStep, true);

                    for (let i = 0; i < path.length - 1; i++) {
                        addPathInfo(path[i], false);
                    }
                }
                
                // 创建最终的 Fact 对象
                const processedFact: AggregatedFact = {
                    factVariable: fact.fact,
                    reason: fact.reason,
                    node: fact.node,
                    line: fact.line,
                    pathSummary: pathSummary,
                };
                
                aggregatedReport[methodName].push(processedFact);
            });
        }

        console.log("\nNPD 报告处理完成！");
        return aggregatedReport;
    }

    processReportManager(reportManager: NPDReportManager): ProcessedReport {
        console.log("开始从 NPDReportManager 处理报告...");
        const aggregatedReport: ProcessedReport = {};

        for (const [methodSignature, reports] of reportManager.map.entries()) {
            aggregatedReport[methodSignature] = [];

            for (const report of reports) {
                const pathSummary: DetailedHierarchicalPathSummary = {};

                const addPathInfo = (stmt: Stmt, isSink: boolean) => {
                    const posInfo = stmt.getOriginPositionInfo();
                    if (!posInfo) return;
                    const line = posInfo.getLineNo();

                    const method = stmt.getCfg().getDeclaringMethod();
                    const fileName = method.getDeclaringArkFile().getName();
                    const className = method.getDeclaringArkClass().getName();
                    const methodName = method.getSubSignature().getMethodName();

                    // 初始化各层级
                    pathSummary[fileName] = pathSummary[fileName] || {};
                    pathSummary[fileName][className] = pathSummary[fileName][className] || {};
                    pathSummary[fileName][className][methodName] = pathSummary[fileName][className][methodName] || {
                        propagationLines: [],
                        sinkLine: null
                    };

                    const detail = pathSummary[fileName][className][methodName];
                    if (isSink) {
                        detail.sinkLine = line;
                    } else {
                        if (!detail.propagationLines.includes(line)) {
                            detail.propagationLines.push(line);
                        }
                    }
                };

                // 添加传播路径：前面的都是 propagation，最后一个是 sink
                const path = report.path;
                for (let i = 0; i < path.length - 1; i++) {
                    addPathInfo(path[i], false);
                }
                if (path.length > 0) {
                    addPathInfo(path[path.length - 1], true);
                } else {
                    // fallback: sink 使用 report.node 自身
                    addPathInfo(report.node, true);
                }

                const factName = (report.fact instanceof Local)
                    ? report.fact.getName()
                    : report.fact.getType().toString();

                const processedFact: AggregatedFact = {
                    factVariable: factName,
                    reason: report.reason,
                    node: report.node.toString(),
                    line: report.line,
                    pathSummary: pathSummary
                };

                aggregatedReport[methodSignature].push(processedFact);
            }
        }

        console.log("\n✅ NPD 报告处理完成！");
        return aggregatedReport;
    }


    /**
     * * 标记方法代码中的指定行。
     * @param method - 从 Scene 中获取的方法对象
     * @param markers - 一个 Map 对象，键是行号，值是该行要标注的文本
     * @returns 包含标记的完整方法代码字符串
     */
    markMethodCode(method: ArkMethod, markers: Map<number, string>): string {
        const fullCode = method.getCode();
        const startLine = method.getLine() ?? 0;

        if (!fullCode || startLine === 0) {
            return "// 无法获取此方法的源代码或起始行号。";
        }
        const lines = fullCode.split(/\r?\n/);
        const markedLines = lines.map((line, index) => {
            const currentLineNumber = startLine + index;
            if (markers.has(currentLineNumber)) {
                const markerText = markers.get(currentLineNumber);
                return `${line} // <<< ${markerText}`;
            }
            return line;
        });
        return markedLines.join('\n');
    }

    // New function to process a single prompt
    async processPrompt(prompt: string): Promise<any> {
        const chatCompletion = await this.openai.chat.completions.create({
            model: this.model,
            messages: [
                { 
                    role: "system", 
                    content: "You are a professional software quality analyst, skilled at identifying and explaining runtime errors in ArkTS/TypeScript code."
                },
                { 
                    role: "user", 
                    content: prompt 
                }
            ],
        });

        let response = chatCompletion.choices[0].message.content;
        // Extract JSON from markdown code block
        const jsonMatch = response?.match(/```json\n([\s\S]*?)\n```/);
        if (jsonMatch?.[1]) {
            response = jsonMatch[1];
        }

        return JSON.parse(response ?? "");
    }

    async processReportConcurrently(scene: Scene, reportManager: NPDReportManager) {
        const processedReport = this.processReportManager(reportManager);
        console.log("\n--- 提取并合并报告中方法的代码 ---");
        
        const limit = pLimit(5); // 限制最多同时并发 5 个 LLM 请求

        type FilterTask = {
            entryMethod: string;
            fact: AggregatedFact;
        };
        const taskList: FilterTask[] = [];
        
        // 收集需要删除的项目
        const toDelete = new Map<string, AggregatedFact[]>();

        for (const entryMethod in processedReport) {
            for (const fact of processedReport[entryMethod]) {
                taskList.push({ entryMethod, fact });
            }
        }

        const tasks = taskList.map(({ entryMethod, fact }) =>
            limit(async () => {
                const reason = fact.reason;
                let combinedMarkedCode = "";

                for (const fileName in fact.pathSummary) {
                    const targetFile = scene.getFiles().find(f => f.getName().endsWith(fileName));
                    if (!targetFile) return;

                    for (const className in fact.pathSummary[fileName]) {
                        const targetClass = targetFile.getClasses().find(c => c.getName() === className);
                        if (!targetClass) return;

                        for (const methodName in fact.pathSummary[fileName][className]) {
                            const targetMethod = targetClass.getMethods().find(m => m.getName() === methodName);
                            if (!targetMethod) return;

                            const lineDetails = fact.pathSummary[fileName][className][methodName];
                            const markers = new Map<number, string>();
                            lineDetails.propagationLines.forEach(lineNum => markers.set(lineNum, "[Propagation Path]"));
                            if (lineDetails.sinkLine !== null) {
                                markers.set(lineDetails.sinkLine, `[${reason}]`);
                            }

                            const markedCode = this.markMethodCode(targetMethod, markers);
                            combinedMarkedCode += `// --- FILE: ${fileName} | CLASS: ${className} | METHOD: ${methodName} ---\n`;
                            combinedMarkedCode += `${markedCode}\n\n`;
                        }
                    }
                }

                if (combinedMarkedCode) {
                    console.log("========================================");
                    console.log(`漏洞 FACT (原因: ${reason})`);
                    console.log("----------------------------------------");
                    console.log(combinedMarkedCode.trim());
                    console.log("========================================\n");

                    const filledPrompt = `
    **Task:** Based on the code context and static analysis error information I provide, please carefully analyze and verify whether the reported error is a **True Positive** or a **False Positive**. The erroneous line of code is indicated by \`// ALERT-ERROR\`.
    
    **Important Note about Non-null Assertion Operator (!):**
    The non-null assertion operator (!) in TypeScript/ArkTS only suppresses compile-time null/undefined checks. It does NOT guarantee that the value is actually non-null at runtime. Using ! on a potentially null/undefined value can still cause runtime errors, making it a true positive vulnerability.
    
    **Requirements:**
    1.  **Analyze the Code:** Thoroughly analyze the logic, data flow, and control flow of the provided code.
    2.  **Determine the Type:** Clearly state whether the warning is a "True Positive" or a "False Positive".
    3.  **Explain the Reason:** Provide a detailed explanation for your judgment. If you believe it's a false positive, explain why the static analysis tool might have made a mistake. If you believe it's a true positive, describe the conditions under which the vulnerability or error would be triggered.
    4.  **Answer Requirement:** Answer in a concise manner, no more than 200 words.
    
    **[Input Information]**
    
    **1. Static Analysis Error Information:**
    * **Error Description:** \`${fact.reason}\`
    
    **2. Code Context:**
    \`\`\`typescript
    ${combinedMarkedCode.trim()}
    \`\`\`
    
    **3. Output Format:**
    \`\`\`json
    {
        "analysis": "analysis",
        "reason": "reason",
        "answer": "true/false positive"
    }
    \`\`\`
    `;
                    
                    const result = await this.processPrompt(filledPrompt);
                    console.log(result);

                    // 收集需要删除的项目，而不是立即删除
                    if (result.answer?.toLowerCase() === 'false positive') {
                        if (!toDelete.has(entryMethod)) {
                            toDelete.set(entryMethod, []);
                        }
                        toDelete.get(entryMethod)!.push(fact);
                        console.log(`📝 标记删除 ${entryMethod} 中的 false positive 报告`);
                    }
                }
            })
        );

        // 等待所有并发任务完成
        await Promise.all(tasks);
        // 统一处理删除操作
        console.log("\n--- 开始统一删除 false positive 报告 ---");
        for (const [entryMethod, factsToDelete] of toDelete) {
            const reports = reportManager.map.get(entryMethod);
            if (reports && Array.isArray(reports)) {
                let deletedCount = 0;
                
                // 从后往前删除，避免索引变化问题
                for (let i = reports.length - 1; i >= 0; i--) {
                    const report = reports[i];
                    const factName = (report.fact instanceof Local)
                        ? report.fact.getName()
                        : report.fact.getType().toString();
                    
                    // 检查是否在删除列表中
                    const shouldDelete = factsToDelete.some(fact => 
                        factName === fact.factVariable &&
                        report.reason === fact.reason &&
                        report.node.toString() === fact.node &&
                        report.line === fact.line
                    );
                    
                    if (shouldDelete) {
                        reports.splice(i, 1);
                        deletedCount++;
                    }
                }
                
                console.log(`✅ 删除 ${entryMethod} 中 ${deletedCount} 个 false positive 报告`);
            }
        }
        
        console.log("LLM 消除误报完成");
    }

    async processReportNormally(scene: Scene, reportManager: NPDReportManager) {
        const processedReport = this.processReportManager(reportManager);
        console.log("\n--- 提取并合并报告中方法的代码 ---");

        for (const entryMethod in processedReport) {
            // 外层循环：遍历每一个 fact
            for (let factIndex = processedReport[entryMethod].length - 1; factIndex >= 0; factIndex--) {
                const fact = processedReport[entryMethod][factIndex];
                const reason = fact.reason; 
                let combinedMarkedCode = "";

                for (const fileName in fact.pathSummary) {
                    const targetFile = scene.getFiles().find(f => f.getName().endsWith(fileName));
                    if (!targetFile) {
                        console.warn(`警告: 在场景中未找到文件 ${fileName}`);
                        continue;
                    }

                    for (const className in fact.pathSummary[fileName]) {
                        const targetClass = targetFile.getClasses().find(c => c.getName() === className);
                        if (!targetClass) {
                            console.warn(`警告: 在文件 ${fileName} 中未找到类 ${className}`);
                            continue;
                        }
                        
                        for (const methodName in fact.pathSummary[fileName][className]) {
                            const targetMethod = targetClass.getMethods().find(m => m.getName() === methodName);
                            if (!targetMethod) {
                                console.warn(`警告: 在类 ${className} 中未找到方法 ${methodName}`);
                                continue;
                            }

                            const lineDetails = fact.pathSummary[fileName][className][methodName];
                            
                            const markers = new Map<number, string>();
                            lineDetails.propagationLines.forEach(lineNum => {
                                markers.set(lineNum, "[Propagation Path]");
                            });
                            if (lineDetails.sinkLine !== null) {
                                markers.set(lineDetails.sinkLine, `[${reason}]`);
                            }

                            const markedCode = this.markMethodCode(targetMethod, markers);

                            combinedMarkedCode += `// --- FILE: ${fileName} | CLASS: ${className} | METHOD: ${methodName} ---\n`;
                            combinedMarkedCode += `${markedCode}\n\n`; // 使用两个换行符分隔不同的方法
                        }
                    }
                }

                if (combinedMarkedCode) {
                    console.log("========================================");
                    console.log(`漏洞 FACT (原因: ${fact.reason})`);
                    console.log("----------------------------------------");
                    console.log(combinedMarkedCode.trim());
                    console.log("========================================\n");
                    
                    // 构建包含具体错误信息和代码的prompt
                    const filledPrompt = `
    **Task:** Based on the code context and static analysis error information I provide, please carefully analyze and verify whether the reported error is a **True Positive** or a **False Positive**. The erroneous line of code is indicated by \`// ALERT-ERROR\`.

    **Important Note about Non-null Assertion Operator (!):**
    The non-null assertion operator (!) in TypeScript/ArkTS only suppresses compile-time null/undefined checks. It does NOT guarantee that the value is actually non-null at runtime. Using ! on a potentially null/undefined value can still cause runtime errors, making it a true positive vulnerability.

    **Requirements:**
    1.  **Analyze the Code:** Thoroughly analyze the logic, data flow, and control flow of the provided code.
    2.  **Determine the Type:** Clearly state whether the warning is a "True Positive" or a "False Positive".
    3.  **Explain the Reason:** Provide a detailed explanation for your judgment. If you believe it's a false positive, explain why the static analysis tool might have made a mistake. If you believe it's a true positive, describe the conditions under which the vulnerability or error would be triggered.
    4.  **Answer Requirement:** Answer in a concise manner, no more than 200 words.

    **[Input Information]**

    **1. Static Analysis Error Information:**
    * **Error Description:** \`${fact.reason}\`

    **2. Code Context:**
    \`\`\`typescript
    ${combinedMarkedCode.trim()}
    \`\`\`

    **3. Output Format:**
    \`\`\`json
    {
        "analysis": "analysis",
        "reason": "reason",
        "answer": "true/false positive"
    }
    \`\`\`
    `;
                    const result = await this.processPrompt(filledPrompt);
                    console.log(result);
                    
                    // 如果判断为false positive，从原始数据中删除对应的fact
                    if (result.answer?.toLowerCase() === 'false positive') {
                        const reports = reportManager.map.get(entryMethod);
                        if (reports && Array.isArray(reports)) {
                            // 🛡️ 精准匹配目标
                            const targetIndex = reports.findIndex((report: NPDReport) => {
                                const factName = (report.fact instanceof Local)
                                    ? report.fact.getName()
                                    : report.fact.getType().toString();
                                return factName === fact.factVariable &&
                                    report.reason === fact.reason &&
                                    report.node.toString() === fact.node;
                            });

                            if (targetIndex !== -1) {
                                reports.splice(targetIndex, 1); // ✅ 只删除精准匹配项
                                console.log(`✅ 删除 ${entryMethod} 中第 ${targetIndex + 1} 个 false positive 报告`);
                            } else {
                                console.warn("⚠️ 未找到匹配项，跳过删除");
                            }
                        }
                    }
                }
            }
        }
        console.log("LLM 消除误报完成");
    }

    testLLM() {
        console.log("开始测试 LLMFilter...");
        this.processPrompt("Hello, world!").then(response => {
            console.log("LLM 响应:", response)});
    }
}
