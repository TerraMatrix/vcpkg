%切换到当前文件夹%
%~d0
cd  %~dp0

set http_proxy=http://127.0.0.1:7890 & set https_proxy=http://127.0.0.1:7890

echo "set -install-root  and  -packages-root"
vcpkg --x-install-root=./installed --x-packages-root=./packages  --vcpkg-root=./

echo "install  glib  2.75.3"
echo "--------------------------------------------"
call ./bash/glib.bat

echo "install  ilmbase 3"
echo "--------------------------------------------"
call ./bash/ilmbase.bat

echo "install  fontconfig  2.14.1#1"
echo "--------------------------------------------"
call ./bash/fontconfig.bat

echo "install  ffmpeg  5.1.2#4"
echo "--------------------------------------------"
call ./bash/ffmpeg.bat

echo "install  cgal  5.5.1#4"
echo "--------------------------------------------"
call ./bash/cgal.bat

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

echo "install  leveldb  1.22#6"
echo "--------------------------------------------"
call ./bash/leveldb.bat

echo "install  grpc 1.51#1"
echo "--------------------------------------------"
call ./bash/grpc.bat

echo "install  shapelib 1.5.0#3"
echo "--------------------------------------------"
call ./bash/shapelib.bat

echo "install  vcglib 2022.02"
echo "--------------------------------------------"
call ./bash/vcglib.bat

echo "install  qgis"
echo "--------------------------------------------"
call ./bash/qgis.bat


