# 获取脚本所在目录
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

# 全局变量
LIGHT_CYAN='\033[0;96m'   # 亮青色
LIGHT_YELLOW='\033[0;93m' # 亮黄色
LIGHT_RED='\033[0;91m'    # 亮红色
LIGHT_GREEN='\033[0;92m'  # 亮绿色
LIGHT_BLUE='\033[0;94m'   # 亮蓝色
NC='\033[0m'              # 重置颜色（无颜色）
SKIP_DIRS=(".git" ".github" ".svn" "buildtrees")

# 函数：遍历指定文件夹，将子文件存储在数组 file_array，子文件夹存储在数组 dir_array
# 参数 $1：指定的文件夹路径
# 参数 $2：存储子文件的数组名称
# 参数 $3：存储子文件夹的数组名称
function traverse_specified_folder() {

  local folder="$1"
  local file_array="$2"
  local dir_array="$3"

  # 清空数组
  eval "$file_array=()"
  eval "$dir_array=()"

  # 遍历文件夹
  for entry in "$folder"/*; do
    if [ -f "$entry" ]; then
      # 如果是文件，则将其添加到文件数组中
      eval "$file_array+=(\"$entry\")"
    elif [ -d "$entry" ]; then
      # 如果是文件夹，则将其添加到文件夹数组中
      eval "$dir_array+=(\"$entry\")"
    fi
  done
}

# 函数：提交指定文件夹内直接子文件的修改（不递归子目录）
# 参数 $1：指定的文件夹路径
function commit_specified_folder() {
  local current_directory="$1"

  cd "$SCRIPT_DIR"

  # 获取当前目录下的文件状态
  local svn_status=$(svn status "$current_directory" --depth files)

  # 使用换行符分割状态结果
  IFS=$'\n'
  for line in $svn_status; do
    # 获取文件状态和文件路径
    local status="${line:0:1}"
    local file=$(echo "$line" | awk '{ print $2 }')
    local relative_file=$(realpath --relative-to="$SCRIPT_DIR" "$file")

    case "$status" in
    "M")
      # 修改的文件
      echo -e "${LIGHT_CYAN}Modified file:${NC} ${LIGHT_YELLOW}$relative_file${NC}"
      svn commit -m "Modified: $relative_file" "$file"
      ;;
    "D" | "!")
      # 删除的文件
      svn delete "$file"
      echo -e "${LIGHT_CYAN}Delete file:${NC} ${LIGHT_YELLOW}$relative_file${NC}"
      svn commit -m "Delete: $relative_file" "$file"
      ;;
    "A" | "?")
      # 新增的文件或未加入版本控制的文件
      svn add "$file"
      echo -e "${LIGHT_CYAN}Add file:${NC} ${LIGHT_YELLOW}$relative_file${NC}"
      svn commit -m "Add: $relative_file" "$file"
      ;;
    "L")
      # 锁定的文件
      echo -e "${LIGHT_CYAN}Locked file:${NC} ${LIGHT_YELLOW}$relative_file${NC}"
      svn unlock "$file"
      svn commit -m "Unlocked: $relative_file" "$file"
      ;;
    *) ;;
    esac
  done
}

# 函数：递归子文件夹，并完成提交操作
# 参数 $1：指定的文件夹路径
function traverse_child_folder {
  local child_folder="$1"

  local files=()
  local dirs=()

  echo -e "${LIGHT_CYAN}Traverse folder:${NC} ${LIGHT_YELLOW}$child_folder${NC}"

  traverse_specified_folder "$child_folder" "files" "dirs"

  # 提交当前目录的文件
  commit_specified_folder "$child_folder"

  for dir in "${dirs[@]}"; do
    traverse_child_folder "$dir"
  done
}

function run_sub_bash {
  local dir="$1"

  local bash_exec="C:/Program Files/Git/bin/bash.exe"
  local bash_script="$SCRIPT_DIR/svn-commit.sh"

  "$bash_exec" "$bash_script" "$dir"

  echo -e "${LIGHT_GREEN}Traverse folder${NC} ${LIGHT_BLUE}$dir${NC} ${LIGHT_GREEN}finished${NC}"
}

function main {
  local argc="$#"
  if [ $argc -eq 0 ]; then
    # 示例用法
    local folder_path="$SCRIPT_DIR"
    local files=()
    local dirs=()

    traverse_specified_folder "$folder_path" "files" "dirs"

    # 提交根目录的文件
    commit_specified_folder "$folder_path"

    for dir in "${dirs[@]}"; do
      local skip=false
      for skip_dir in "${SKIP_DIRS[@]}"; do
        if [[ "$dir" == *"$skip_dir"* ]]; then
          skip=true
          break
        fi
      done
      if [ "$skip" == "false" ]; then
        run_sub_bash "$dir" &
      fi
    done
  elif [ $argc -eq 1 ]; then
    local folder="$1"
    traverse_child_folder "$folder"
  fi
}

main "$@"
