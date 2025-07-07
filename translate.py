import os
import sys
import json
import pandas as pd
from dotenv import load_dotenv
from openai import OpenAI
import time

load_dotenv()

client = OpenAI(
    base_url=os.getenv("GEMINI_BASE_URL"),
    api_key=os.getenv("GEMINI_API_KEY")
)

prompt = """
# **Role**
You are an expert software engineer, proficient in both Java and ArkTS, specializing in precise code analysis and cross-language translation.

# **Task**
Your task is to accurately translate the provided Java source code into ArkTS, identify the type of any potential null pointer errors, and return the result in JSON format.

# **Core Directives**
You must strictly follow these four core directives:

1.  **Identify and Classify Null Pointer Errors:**
    *   When analyzing the Java code, you must identify the operational category of the potential Null Pointer Dereference within its `bad()` method.
    *   You must choose the most accurate category from the following predefined list:
        *   `"Method Call"`
        *   `"Field Access"`
        *   `"Array Element Access"`
        *   `"Array Length Access"`
    *   If there is no apparent null pointer risk in the `bad()` method, set this category to `"None"`.

2.  **Preserve Program Logic and Bugs:**
    *   Your translation must be completely faithful to the original Java code's logic, replicating the flaw in the `bad()` method.
    *   **Do not** attempt to fix or improve the original code's behavior in any way.

3.  **Adapt Comments for ArkTS Context:**
    *   You must migrate all comments from the original Java code.
    *   **Crucially, you must rewrite comments that explain Java-specific behavior to fit the ArkTS context.** Do not simply state "In Java, it was X...". Instead, explain the *purpose* of the code in ArkTS.
    *   For example, instead of `// In Java, this method could return null. In ArkTS, we simulate this...`, write `// To replicate the original logic, we simulate a scenario where this value could be null.` The final comment should be natural for an ArkTS developer to read, without needing Java knowledge.

4.  **Translate Imports from a Specific Path, Do Not Recreate Dependencies:**
    *   You must translate Java `import` statements into the equivalent ArkTS `import` statements.
    *   **Crucially, if the code uses `IO`, `AbstractTestCase`, or `AbstractTestCaseBase`, you must import them from the relative path `'./testcasesupport'`.** For example, the generated import should look like: `import {{ IO, AbstractTestCase, AbstractTestCaseBase }} from './testcasesupport';`
    *   **Do not generate the source code for these specific imported classes.** Assume they are available from the specified module path. Your task is to translate only the main class defined in the snippet.

# **Input and Output Format**

*   **Input**: I will provide a complete snippet of Java code.
*   **Output**: Your output **must** be a single, RFC 8259 compliant JSON object, without any Markdown formatting or explanatory text. This JSON object must contain the following two keys:
    *   `"errorType"`: (String) The null pointer error category selected from the list in the directives.
    *   `"arktsCode"`: (String) The complete, translated ArkTS code. **Important: All special characters like `"` and `\\` inside this string must be properly escaped (as `\\"` and `\\\\`) to ensure valid JSON.**

### **Output Example**
```json
{{
  "errorType": "Method Call",
  "arktsCode": "..."
}}
```
---

**Now, please translate the following Java code and provide the output as specified:**
```java
{java_code}
```
"""

