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
