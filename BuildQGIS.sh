# 修改卷标名称，避免中文
#sudo ntfslabel /dev/sdb1 D

# 关闭安全中心中的应用保护-应用程序执行控制、网络保护-联网控制，避免执行过程中弹窗提示
# 官网下载cmake linux-aarch64 版本，解压后拷贝到/usr目录下
#sudo cp -r cmake解压目录/* /usr

# 官网下载autoconf代码， 执行./configure --prefix=/usr   make install  升级autoconf到2.71

# botan port 需要将port目录下的configure设置可执行权限

# 解决vlfeat编译错误
# 先执行 objdump -T /usr/lib/aarch64-linux-gnu/libc.so.6 | fgrep memcpy   查看glibc版本
# 修改vlfeat port中的fix-glibc-version.patch中的版本号

# 脚本所在目录为vcpkg根目录
VCPKG_ROOT_DIR="$(dirname "$(readlink -f  "$0")")"
echo "VCPKG_ROOT_DIR : $VCPKG_ROOT_DIR"

# 安装依赖
sudo apt-get install curl zip unzip tar  ninja-build g++ git bison flex libdbus-1-dev libxi-dev libxtst-dev gfortran '^libxcb.*-dev' libx11-xcb-dev libgl1-mesa-dev libxrender-dev libxkbcommon-dev libxkbcommon-x11-dev libxxf86vm-dev libglu1-mesa-dev mesa-common-dev libxrandr-dev nasm libxinerama-dev libxcursor-dev xorg-dev pkg-config   autoconf-archive gperf doxygen tk-dev

sudo apt install bison flex gperf gfortran autoconf-archive autopoint ninja-build
sudo apt install build-essential tar curl zip unzip nasm
sudo aptitude install libgl1-mesa-dev
sudo apt install libxxf86vm-dev libx11-dev libxft-dev libxext-dev libxcursor-dev libxdamage-dev libncurses5-dev libkrb5-dev python3-venv

# Qt5 依赖
sudo apt install libfontconfig1-dev libfreetype6-dev libx11-xcb-dev  libxfixes-dev libxi-dev libxrender-dev libxcb1-dev libxcb-glx0-dev libxcb-keysyms1-dev libxcb-image0-dev libxcb-shm0-dev libxcb-icccm4-dev libxcb-sync-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-randr0-dev  libxcb-render-util0-dev libxkbcommon-dev libxkbcommon-x11-dev libxcb-xinerama0-dev libatspi2.0-dev flite1-dev libspeechd-dev speech-dispatcher libgles-dev libgles2-mesa-dev 
sudo apt install  libdbus-1-dev libfontconfig1-dev libdrm-dev libxcomposite-dev libxcursor-dev libxi-dev libxrandr-dev  libxtst-dev  libcap-dev libnss3-dev libopus-dev libxcomposite-dev libxslt1-dev liblcms2-dev libre2-dev
sudo aptitude install libdrm-dev

