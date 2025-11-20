#!/bin/bash

$切换到当前文件夹%
$~d0
# cd  %~dp0

# set http_proxy=http:/127.0.0.1:7890 & set https_proxy=http:/127.0.0.1:7890

# echo "set -install-root  and  -packages-root"
./vcpkg.exe --x-install-root=./installed --x-packages-root=./packages  --vcpkg-root=./

# echo "install  boost 1.86.0"
# echo "--------------------------------------------"
call ./bash/boost.bat

# echo "install  fmt 11.0.2#1"
# echo "--------------------------------------------"
call ./bash/fmt.bat

# echo "install  sltbench  2.4.0#3"
# echo "--------------------------------------------"
call ./bash/sltbench .bat

# echo "install  freetype 2.13.3"
# echo "--------------------------------------------"
call ./bash/freetype.bat

# echo "install  hdf5 1.14.4.3#3"
# echo "--------------------------------------------"
call ./bash/hdf5.bat

# echo "install  flann 2019-04-07#7"
# echo "--------------------------------------------"
call ./bash/flann.bat

# echo "install  glm 1.0.1#3"
# echo "--------------------------------------------"
call ./bash/glm.bat

# echo "install  gtest 1.15.2"
# echo "--------------------------------------------"
call ./bash/gtest.bat

# echo "install  glew  2.2.0#4"
# echo "--------------------------------------------"
call ./bash/glew.bat

# echo "install  gmp  6.3.0#1"
# echo "--------------------------------------------"
call ./bash/gmp.bat

# echo "install  cereal  1.3.2#1"
# echo "--------------------------------------------"
call ./bash/cereal.bat

# echo "install  gsl  2.8"
# echo "--------------------------------------------"
call ./bash/gsl.bat

# echo "install  openni2  2.2.0.33#15"
# echo "--------------------------------------------"
call ./bash/openni2.bat

# echo "install  openexr  3.3.1"
# echo "--------------------------------------------"
call ./bash/openexr.bat

# echo "install  pybind11  2.13.6"
# echo "--------------------------------------------"
call ./bash/pybind11.bat

# echo "install  ceres   2.1.0#5"
# echo "--------------------------------------------"
call ./bash/ceres.bat

# echo "install  curl  8.11.0#1"
# echo "--------------------------------------------"
call ./bash/curl.bat

# echo "install  proj  9.5.0"
# echo "--------------------------------------------"
call ./bash/proj.bat

# echo "install  libgeotiff 1.7.3#1"
# echo "--------------------------------------------"
call ./bash/libgeotiff.bat

# echo "install  liblas  1.8.1#15"
# echo "--------------------------------------------"
call ./bash/liblas.bat

# echo "install  mcc-lidar  2.1.0"
# echo "--------------------------------------------"
call ./bash/mcc-lidar.bat

# echo "install  crunch  104"
# echo "--------------------------------------------"
call ./bash/crunch.bat

# echo "install  libkml  1.3.0#13"
# echo "--------------------------------------------"
call ./bash/libkml.bat

# echo "install  xerces-c 3.2.5"
# echo "--------------------------------------------"
call ./bash/xerces-c.bat

# echo "install  libxml2 2.11.9"
# echo "--------------------------------------------"
call ./bash/libxml2.bat

# echo "install  libpq  16.4"
# echo "--------------------------------------------"
call ./bash/libpq.bat

# echo "install  lastools  2.0.3"
# echo "--------------------------------------------"
call ./bash/lastools.bat

# echo "install  poppler  24.3.0#1"
# echo "--------------------------------------------"
call ./bash/poppler.bat

# echo "install  gdal  3.10.0"
# echo "--------------------------------------------"
call ./bash/gdal.bat

# echo "install  pdal  2.5.3#1"
# echo "--------------------------------------------"
call ./bash/pdal.bat

# echo "install  Qt5  5.15.15"
# echo "--------------------------------------------"
call ./bash/qt5.bat

# echo "install  glib  2.80.0#1"
# echo "--------------------------------------------"
call ./bash/glib.bat

# echo "install  ilmbase 3"
# echo "--------------------------------------------"
call ./bash/ilmbase.bat

# echo "install  fontconfig  2.15.0#1"
# echo "--------------------------------------------"
call ./bash/fontconfig.bat

# echo "install  ffmpeg  7.1#1"
# echo "--------------------------------------------"
call ./bash/ffmpeg.bat

# echo "install  cgal  6.0.1"
# echo "--------------------------------------------"
call ./bash/cgal.bat

# echo "install  pcl  1.14.1#3"
# echo "--------------------------------------------"
call ./bash/pcl.bat

# echo "install  opencv4  4.8.0#14"
# echo "--------------------------------------------"
call ./bash/opencv4.bat

# echo "install  osg  3.6.5#25"
# echo "--------------------------------------------"
call ./bash/osg.bat

# echo "install  osg-qt  Qt5#3"
# echo "--------------------------------------------"
call ./bash/osg-qt.bat

# echo "install  leveldb  1.23"
# echo "--------------------------------------------"
call ./bash/leveldb.bat

# echo "install  grpc 1.51.1"
# echo "--------------------------------------------"
call ./bash/grpc.bat

# echo "install  shapelib 1.6.1"
# echo "--------------------------------------------"
call ./bash/shapelib.bat

# echo "install  vcglib 2023.12"
# echo "--------------------------------------------"
call ./bash/vcglib.bat

# echo "install  pugixml 1.14"
# echo "--------------------------------------------"
call ./bash/pugixml.bat

# echo "install  nlohmann-json 3.11.3#1"
# echo "--------------------------------------------"
call ./bash/nlohmann-json.bat

# echo "install  highway 1.2.0"
# echo "--------------------------------------------"
call ./bash/highway.bat

# echo "install  skia 129#2"
# echo "--------------------------------------------"
call ./bash/skia.bat

# echo "install  qgis 3.30.2"
# echo "--------------------------------------------"
call ./bash/qgis.bat


