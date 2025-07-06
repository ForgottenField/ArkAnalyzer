# 项目说明

本项目为参加第二届中国研究生操作系统开源创新大赛的调试项目，仅用于学习用途。

原项目仓库指路：[ArkAnalyzer](https://gitcode.com/openharmony-sig/arkanalyzer)。

# 环境配置

1. 从[Download Visual Studio Code](https://code.visualstudio.com/download)下载vscode并安装，或安装其他IDE。
2. 从[Download Node.js](https://nodejs.org/en/download/current)下载Node.js并安装，Node.js为JavaScript的运行时环境，自带包管理器npm。
3. 通过npm安装TypeScript编译器，命令行输入
```shell
npm install -g typescript
```
4. 安装依赖库
```shell
npm install
```
5. 注意千万不要运行`npm audit`指令，会导致依赖包发生变化：
```shell
npm audit fix --force
```

# 运行空指针检查器（Null Pointer Dereference Checker）

1. 导航到`tests\samples\UndefinedVariableTest.ts`文件.
2. 通过`config.buildFromProjectDir`指定待测项目.
```ts
config.buildFromProjectDir("tests/resources/ifds/UndefinedVariable");
```
3. 指定分析所需的入口方法。
```ts
const defaultMethod = scene.getFiles()[0].getDefaultClass().getDefaultArkMethod();
let method = ModelUtils.getMethodWithName("u4",defaultMethod!);
```
4. 运行检查器
```shell
npm run nulltest
```
5. 导航到`output/report.json`文件，检查分析结果