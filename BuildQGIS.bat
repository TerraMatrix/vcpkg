cd /d "%~dp0"
::当存在多个CUDA SDK时，可以通过指定CUDA_PATH来设置特定版本的SDK
set CUDA_PATH=C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v11.8
set VCPKG_TRIPLET=x64-windows
:: --recurse
set VCPKG_OPTION=--host-triplet=%VCPKG_TRIPLET% --binarysource=clear  --only-downloads --editable
vcpkg install glew:%VCPKG_TRIPLET% glm:%VCPKG_TRIPLET% spdlog:%VCPKG_TRIPLET% metis:%VCPKG_TRIPLET% nanort:%VCPKG_TRIPLET% qt5-webengine:%VCPKG_TRIPLET% curl[tool]:%VCPKG_TRIPLET% xerces-c[icu,xmlch-wchar]:%VCPKG_TRIPLET% libpq[client,xml,xslt]:%VCPKG_TRIPLET% flann[cuda,hdf5]:%VCPKG_TRIPLET% ffmpeg[ffmpeg,ffplay,ffprobe]:%VCPKG_TRIPLET% gdal[default-features,freexl,poppler,tools]:%VCPKG_TRIPLET% wxwidgets[example,fonts,webview]:%VCPKG_TRIPLET%  mapnik[cairo,input-csv,input-gdal,input-geobuf,input-geojson,input-ogr,input-pgraster,input-postgis,input-raster,input-shape,input-sqlite,input-topojson,libxml2,utility-geometry-to-wkb,utility-mapnik-index,utility-mapnik-render,utility-ogrindex,utility-pgsql2sqlite,utility-shapeindex,utility-svg2png,webp,viewer]:%VCPKG_TRIPLET% liblas:%VCPKG_TRIPLET% lastools:%VCPKG_TRIPLET% pdal[liblzma,zstd]:%VCPKG_TRIPLET% pcl[apps,cuda,simulation,tools,openni2]:%VCPKG_TRIPLET% osg[collada,fontconfig,freetype,nvtt,tools,plugins]:%VCPKG_TRIPLET%  osg-qt:%VCPKG_TRIPLET%  osgearth[tools]:%VCPKG_TRIPLET% libigl[embree,glfw,imgui,opengl,xml]:%VCPKG_TRIPLET% poissonrecon:%VCPKG_TRIPLET% ceres[eigensparse,suitesparse]:%VCPKG_TRIPLET%  opencv[nonfree,ade,contrib,cuda,dnn,eigen,ffmpeg,gdcm,halide,ipp,jasper,jpeg,openexr,opengl,openmp,ovis,png,quirc,sfm,tbb,tiff,webp]:%VCPKG_TRIPLET%  openmvg[openmp,opencv,software]:%VCPKG_TRIPLET%  openmvs[cuda,openmp,ceres]:%VCPKG_TRIPLET%  colmap[cuda,cuda-redist]:%VCPKG_TRIPLET% rapidxml:%VCPKG_TRIPLET% cryptopp:%VCPKG_TRIPLET% pybind11:%VCPKG_TRIPLET% sltbench:%VCPKG_TRIPLET% gtest:%VCPKG_TRIPLET% boost-locale:%VCPKG_TRIPLET% boost-dll:%VCPKG_TRIPLET% boost-log:%VCPKG_TRIPLET% boost-process:%VCPKG_TRIPLET% mimalloc[override]:%VCPKG_TRIPLET% crunch:%VCPKG_TRIPLET% qwt[qt5]:%VCPKG_TRIPLET% qca:%VCPKG_TRIPLET% qscintilla:%VCPKG_TRIPLET% qtkeychain:%VCPKG_TRIPLET% %VCPKG_OPTION%
if %errorlevel% NEQ 0 goto failed
::vcpkg install qt5[all]:%VCPKG_TRIPLET% qt5-webengine:%VCPKG_TRIPLET% %VCPKG_OPTION%
::if %errorlevel% NEQ 0 goto failed

:failed
echo 按任意键退出
pause