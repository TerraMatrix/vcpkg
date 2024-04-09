%切换到当前文件夹%
%~d0
cd  %~dp0

set http_proxy=http://127.0.0.1:7890 & set https_proxy=http://127.0.0.1:7890

echo "set -install-root  and  -packages-root"
vcpkg --x-install-root=./installed --x-packages-root=./packages  --vcpkg-root=./

echo "install  boost 1.81.0"
echo "--------------------------------------------"
call ./bash/boost.bat

echo "install  fmt 9.1.0#1"
echo "--------------------------------------------"
call ./bash/fmt.bat

echo "install  sltbench  2.4.0"
echo "--------------------------------------------"
call ./bash/sltbench .bat

echo "install  tinyxml2 9.0.0"
echo "--------------------------------------------"
call ./bash/tinyxml2.bat

echo "install  freetype 2.12.1#3"
echo "--------------------------------------------"
call ./bash/freetype.bat

echo "install  hdf5 1.12.2#6"
echo "--------------------------------------------"
call ./bash/hdf5.bat

echo "install  flann 2019-04-07#6"
echo "--------------------------------------------"
call ./bash/flann.bat

echo "install  glm 0.9.9.8#2"
echo "--------------------------------------------"
call ./bash/glm.bat

echo "install  gtest 1.12.1#1"
echo "--------------------------------------------"
call ./bash/gtest.bat

echo "install  glad  0.1.36"
echo "--------------------------------------------"
call ./bash/glad.bat

echo "install  glew  2.2.0"
echo "--------------------------------------------"
call ./bash/glew.bat

echo "install  glfw3  3.3.8"
echo "--------------------------------------------"
call ./bash/glfw3.bat

echo "install  gmp  6.2.1#15"
echo "--------------------------------------------"
call ./bash/gmp.bat

echo "install  cereal  1.3.2#1"
echo "--------------------------------------------"
call ./bash/cereal.bat

echo "install  gsl  2.7.1#1"
echo "--------------------------------------------"
call ./bash/gsl.bat

echo "install  openni2  2.2.0.33#14"
echo "--------------------------------------------"
call ./bash/openni2.bat

echo "install  openexr  3.1.5"
echo "--------------------------------------------"
call ./bash/openexr.bat

echo "install  pybind11  2.10.0#1"
echo "--------------------------------------------"
call ./bash/pybind11.bat

echo "install  ceres   2.1.0#3"
echo "--------------------------------------------"
call ./bash/ceres.bat

echo "install  curl  7.87.0#1"
echo "--------------------------------------------"
call ./bash/curl.bat

echo "install  proj4  8.9.9#1"
echo "--------------------------------------------"
call ./bash/proj4.bat

echo "install  libgeotiff 1.7.1#2"
echo "--------------------------------------------"
call ./bash/libgeotiff.bat

echo "install  liblas  1.8.1#11"
echo "--------------------------------------------"
call ./bash/liblas.bat

echo "install  mcc-lidar  2.1.0"
echo "--------------------------------------------"
call ./bash/mcc-lidar.bat

echo "install  crunch  104"
echo "--------------------------------------------"
call ./bash/crunch.bat

echo "install  libkml  1.3.0#11"
echo "--------------------------------------------"
call ./bash/libkml.bat

echo "install  xerces-c 3.2.4#2"
echo "--------------------------------------------"
call ./bash/xerces-c.bat

echo "install  libxml2 2.10.3"
echo "--------------------------------------------"
call ./bash/libxml2.bat

echo "install  libpq  14.4#3"
echo "--------------------------------------------"
call ./bash/libpq.bat

echo "install  lastools  2020-05-09#1"
echo "--------------------------------------------"
call ./bash/lastools.bat

echo "install  poppler  23.1.0#1"
echo "--------------------------------------------"
call ./bash/poppler.bat

echo "install  gdal  3.6.3#1"
echo "--------------------------------------------"
call ./bash/gdal.bat

echo "install  pdal  2.4.3#1"
echo "--------------------------------------------"
call ./bash/pdal.bat



