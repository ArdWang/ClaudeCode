@echo off
set CLAUDE_CODE_GIT_BASH_PATH=E:\Project\software\git\Git\bin\bash.exe
set ANTHROPIC_AUTH_TOKEN=你的-API-Token-请替换此处
set ANTHROPIC_BASE_URL=https://coding.dashscope.aliyuncs.com/apps/anthropic
set ANTHROPIC_MODEL=qwen3.5-plus
npx @anthropic-ai/claude-code