def main():
    if len(sys.argv) < 2:
        print("请提供一个包含多个项目文件夹的父文件夹路径作为参数。")
        print("用法: python translate.py <parent_folder_path>")
        sys.exit(1)

    parent_folder_path = sys.argv[1]
    if not os.path.isdir(parent_folder_path):
        print(f"错误: '{parent_folder_path}' 不是一个有效的文件夹路径。")
        sys.exit(1)

    try:
        subdirectories = [f.path for f in os.scandir(parent_folder_path) if f.is_dir()]
    except FileNotFoundError:
        print(f"错误: 文件夹 '{parent_folder_path}' 未找到。")
        sys.exit(1)

    if not subdirectories:
        print(f"在 '{parent_folder_path}' 中没有找到任何子文件夹。")
        return

    print(f"找到 {len(subdirectories)} 个子文件夹，将开始批量处理...")

    # Use a dictionary for aggregation and pre-load existing Excel data
    aggregated_results = {}
    excel_output_path = os.path.join('benchmark', 'translation_results.xlsx')
    if os.path.exists(excel_output_path):
        try:
            print(f"找到现有的Excel文件: {excel_output_path}，将合并结果。")
            existing_df = pd.read_excel(excel_output_path)
            # By converting columns to a standard Python set, we resolve type ambiguity for the linter.
            existing_columns = set(existing_df.columns)
            if 'Error Type' in existing_columns and 'File Names' in existing_columns:
                for _, row in existing_df.iterrows():
                    # Ensure error_type from Excel is a string to prevent mixed types
                    error_type = str(row['Error Type'])
                    filenames_str = str(row['File Names'])
                    if error_type not in aggregated_results:
                        aggregated_results[error_type] = []
                    existing_files = [f.strip() for f in filenames_str.split(',') if f.strip()]
                    for f in existing_files:
                        if f not in aggregated_results[error_type]:
                            aggregated_results[error_type].append(f)
            else:
                print(f"警告: Excel文件格式不正确（缺少 'File Names' 列），将被覆盖。")
        except Exception as e:
            print(f"警告: 读取现有Excel文件时出错: {e}。文件将被覆盖。")

    # --- Main processing loop ---
    for folder_path in subdirectories:
        try:
            folder_name = os.path.basename(os.path.normpath(folder_path))
            output_filename = f"{folder_name}.ets"
            output_file_path = os.path.join('benchmark', output_filename)

            if os.path.exists(output_file_path):
                print(f"文件 '{output_filename}' 已存在，跳过处理 '{folder_name}'。")
                continue

            print("-" * 30)
            print(f"正在处理: {folder_name}")

            # 1. Determine search path and read Java code
            java_source_base_path = os.path.join(folder_path, 'src', 'main', 'java')
            
            if not os.path.isdir(java_source_base_path):
                print(f"警告: 在 '{folder_name}' 中找不到 'src/main/java' 目录，跳过。")
                continue

            testcases_path = os.path.join(java_source_base_path, 'testcases')

            search_path = ""
            if os.path.isdir(testcases_path):
                search_path = testcases_path
                print("在 'src/main/java' 中找到 'testcases' 目录，将仅翻译该目录中的代码。")
            else:
                search_path = java_source_base_path
                print("未找到 'testcases' 目录，将翻译 'src/main/java' 中的所有代码。")

            java_code_parts = []
            for root, _, files in os.walk(search_path):
                for file in files:
                    if file.endswith(".java"):
                        file_path = os.path.join(root, file)
                        with open(file_path, 'r', encoding='utf-8') as f:
                            java_code_parts.append(f.read())

            if not java_code_parts:
                print(f"在指定目录 '{os.path.basename(search_path)}' 中没有找到 .java 文件，跳过。")
                continue

            java_code = "\n\n".join(java_code_parts)

            # 2. Call AI for translation and parse with retries
            max_retries = 3
            arkts_code = None
            error_type = None
            response_content = ""

            for attempt in range(max_retries):
                try:
                    print(f"正在向AI发送请求 (尝试次数 {attempt + 1}/{max_retries})...")
                    response = client.chat.completions.create(
                        model="gemini-2.5-flash",
                        messages=[{"role": "user", "content": prompt.format(java_code=java_code)}]
                    )
                    response_content = response.choices[0].message.content
                    if response_content is None:
                        print("错误：AI未返回任何内容。")
                        if attempt < max_retries - 1:
                            print("稍后重试...")
                            time.sleep(3)
                        continue

                    # Parse response
                    if response_content.strip().startswith("```json"):
                        response_content = response_content.strip()[7:-3].strip()
                    
                    data = json.loads(response_content)
                    arkts_code_candidate = data.get("arktsCode")
                    if arkts_code_candidate is None:
                        print("错误：AI响应中未找到 'arktsCode'。")
                        if attempt < max_retries - 1:
                            print("稍后重试...")
                            time.sleep(3)
                        continue
                    
                    # Success
                    arkts_code = arkts_code_candidate
                    error_type = data.get("errorType")
                    print("解析成功。")
                    break  # Exit retry loop

                except json.JSONDecodeError:
                    print(f"错误：无法解析AI返回的JSON响应。")
                    if attempt < max_retries - 1:
                        print("稍后重试...")
                except Exception as e:
                    print(f"调用AI或处理时发生未知错误: {e}")
                    if attempt < max_retries - 1:
                        print("稍后重试...")

            if arkts_code is None:
                print(f"最终未能成功处理文件夹 '{folder_name}'，跳过。")
                if response_content:
                    print("最后一次失败的响应内容:", response_content)
                continue
            
            # 4. Update aggregated results in memory
            # Ensure error_type from AI is a string to prevent mixed-type key errors
            str_error_type = str(error_type) if error_type is not None else "None"
            if str_error_type not in aggregated_results:
                aggregated_results[str_error_type] = []
            if output_filename not in aggregated_results[str_error_type]:
                aggregated_results[str_error_type].append(output_filename)
            
            # 5. Write .ets file
            os.makedirs(os.path.dirname(output_file_path), exist_ok=True)
            with open(output_file_path, 'w', encoding='utf-8') as f:
                f.write(arkts_code)
            
            print(f"ArkTS 代码已成功保存到: {output_file_path}")
            if error_type:
                print(f"检测到的错误类型: {error_type}")

        except Exception as e:
            # This outer catch is now for truly unexpected errors like file read permission issues.
            print(f"处理文件夹 '{folder_name}' 时发生无法恢复的严重错误: {e}")
            continue

    # --- After loop, process dictionary and save final Excel file ---
    if not aggregated_results:
        print("-" * 30)
        print("处理完成，但没有可保存到Excel的结果。")
        return

    final_data_list = []
    # Sort by keys converted to strings to ensure consistent ordering
    for error_type, filenames in sorted(aggregated_results.items(), key=lambda item: str(item[0])):
        final_data_list.append({
            'Error Type': error_type,
            'File Names': ','.join(sorted(filenames))
        })
    
    final_df = pd.DataFrame(final_data_list)

    try:
        os.makedirs(os.path.dirname(excel_output_path), exist_ok=True)
        final_df.to_excel(excel_output_path, index=False)
        print("-" * 30)
        print(f"所有文件夹处理完毕。最终结果已保存到 {excel_output_path}")
    except Exception as e:
        print(f"错误：将最终结果写入Excel文件时发生错误: {e}")

if __name__ == "__main__":
    main()