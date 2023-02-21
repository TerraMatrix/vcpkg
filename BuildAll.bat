%切换到当前文件夹%
%~d0
cd  %~dp0

set http_proxy=http://127.0.0.1:7890 & set https_proxy=http://127.0.0.1:7890

echo "install  boost 1.81.0"
echo "--------------------------------------------"
call ./bash/boost.bat

echo "install  fmt 9.1.0#1"
echo "--------------------------------------------"
call ./bash/fmt.bat

echo "install  freetype 2.12.1#3"
echo "--------------------------------------------"
call ./bash/freetype.bat

echo "install  hdf5 1.12.2#6"
echo "--------------------------------------------"
call ./bash/hdf5.bat

echo "install  flann 2019-04-07#6"
echo "--------------------------------------------"
call ./bash/flann.bat

echo "install  gtest 1.12.1#1"
echo "--------------------------------------------"
call ./bash/gtest.bat

echo "install  glew  2.2.0"
echo "--------------------------------------------"
call ./bash/glew.bat

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

echo "install  crunch  104"
echo "--------------------------------------------"
call ./bash/crunch.bat

echo "install  Qt5  5.15.8"
echo "--------------------------------------------"
call ./bash/qt5.bat

echo "install  libkml  1.3.0#11"
echo "--------------------------------------------"
call ./bash/libkml.bat




