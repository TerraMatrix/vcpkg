# 获取脚本所在目录
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

# 指定要查找的目录路径
search_dir="$SCRIPT_DIR"

LIGHT_CYAN='\033[0;96m'   # 亮青色
LIGHT_YELLOW='\033[0;93m' # 亮黄色
LIGHT_RED='\033[0;91m'     # 亮红色
LIGHT_GREEN='\033[0;92m'   # 亮绿色
LIGHT_BLUE='\033[0;94m'    # 亮蓝色
NC='\033[0m'              # 重置颜色（无颜色）

cd "$SCRIPT_DIR"

# 使用 find 命令查找所有 .a 或 .so 文件，并逐个处理
# find "$search_dir" -type f \( -name "*.a" -o -name "*.so" \) | while read -r file; do
# 使用 find 命令查找所有文件，并逐个处理

# 指定要跳过的文件夹的名称，多个名称使用 -o 连接
skip_dirs=(".git" ".github" ".svn" "buildtrees")

# 使用 find 命令进行遍历，跳过指定文件夹
find "$search_dir" -type d \( -name "${skip_dirs[0]}" -o -name "${skip_dirs[1]}" -o -name "${skip_dirs[2]}" -o -name "${skip_dirs[3]}" \) -prune -o -type f -print | while read -r file; do
  relative_path=$(realpath --relative-to="$SCRIPT_DIR" "$file")

  echo -e "${LIGHT_CYAN}relative_path:${NC} ${LIGHT_YELLOW}$relative_path${NC}"

  status=$(svn add "$relative_path" 2>&1)

  if ! [[ "$status" == *"svn: warning"* ]]; then
    echo -e "${LIGHT_GREEN}Added${NC} ${LIGHT_BLUE}$file${NC} ${LIGHT_GREEN}to version control${NC}"
    svn commit -m "Add file $relative_path to repository"
  fi

done

svn commit -m "Add all files to repository"
echo "Finished!"


