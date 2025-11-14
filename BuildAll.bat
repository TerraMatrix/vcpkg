%�л�����ǰ�ļ���%
%~d0
cd  %~dp0

set http_proxy=http://127.0.0.1:7890 & set https_proxy=http://127.0.0.1:7890

echo "set -install-root  and  -packages-root"
vcpkg --x-install-root=./installed --x-packages-root=./packages  --vcpkg-root=./

@REM echo "install  boost 1.89.0"
@REM echo "--------------------------------------------"
@REM call ./bash/boost.bat

@REM echo "install  fmt 9.1.0#1"
@REM echo "--------------------------------------------"
@REM call ./bash/fmt.bat

@REM echo "install  sltbench  2.4.0"
@REM echo "--------------------------------------------"
@REM call ./bash/sltbench .bat

@REM echo "install  tinyxml2 9.0.0"
@REM echo "--------------------------------------------"
@REM call ./bash/tinyxml2.bat

@REM echo "install  cryptopp 8.7.0#3"
@REM echo "--------------------------------------------"
@REM call ./bash/cryptopp.bat

@REM echo "install  freetype 2.12.1#3"
@REM echo "--------------------------------------------"
@REM call ./bash/freetype.bat

@REM echo "install  hdf5 1.12.2#6"
@REM echo "--------------------------------------------"
@REM call ./bash/hdf5.bat

@REM echo "install  flann 2019-04-07#6"
@REM echo "--------------------------------------------"
@REM call ./bash/flann.bat

@REM echo "install  glm 0.9.9.8#2"
@REM echo "--------------------------------------------"
@REM call ./bash/glm.bat

@REM echo "install  gtest 1.12.1#1"
@REM echo "--------------------------------------------"
@REM call ./bash/gtest.bat

@REM echo "install  glew  2.2.0"
@REM echo "--------------------------------------------"
@REM call ./bash/glew.bat

@REM echo "install  gmp  6.2.1#15"
@REM echo "--------------------------------------------"
@REM call ./bash/gmp.bat

@REM echo "install  cereal  1.3.2#1"
@REM echo "--------------------------------------------"
@REM call ./bash/cereal.bat

@REM echo "install  gsl  2.7.1#1"
@REM echo "--------------------------------------------"
@REM call ./bash/gsl.bat

@REM echo "install  openni2  2.2.0.33#14"
@REM echo "--------------------------------------------"
@REM call ./bash/openni2.bat

@REM echo "install  openexr  3.1.5"
@REM echo "--------------------------------------------"
@REM call ./bash/openexr.bat

@REM echo "install  pybind11  2.10.0#1"
@REM echo "--------------------------------------------"
@REM call ./bash/pybind11.bat

@REM echo "install  ceres   2.1.0#3"
@REM echo "--------------------------------------------"
@REM call ./bash/ceres.bat

@REM echo "install  curl  7.87.0#1"
@REM echo "--------------------------------------------"
@REM call ./bash/curl.bat

@REM echo "install  proj  8.9.9#1"
@REM echo "--------------------------------------------"
@REM call ./bash/proj.bat

@REM echo "install  libgeotiff 1.7.1#2"
@REM echo "--------------------------------------------"
@REM call ./bash/libgeotiff.bat

@REM echo "install  liblas  1.8.1#11"
@REM echo "--------------------------------------------"
@REM call ./bash/liblas.bat

echo "install  mcc-lidar  2.1.0"
echo "--------------------------------------------"
call ./bash/mcc-lidar.bat

@REM echo "install  crunch  104"
@REM echo "--------------------------------------------"
@REM call ./bash/crunch.bat

@REM echo "install  libkml  1.3.0#11"
@REM echo "--------------------------------------------"
@REM call ./bash/libkml.bat

@REM echo "install  xerces-c 3.2.4#2"
@REM echo "--------------------------------------------"
@REM call ./bash/xerces-c.bat

@REM echo "install  libxml2 2.10.3"
@REM echo "--------------------------------------------"
@REM call ./bash/libxml2.bat

@REM echo "install  libpq  14.4#3"
@REM echo "--------------------------------------------"
@REM call ./bash/libpq.bat

@REM echo "install  lastools  2020-05-09#1"
@REM echo "--------------------------------------------"
@REM call ./bash/lastools.bat

@REM echo "install  poppler  25.7.0"
@REM echo "--------------------------------------------"
@REM call ./bash/poppler.bat

@REM echo "install  gdal  3.6.3#1"
@REM echo "--------------------------------------------"
@REM call ./bash/gdal.bat

@REM echo "install  pdal  2.4.3#1"
@REM echo "--------------------------------------------"
@REM call ./bash/pdal.bat

@REM echo "install  Qt5  5.15.8"
@REM echo "--------------------------------------------"
@REM call ./bash/qt5.bat

@REM echo "install  glib  2.75.3"
@REM echo "--------------------------------------------"
@REM call ./bash/glib.bat

@REM echo "install  ilmbase 3"
@REM echo "--------------------------------------------"
@REM call ./bash/ilmbase.bat

@REM echo "install  fontconfig  2.14.1#1"
@REM echo "--------------------------------------------"
@REM call ./bash/fontconfig.bat

@REM echo "install  ffmpeg  5.1.2#4"
@REM echo "--------------------------------------------"
@REM call ./bash/ffmpeg.bat

@REM echo "install  cgal  5.5.1#4"
@REM echo "--------------------------------------------"
@REM call ./bash/cgal.bat

echo "install  pcl  1.13.0"
echo "--------------------------------------------"
call ./bash/pcl.bat

echo "install  opencv4  4.7.0#2"
echo "--------------------------------------------"
call ./bash/opencv4.bat

echo "install  osg  3.6.5#18"
echo "--------------------------------------------"
call ./bash/osg.bat

echo "install  osg-qt  Qt5#3"
echo "--------------------------------------------"
call ./bash/osg-qt.bat

@REM echo "install  leveldb  1.22#6"
@REM echo "--------------------------------------------"
@REM call ./bash/leveldb.bat

@REM echo "install  grpc 1.51#1"
@REM echo "--------------------------------------------"
@REM call ./bash/grpc.bat

@REM echo "install  shapelib 1.5.0#3"
@REM echo "--------------------------------------------"
@REM call ./bash/shapelib.bat

@REM echo "install  vcglib 2022.02"
@REM echo "--------------------------------------------"
@REM call ./bash/vcglib.bat

echo "install  pugixml 1.14"
echo "--------------------------------------------"
call ./bash/pugixml.bat

echo "install  nlohmann-json 3.11.3#1"
echo "--------------------------------------------"
call ./bash/nlohmann-json.bat

echo "install  highway 1.2.0"
echo "--------------------------------------------"
call ./bash/highway.bat

echo "install  skia 129#2"
echo "--------------------------------------------"
call ./bash/skia.bat



echo "install  qgis"
echo "--------------------------------------------"
call ./bash/qgis.bat


