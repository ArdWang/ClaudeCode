# Claude Code 运行配置文档

本文档记录在此项目中启动和运行 Claude Code 所需的所有配置修改。

---

## 一、环境信息

| 项目 | 值 |
|------|-----|
| 操作系统 | Windows 11 Pro |
| Node.js 版本 | v24.14.0 |
| Git 安装路径 | `E:\Project\software\git\Git` |
| 项目路径 | `E:\Project\Github\vue\ClaudeCode` |

---

## 二、新增文件

### 1. 启动脚本 `start.bat`

**文件路径：** `E:\Project\Github\vue\ClaudeCode\start.bat`

**用途：** 一键启动 Claude Code 的批处理脚本

**内容：**
```batch
@echo off
set CLAUDE_CODE_GIT_BASH_PATH=E:\Project\software\git\Git\bin\bash.exe
set ANTHROPIC_AUTH_TOKEN=你的-API-Token
set ANTHROPIC_BASE_URL=https://coding.dashscope.aliyuncs.com/apps/anthropic
set ANTHROPIC_MODEL=qwen3.5-plus
npx @anthropic-ai/claude-code
```

**使用方法：**
- 双击 `start.bat` 文件
- 或在命令行中运行 `.\start.bat`

---

## 三、环境变量配置

### 需要的环境变量

| 变量名 | 值 | 说明 |
|--------|-----|------|
| `CLAUDE_CODE_GIT_BASH_PATH` | `E:\Project\software\git\Git\bin\bash.exe` | Windows 上运行 Claude Code 必需的 Git Bash 路径 |
| `ANTHROPIC_AUTH_TOKEN` | `你的-API-Token` | API 认证 Token（阿里云 DashScope） |
| `ANTHROPIC_BASE_URL` | `https://coding.dashscope.aliyuncs.com/apps/anthropic` | 阿里云百炼平台 API 端点 |
| `ANTHROPIC_MODEL` | `qwen3.5-plus` | 使用的模型名称 |

---

## 四、PowerShell 启动命令

如果不使用批处理文件，可在 PowerShell 中直接运行：

```powershell
$env:CLAUDE_CODE_GIT_BASH_PATH='E:\Project\software\git\Git\bin\bash.exe'
$env:ANTHROPIC_AUTH_TOKEN='你的-API-Token'
$env:ANTHROPIC_BASE_URL='https://coding.dashscope.aliyuncs.com/apps/anthropic'
$env:ANTHROPIC_MODEL='qwen3.5-plus'
npx @anthropic-ai/claude-code
```

**一行命令版本：**
```powershell
$env:CLAUDE_CODE_GIT_BASH_PATH='E:\Project\software\git\Git\bin\bash.exe'; $env:ANTHROPIC_AUTH_TOKEN='你的-API-Token'; $env:ANTHROPIC_BASE_URL='https://coding.dashscope.aliyuncs.com/apps/anthropic'; $env:ANTHROPIC_MODEL='qwen3.5-plus'; npx @anthropic-ai/claude-code
```

---

## 五、权限配置

### `.claude/settings.local.json`

本地权限配置，允许运行必要的命令：

```json
{
  "permissions": {
    "allow": [
      "Bash(npm install:*)",
      "Bash(npx:*)",
      "Bash(bash:*)",
      "Bash(CLAUDE_CODE_GIT_BASH_PATH='E:\\\\Project\\\\software\\\\git\\\\Git\\\\bin\\\\bash.exe' npx:*)",
      "Bash(CLAUDE_CODE_GIT_BASH_PATH='E:\\\\Project\\\\software\\\\git\\\\Git\\\\bin\\\\bash.exe' ANTHROPIC_AUTH_TOKEN='你的-API-Token' ANTHROPIC_BASE_URL='https://coding.dashscope.aliyuncs.com/apps/anthropic' ANTHROPIC_MODEL='qwen3.5-plus' npx:*)"
    ]
  }
}
```

---

## 六、依赖安装

已安装的 npm 包：

```json
{
  "dependencies": {
    "@anthropic-ai/claude-code": "^2.1.88"
  }
}
```

**安装命令：**
```bash
npm install
```

---

## 七、故障排查

### 1. 找不到 Git Bash

错误信息：`Claude Code on Windows requires git-bash`

**解决：** 确认 `CLAUDE_CODE_GIT_BASH_PATH` 指向正确的 `bash.exe` 路径

### 2. API 认证失败

错误信息：`401 Unauthorized` 或 `Invalid API key`

**解决：** 检查 `ANTHROPIC_AUTH_TOKEN` 是否有效

### 3. 终端卡顿

**可能原因：** PowerShell 快速编辑模式

**解决：**
- 右键 PowerShell 标题栏 → 属性
- 取消勾选 "快速编辑模式"

---

## 八、配置修改历史

| 日期 | 修改内容 | 文件 |
|------|----------|------|
| 2026-04-01 | 创建启动脚本 | `start.bat` |
| 2026-04-01 | 安装依赖 | `package.json` |
| 2026-04-01 | 配置运行权限 | `.claude/settings.local.json` |

---

## 九、API 提供商信息

当前配置使用 **阿里云百炼平台 (DashScope)** 作为 API 提供商：

- **平台：** 阿里云百炼
- **端点：** `https://coding.dashscope.aliyuncs.com/apps/anthropic`
- **模型：** qwen3.5-plus

如需切换到其他提供商，修改对应的环境变量即可。
111222333
