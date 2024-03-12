#!/bin/bash

# 当前应用程序所在路径
current_dir="$(pwd)"

# 程序路径
program_path="$(pwd)/vcpkg"

# 确保应用程序是可执行的
chmod +x "$program_path"

export VCPKG_FORCE_SYSTEM_BINARIES=1

# 启动程序并传递命令行参数
"$program_path" "$@"
