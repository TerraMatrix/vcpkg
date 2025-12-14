#!/bin/bash

# 获取当前脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# 设置代理（如果需要）
# export http_proxy=http://127.0.0.1:7890
# export https_proxy=http://127.0.0.1:7890

echo "set -install-root and -packages-root"
./vcpkg --x-install-root=./installed --x-packages-root=./packages --vcpkg-root=./

# echo "install boost 1.86.0"
# echo "--------------------------------------------"
# ./bash/boost.sh

# echo "install fmt 11.0.2#1"
# echo "--------------------------------------------"
# ./bash/fmt.sh

# echo "install sltbench 2.4.0#3"
# echo "--------------------------------------------"
# ./bash/sltbench.sh

# echo "install freetype 2.13.3"
# echo "--------------------------------------------"
# ./bash/freetype.sh

# echo "install hdf5 1.14.4.3#3"
# echo "--------------------------------------------"
# ./bash/hdf5.sh

# echo "install flann 2019-04-07#7"
# echo "--------------------------------------------"
# ./bash/flann.sh

# echo "install glm 1.0.1#3"
# echo "--------------------------------------------"
# ./bash/glm.sh

# echo "install gtest 1.15.2"
# echo "--------------------------------------------"
# ./bash/gtest.sh

# echo "install glew 2.2.0#4"
# echo "--------------------------------------------"
# ./bash/glew.sh

# echo "install gmp 6.3.0#1"
# echo "--------------------------------------------"
# ./bash/gmp.sh

# echo "install cereal 1.3.2#1"
# echo "--------------------------------------------"
# ./bash/cereal.sh

# echo "install gsl 2.8"
# echo "--------------------------------------------"
# ./bash/gsl.sh

# echo "install openni2 2.2.0.33#15"  x
# echo "--------------------------------------------"
# ./bash/openni2.sh

# echo "install openexr 3.3.1"
# echo "--------------------------------------------"
# ./bash/openexr.sh

# echo "install pybind11 2.13.6"
# echo "--------------------------------------------"
# ./bash/pybind11.sh

# echo "install ceres 2.1.0#5" 
# echo "--------------------------------------------"
# ./bash/ceres.sh

# echo "install curl 8.11.0#1"  //
# echo "--------------------------------------------"
# ./bash/curl.sh

# echo "install proj 9.5.0"
# echo "--------------------------------------------"
# ./bash/proj.sh

# echo "install libgeotiff 1.7.3#1"
# echo "--------------------------------------------"
# ./bash/libgeotiff.sh

# echo "install liblas 1.8.1#15"  
# echo "--------------------------------------------"
# ./bash/liblas.sh

# echo "install mcc-lidar 2.1.0"  
# echo "--------------------------------------------"
# ./bash/mcc-lidar.sh

# echo "install crunch 104"  
# echo "--------------------------------------------"
# ./bash/crunch.sh

# echo "install libkml 1.3.0#13"
# echo "--------------------------------------------"
# ./bash/libkml.sh

# echo "install xerces-c 3.2.5"  
# echo "--------------------------------------------"
# ./bash/xerces-c.sh

# echo "install libxml2 2.11.9"
# echo "--------------------------------------------"
# ./bash/libxml2.sh

# echo "install libpq 16.4"
# echo "--------------------------------------------"
# ./bash/libpq.sh

# echo "install lastools 2.0.3"
# echo "--------------------------------------------"
# ./bash/lastools.sh

# echo "install poppler 24.3.0#1"
# echo "--------------------------------------------"
# ./bash/poppler.sh

# echo "install gdal 3.10.0"  
# echo "--------------------------------------------"
# ./bash/gdal.sh

# echo "install pdal 2.5.3#1"  
# echo "--------------------------------------------"
# ./bash/pdal.sh

# echo "install Qt5 5.15.15"  
# echo "--------------------------------------------"
# ./bash/qt5.sh

# echo "install glib 2.80.0#1"
# echo "--------------------------------------------"
# ./bash/glib.sh

# echo "install ilmbase 3"  
# echo "--------------------------------------------"
# ./bash/ilmbase.sh

# echo "install fontconfig 2.15.0#1"
# echo "--------------------------------------------"
# ./bash/fontconfig.sh

# echo "install ffmpeg 7.1#1"
# echo "--------------------------------------------"
# ./bash/ffmpeg.sh

# echo "install cgal 6.0.1"
# echo "--------------------------------------------"
# ./bash/cgal.sh

# echo "install pcl 1.14.1#3"  
# echo "--------------------------------------------"
# ./bash/pcl.sh

echo "install opencv4 4.8.0#14"  
echo "--------------------------------------------"
./bash/opencv4.sh

# echo "install osg 3.6.5#25"  
# echo "--------------------------------------------"
# ./bash/osg.sh

echo "install osg-qt Qt5#3"  
echo "--------------------------------------------"
./bash/osg-qt.sh

# echo "install leveldb 1.23"
# echo "--------------------------------------------"
# ./bash/leveldb.sh

# echo "install grpc 1.51.1"
# echo "--------------------------------------------"
# ./bash/grpc.sh

# echo "install shapelib 1.6.1"
# echo "--------------------------------------------"
# ./bash/shapelib.sh

# echo "install vcglib 2023.12"
# echo "--------------------------------------------"
# ./bash/vcglib.sh

# echo "install pugixml 1.14"
# echo "--------------------------------------------"
# ./bash/pugixml.sh

# echo "install nlohmann-json 3.11.3#1"
# echo "--------------------------------------------"
# ./bash/nlohmann-json.sh

# echo "install highway 1.2.0"
# echo "--------------------------------------------"
# ./bash/highway.sh

# echo "install skia 129#2"
# echo "--------------------------------------------"
# ./bash/skia.sh

echo "install qgis 3.30.2"
echo "--------------------------------------------"
./bash/qgis.sh