#Python依赖
python3 -m pip install --upgrade pip -i https://mirrors.aliyun.com/pypi/simple
python3 -m pip install sip===5.5.0 pyqt-builder===1.6.0 PyQt5==5.15.3 PyQt5-sip QScintilla==2.12.0 PyQt3D==5.15.3 -i https://mirrors.aliyun.com/pypi/simple
# copy pyqt sip
sudo mkdir /usr/lib/python3/dist-packages/PyQt5/bindings
sudo cp -r $HOME/.local/lib/python3.8/site-packages/PyQt5/bindings/* /usr/lib/python3/dist-packages/PyQt5/bindings
sudo cp -r $HOME/.local/lib/python3.8/site-packages/PyQt5/bindings/* $VCPKG_ROOT_DIR/installed/x64-linux/lib/python3.8/site-packages/PyQt5/bindings

#安装cuda
sudo apt install nvidia-cuda-toolkit

# sip exe 设置环境变量
export PATH=$PATH:$HOME/.local/bin

# 安装PyQt5 gdal
# export VCPKG_INSTALLED_PATH=/data/workspace/vcpkg/installed/arm64-linux
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$VCPKG_INSTALLED_PATH/lib
# export PATH=$VCPKG_INSTALLED_PATH/bin:$VCPKG_INSTALLED_PATH/tools/qt5/bin:$VCPKG_INSTALLED_PATH/tools/gdal:$VCPKG_INSTALLED_PATH/tools/libpq/bin:$PATH
# sip-install sip-install --verbose --target-dir $VCPKG_INSTALLED_PATH/lib/python3.8/site-packages
# python3.8  setup.py -v install

# 执行vcpkg安装
export VCPKG_FORCE_SYSTEM_BINARIES=0
export PKG_CONFIG_PATH=/usr/lib/aarch64-linux-gnu/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig
export VCPKG_INSTALLED_PATH=/data/workspace/vcpkg/installed/arm64-linux
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$VCPKG_INSTALLED_PATH/lib
export PATH=$VCPKG_INSTALLED_PATH/bin:$VCPKG_INSTALLED_PATH/tools/qt5/bin:$VCPKG_INSTALLED_PATH/tools/gdal:$VCPKG_INSTALLED_PATH/tools/libpq/bin:$PATH
./vcpkg  install  vcglib:arm64-linux glew:arm64-linux glm:arm64-linux spdlog:arm64-linux metis:arm64-linux nanort:arm64-linux  curl[tool]:arm64-linux xerces-c[icu]:arm64-linux libpq[client,xml,xslt]:arm64-linux flann[hdf5]:arm64-linux ffmpeg[ffmpeg,ffplay,ffprobe]:arm64-linux gdal[default-features,freexl,poppler,tools]:arm64-linux  liblas:arm64-linux lastools:arm64-linux pdal[liblzma,zstd]:arm64-linux  osg[collada,fontconfig,freetype,nvtt,tools,plugins]:arm64-linux  osg-qt:arm64-linux  libigl[embree,cgal,glfw,imgui,opengl,xml]:arm64-linux poissonrecon:arm64-linux ceres[eigensparse,suitesparse]:arm64-linux  opencv[nonfree,ade,contrib,dnn,eigen,ffmpeg,gdcm,halide,ipp,jasper,jpeg,openexr,opengl,openmp,ovis,png,quirc,sfm,tbb,tiff,webp]:arm64-linux  openmvg[openmp,opencv,software]:arm64-linux  openmvs[openmp,ceres]:arm64-linux  colmap:arm64-linux rapidxml:arm64-linux cryptopp:arm64-linux sltbench:arm64-linux gtest:arm64-linux boost-locale:arm64-linux boost-dll:arm64-linux boost-log:arm64-linux boost-process:arm64-linux mimalloc[override]:arm64-linux  qwt[qt5]:arm64-linux qca:arm64-linux qscintilla:arm64-linux qtkeychain:arm64-linux qt5-charts:arm64-linux qt5-x11extras:arm64-linux qt5-connectivity:arm64-linux qt5-datavis3d:arm64-linux qt5-doc:arm64-linux  qt5-mqtt:arm64-linux qt5-networkauth:arm64-linux qt5-purchasing:arm64-linux qt5-remoteobjects:arm64-linux qt5-scxml:arm64-linux qt5-sensors:arm64-linux qt5-serialbus:arm64-linux qt5-serialport:arm64-linux qt5-speech:arm64-linux qt5-virtualkeyboard:arm64-linux qt5-wayland:arm64-linux qt5-webchannel:arm64-linux qt5-webglplugin:arm64-linux qt5-websockets:arm64-linux qt5-webview:arm64-linux  leveldb[crc32c,snappy]:arm64-linux qgis[bindings,3d,server,pdal,pip-mirrors]:arm64-linux grpc[codegen]:arm64-linux libpqxx:arm64-linux jsoncpp:arm64-linux  leveldb[crc32c,snappy]:arm64-linux --binarysource=clear --editable

pybind11:arm64-linux 

./vcpkg  install install glew:arm64-linux glm:arm64-linux spdlog:arm64-linux metis:arm64-linux nanort:arm64-linux qt5-webengine:arm64-linux curl[tool]:arm64-linux xerces-c[icu,xmlch-wchar]:arm64-linux libpq[client,xml,xslt]:arm64-linux flann[cuda,hdf5]:arm64-linux ffmpeg[ffmpeg,ffplay,ffprobe]:arm64-linux gdal[default-features,freexl,poppler,tools]:arm64-linux wxwidgets[example,fonts,webview]:arm64-linux  mapnik[cairo,input-csv,input-gdal,input-geobuf,input-geojson,input-ogr,input-pgraster,input-postgis,input-raster,input-shape,input-sqlite,input-topojson,libxml2,utility-geometry-to-wkb,utility-mapnik-index,utility-mapnik-render,utility-ogrindex,utility-pgsql2sqlite,utility-shapeindex,utility-svg2png,webp,viewer]:arm64-linux liblas:arm64-linux lastools:arm64-linux pdal[liblzma,zstd]:arm64-linux pcl[apps,cuda,simulation,tools,openni2]:arm64-linux osg[collada,fontconfig,freetype,nvtt,tools,plugins]:arm64-linux  osg-qt:arm64-linux  osgearth[tools]:arm64-linux libigl[embree,glfw,imgui,opengl,xml]:arm64-linux poissonrecon:arm64-linux ceres[eigensparse,suitesparse]:arm64-linux  opencv[nonfree,ade,contrib,cuda,dnn,eigen,ffmpeg,gdcm,halide,ipp,jasper,jpeg,openexr,opengl,openmp,ovis,png,quirc,sfm,tbb,tiff,webp]:arm64-linux  openmvg[openmp,opencv,software]:arm64-linux  openmvs[cuda,openmp,ceres]:arm64-linux  colmap[cuda,cuda-redist]:arm64-linux rapidxml:arm64-linux cryptopp:arm64-linux pybind11:arm64-linux sltbench:arm64-linux gtest:arm64-linux boost-locale:arm64-linux boost-dll:arm64-linux boost-log:arm64-linux boost-process:arm64-linux mimalloc[override]:arm64-linux crunch:arm64-linux qwt[qt5]:arm64-linux qca:arm64-linux qscintilla:arm64-linux qtkeychain:arm64-linux qt5-charts:arm64-linux --binarysource=clear --editable


#cmake qgis
VCPKG_TARGET_TRIPLET  arm64-linux
CMAKE_TOOLCHAIN_FILE $VCPKG_ROOT_DIR/scripts/buildsystems/vcpkg.cmake

#拷贝所有依赖
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$VCPKG_ROOT_DIR/installed/arm64-linux/lib
cp -L -n $( ldd designer | awk '{if (match($3,"/")){ print $3}}' )  $VCPKG_ROOT_DIR/installed/arm64-linux/tools/qt5/bin
cp -L -n $( ldd uic | awk '{if (match($3,"/")){ print $3}}' )  $VCPKG_ROOT_DIR/installed/arm64-linux/tools/qt5/bin

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$VCPKG_ROOT_DIR/installed/arm64-linux/lib:/media/vis/D/workspace/build-qgis-3.20.0-Qt5_dynamic-Release/SDK/lib
cp -L -n $( ldd VRGIS | awk '{if (match($3,"/")){ print $3}}' )  ./lib
cp -L -n $( ldd ./lib/qgis/plugins/libosgplugin.so | awk '{if (match($3,"/")){ print $3}}' )  ./lib
cp -L -n $( ldd ./qtplugins/platforms/libqxcb.so | awk '{if (match($3,"/")){ print $3}}' )  ./lib
cp -L -n $( ldd ./qtplugins/platforms/libqlinuxfb.so | awk '{if (match($3,"/")){ print $3}}' )  ./lib
cp -L -n $( ldd ./qtplugins/platforms/libqminimal.so | awk '{if (match($3,"/")){ print $3}}' )  ./lib
cp -L -n $( ldd ./qtplugins/platforms/libqoffscreen.so | awk '{if (match($3,"/")){ print $3}}' )  ./lib
cp -L -n $( ldd ./qtplugins/platforms/libqvnc.so | awk '{if (match($3,"/")){ print $3}}' )  ./lib
