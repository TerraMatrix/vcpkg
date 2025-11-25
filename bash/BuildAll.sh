#!/bin/bash

# 设置工作目录
cd "$(dirname "$0")/.."

# 设置代理（如果需要）
# export http_proxy=http://127.0.0.1:7890
# export https_proxy=http://127.0.0.1:7890

echo "========== 初始化 vcpkg 环境 =========="
./vcpkg.exe --x-install-root=./installed --x-packages-root=./packages --vcpkg-root=./

# 定义要构建的 port 列表
PORTS=(
    "boost"
    "fmt"
    "sltbench"
    "freetype"
    "hdf5"
    "flann"
    "glm"
    "gtest"
    "glew"
    "gmp"
    "cereal"
    "gsl"
    "openni2"
    "openexr"
    "pybind11"
    "ceres"
    "curl"
    "proj"
    "libgeotiff"
    "liblas"
    "mcc-lidar"
    "crunch"
    "libkml"
    "xerces-c"
    "libxml2"
    "libpq"
    "lastools"
    "poppler"
    "gdal"
    "pdal"
    "qt5"
    "glib"
    "ilmbase"
    "fontconfig"
    "ffmpeg"
    "cgal"
    "pcl"
    "opencv4"
    "osg"
    "osg-qt"
    "leveldb"
    "grpc"
    "shapelib"
    "vcglib"
    "pugixml"
    "nlohmann-json"
    "highway"
    "skia"
    "qgis"
)

# 统计变量
TOTAL_PORTS=${#PORTS[@]}
SUCCESS_COUNT=0
FAILED_COUNT=0
FAILED_PORTS=()

echo "========== 开始构建 $TOTAL_PORTS 个 ports =========="
echo "开始时间: $(date '+%Y-%m-%d %H:%M:%S')"

# 依次构建每个 port
for i in "${!PORTS[@]}"; do
    PORT="${PORTS[$i]}"
    PORT_NUM=$((i + 1))

    echo ""
    echo "========== [$PORT_NUM/$TOTAL_PORTS] 构建 $PORT =========="
    echo "开始时间: $(date '+%Y-%m-%d %H:%M:%S')"

    # 创建日志目录
    mkdir -p "buildtrees/$PORT"

    # 执行构建脚本
    if [ -f "bash/$PORT.sh" ]; then
        bash "bash/$PORT.sh" 2>&1 | tee "buildtrees/$PORT/autobuild.log"
        BUILD_RESULT=${PIPESTATUS[0]}

        if [ $BUILD_RESULT -eq 0 ]; then
            echo "========== $PORT 构建成功 =========="
            ((SUCCESS_COUNT++))
        else
            echo "========== $PORT 构建失败 =========="
            echo "日志文件: buildtrees/$PORT/autobuild.log"
            ((FAILED_COUNT++))
            FAILED_PORTS+=("$PORT")
        fi
    else
        echo "错误: bash/$PORT.sh 文件不存在"
        echo "========== $PORT 跳过 =========="
        ((FAILED_COUNT++))
        FAILED_PORTS+=("$PORT (脚本不存在)")
    fi

    echo "当前进度: 成功 $SUCCESS_COUNT, 失败 $FAILED_COUNT"
done

echo ""
echo "========== 构建完成报告 =========="
echo "结束时间: $(date '+%Y-%m-%d %H:%M:%S')"
echo "总计: $TOTAL_PORTS 个 ports"
echo "成功: $SUCCESS_COUNT 个"
echo "失败: $FAILED_COUNT 个"

if [ $FAILED_COUNT -gt 0 ]; then
    echo "失败的 ports:"
    for FAILED_PORT in "${FAILED_PORTS[@]}"; do
        echo "  - $FAILED_PORT"
    done
fi

echo "构建日志保存在 buildtrees/*/autobuild.log"

# 退出码
if [ $FAILED_COUNT -eq 0 ]; then
    echo "所有 ports 构建成功!"
    exit 0
else
    echo "有 $FAILED_COUNT 个 ports 构建失败"
    exit 1
fi