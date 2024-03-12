#!/bin/bash

# 获取脚本所在目录
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

# 切换到脚本所在目录
cd "$SCRIPT_DIR"

# 保存 ./vcpkg list的结果
list_result="$(./vcpkg list)"

function find_dependency() {
  local dependency_library_name="$1" #需要查找被依赖库的名

  if [[ $# -ne 1 ]]; then
    # 参数不为1个时，输出错误提示，使用红色
    echo -e "\033[31mError: Please provide exactly 1 dependency library name.\033[0m"
    exit 1
  fi

  # 逐行处理 list_result 结果
  while IFS= read -r line; do
    # 提取第一个空格前的字符串作为库名
    library_name=$(echo "$line" | cut -d' ' -f1)

    # 运行 ./vcpkg depend-info 命令并查找指定字符
    depend_info_result=$(./vcpkg depend-info "$library_name")
    if [[ $depend_info_result == *"$dependency_library_name"* ]]; then
      # 输出绿色结果
      echo -e "\033[32mFound $library_name depend on\033[0m \033[36m$dependency_library_name\033[0m."
    else
      echo -e "\033[33m$library_name\033[0m does not depend on \033[36m$dependency_library_name\033[0m."
    fi
  done <<<"$list_result"
  echo -e "\033[33m Search Finished! \033[0m."
}

find_dependency "$1"
