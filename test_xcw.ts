import { SceneConfig } from "./src/Config";
import { Scene } from "./src/Scene";
import fs from 'fs';
import path from 'path';
import OpenAI from 'openai';
import dotenv from 'dotenv';

// 加载.env文件配置
dotenv.config();

const apiKey = process.env.GENERAL_API_KEY ?? "";
const model = process.env.GENERAL_MODEL ?? "";
const baseUrl = process.env.GENERAL_BASE_URL ?? "";


// 使用 buildFromProjectDir 构建配置
const projectDir = "/Users/xiachangwei/ArkAnalyzer/apps/demo";
let config: SceneConfig = new SceneConfig();
config.buildFromProjectDir(projectDir);

// 构建场景
let scene: Scene = new Scene();
scene.buildSceneFromProjectDir(config);

// 类型推断
scene.inferTypes();

let file_name = "test.ets";
let row = 10;
let error_type: string = "Null pointer dereference";
let error_info: string = "Potential runtime empty pointer access.";
let code = "";
let markedCode = "";

// 打印所有文件名
// scene.getFiles().forEach(file => {
//     console.log(file.getName());
// });

// 根据文件名查找对应的文件
const targetFile = scene.getFiles().find(file => file.getName().includes(file_name));
if (!targetFile) {
    throw new Error(`File ${file_name} not found`);
}

// 使用找到的文件对象进行后续操作
console.log("找到文件:", targetFile.getName());

// 组合完整文件路径
const fullPath = path.join(projectDir, file_name);

// 同步读取文件内容
try {
    const content = fs.readFileSync(fullPath, 'utf-8');
    const lines = content.split('\n').map(line => line.trim());
    code = lines[row - 1];
    if (row < 1 || row > lines.length) {
        throw new Error(`行号 ${row} 超出范围（1-${lines.length}）`);
    }
    
    console.log(`文件 ${file_name} 第 ${row} 行内容：`, code);
} catch (error) {
    // 类型安全处理
    if (error instanceof Error) {
        console.error('文件读取失败：', error.message);
    } else {
        console.error('发生未知错误：', String(error));
    }
}

// 重新读取原始文件内容（保留格式）
// const rawContent = fs.readFileSync(fullPath, 'utf-8');
// const rawLines = rawContent.split('\n');

// 遍历文件中的类
targetFile.getClasses().forEach(arkClass => {
    // console.log("--------------------------------");
    // console.log("类名：", arkClass.getName());
    // console.log("--------------------------------");

    if(arkClass.getName() === "%dflt"){
        arkClass.getMethods().forEach(method => {
            let method_code = method.getCode();
            if (method_code) {
                // console.log("方法名：", method.getName());
                let method_code_start_line = method.getLine() ?? 0;
                let method_code_total_lines = analyzeCodeLines(method_code).totalLines;
                // console.log("method_code_start_line: ", method_code_start_line);
                // console.log("method_code_total_lines: ", method_code_total_lines);
                // console.log("方法代码：", method_code);
                if (method_code.includes(code) && method_code_start_line <= row && method_code_start_line + method_code_total_lines >= row) {
                    // console.log("方法名：", method.getName());
                    if (!method.getName().includes("%")){
                        // console.log("方法名：", method.getName());
                        markedCode = method_code.split('\n')
                        .map((line, index) => {
                            const currentLine = method_code_start_line + index;
                            return currentLine === row ? `${line} // <<< 目标行` : line;
                        })
                        .join('\n');
                    
                    // console.log("代码上下文（标记目标行）：\n", markedCode);
                        
                    }
                }
            }
        });
    } else {
        let class_code = arkClass.getCode();
        if (class_code) {
            let class_code_start_line = arkClass.getLine();
            let class_code_total_lines = analyzeCodeLines(class_code).totalLines;
            if (class_code.includes(code) && class_code_start_line <= row && class_code_start_line + class_code_total_lines >= row) {
                if (!arkClass.getName().includes("%")){
                    markedCode = class_code.split('\n')
                        .map((line, index) => {
                            const currentLine = class_code_start_line + index;
                            return currentLine === row ? `${line} // ALERT-ERROR` : line;
                        })
                        .join('\n');
                    
                    // console.log("代码上下文（标记目标行）：\n", markedCode);
                }
            }
        }
    }
});

interface CodeLineStats {
    totalLines: number;
    codeLines: number;
    commentLines: number;
    emptyLines: number;
}

function analyzeCodeLines(code: string): CodeLineStats {
    const lines = code.split(/\r?\n/);
    return lines.reduce((stats, line) => {
        stats.totalLines++;
        const trimmed = line.trim();
        if (!trimmed) {
            stats.emptyLines++;
        } else if (trimmed.startsWith('//') || trimmed.startsWith('/*')) {
            stats.commentLines++;
        } else {
            stats.codeLines++;
        }
        return stats;
    }, { totalLines: 0, codeLines: 0, commentLines: 0, emptyLines: 0 });
}

const prompt: string = `
**Task:** Based on the code context and static analysis error information I provide, please carefully analyze and verify whether the reported error is a **True Positive** or a **False Positive**. The erroneous line of code is indicated by \`// ALERT-ERROR\`.

**Requirements:**
1.  **Analyze the Code:** Thoroughly analyze the logic, data flow, and control flow of the provided code.
2.  **Determine the Type:** Clearly state whether the warning is a "True Positive" or a "False Positive".
3.  **Explain the Reason:** Provide a detailed explanation for your judgment. If you believe it's a false positive, explain why the static analysis tool might have made a mistake. If you believe it's a true positive, describe the conditions under which the vulnerability or error would be triggered.
4.  **Answer Requirement:** Answer in a concise manner, no more than 200 words.

**[Input Information]**

**1. Static Analysis Error Information:**
* **Error Type:** \`${error_type}\`
* **Error Description:** \`${error_info}\`

**2. Code Context:**
\`\`\`typescript
${markedCode}
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

const openai = new OpenAI({
  apiKey: apiKey,
  baseURL: baseUrl,
});


// New function to process a single prompt
async function processSinglePrompt(prompt: string): Promise<any> {
    const chatCompletion = await openai.chat.completions.create({
        model: model,
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

// Main function to process multiple prompts concurrently
async function processPrompts(prompts: string[]): Promise<any[]> {
    // Create an array of promises for concurrent processing
    const promises = prompts.map(prompt => 
        processSinglePrompt(prompt).catch(error => {
            console.error(`Error processing prompt: ${error.message}`);
            return null; // Return null for failed requests
        })
    );

    // Process all prompts concurrently
    return Promise.all(promises);
}

async function main() {
    // Example usage with multiple prompts
    const prompts = [
        prompt,
    ];

    const results = await processPrompts(prompts);
    
    // Process and log results
    results.forEach((result, index) => {
        if (result) {
            console.log(`Result for prompt ${index + 1}:`);
            console.log("answer: ", result.answer);
            console.log("analysis: ", result.analysis);
            console.log("reason: ", result.reason);
            console.log("--------------------------------");
        }
    });
}

main().catch(console.error);

