echo "install  boost"
echo "--------------------------------------------"
vcpkg install boost[mpi] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees --recurse

echo "install  freetype"
echo "--------------------------------------------"
vcpkg install freetype[core,brotli,bzip2,png,zlib] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  hdf5"
echo "--------------------------------------------"
vcpkg install hdf5[core,parallel,szip,zlib]  --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  flann"
echo "--------------------------------------------"
vcpkg install flann[core,hdf5]  --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  gtest"
echo "--------------------------------------------"
vcpkg install gtest  --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  glew"
echo "--------------------------------------------"
vcpkg install glew --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  gmp"
echo "--------------------------------------------"
vcpkg install gmp --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  cereal"
echo "--------------------------------------------"
vcpkg install cereal  --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  gsl"
echo "--------------------------------------------"
vcpkg install gsl --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  openni2"
echo "--------------------------------------------"
vcpkg install openni2 --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  openexr"
echo "--------------------------------------------"
vcpkg install openexr --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse 

echo "install  Qt5.15.2"
echo "--------------------------------------------"
vcpkg install qt5 qt5[3d,activeqt,charts,connectivity,datavis3d,declarative,doc,essentials,extras,graphicaleffects,imageformats,latest,location,mqtt,multimedia,networkauth,purchasing,quickcontrols,quickcontrols2,remoteobjects,script,scxml,sensors,serialbus,serialport,speech,svg,tools,translations,virtualkeyboard,webchannel,webengine,webglplugin,websockets,webview,xmlpatterns]  --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  pybind11"
echo "--------------------------------------------"
vcpkg install pybind11  --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  ceres"
echo "--------------------------------------------"
vcpkg install ceres[core,cxsparse,eigensparse,lapack,suitesparse,tools] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  crunch"
echo "--------------------------------------------"
vcpkg install crunch:x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse 

echo "install  libkml"
echo "--------------------------------------------"
vcpkg install libkml --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse 

echo "install  curl"
echo "--------------------------------------------"
vcpkg install curl[core,non-http,schannel,ssl,sspi,tool] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse 

echo "install proj"
echo "--------------------------------------------"
vcpkg install proj4[core,database,tiff,tools] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse 

echo "install  libgeotiff"
echo "--------------------------------------------"
vcpkg install libgeotiff --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse 

echo "install  xerces-c"
echo "--------------------------------------------"
vcpkg install  xerces-c[icu,xmlch-wchar] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse 

echo "install  libxml2"
echo "--------------------------------------------"
vcpkg install  libxml2 --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse 

echo "install  libpq"
echo "--------------------------------------------"
vcpkg install  libpq[client,xml,xslt] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse 

echo "install  liblas"
echo "--------------------------------------------"
vcpkg install liblas[core,jpeg,zlib] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  lastools"
echo "--------------------------------------------"
vcpkg install lastools --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  pdal"
echo "--------------------------------------------"
vcpkg install pdal --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  gdal"
echo "--------------------------------------------"
vcpkg install gdal[libspatialite,mysql-libmariadb] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse --editable

echo "install  glib"
echo "--------------------------------------------"
vcpkg install glib --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  ilmbase"
echo "--------------------------------------------"
vcpkg install ilmbase --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  fontconfig"
echo "--------------------------------------------"
vcpkg install fontconfig --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  poppler"
echo "--------------------------------------------"
vcpkg install poppler[curl,splash,zlib] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  ffmpeg"
echo "--------------------------------------------"
vcpkg install ffmpeg[ffmpeg,ffplay,ffprobe] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  cgal"
echo "--------------------------------------------"
vcpkg install cgal --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  opencv"
echo "--------------------------------------------"
vcpkg install opencv[ade,contrib,cuda,dnn,eigen,ffmpeg,gdcm,halide,ipp,jasper,jpeg,lapack,nonfree,openexr,opengl,openmp,ovis,png,qt,quirc,sfm,tbb,tiff,webp,world] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees --editable

echo "install  osg"
echo "--------------------------------------------"
vcpkg install osg[collada,tools,plugins] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  osg"
echo "--------------------------------------------"
vcpkg install osg-qt  osgearth --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  qgis"
echo "--------------------------------------------"
vcpkg install qgis[bindings,3d,server,pip-mirrors,debug-tools,ltr] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse  --editable
