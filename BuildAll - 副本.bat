





echo "install  curl"
echo "--------------------------------------------"
vcpkg install curl[core,brotli,http2,non-http,schannel,ssl,ssh,sspi,websockets,winssl] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse 

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
vcpkg install opencv[default-features,ade,contrib,dnn,eigen,halide,jasper,jpeg,lapack,nonfree,opengl,openmp,png,quirc,sfm,tbb,tiff] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees --editable

echo "install  osg"
echo "--------------------------------------------"
vcpkg install osg[collada,tools,plugins] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  osg"
echo "--------------------------------------------"
vcpkg install osg-qt  osgearth --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse

echo "install  qgis"
echo "--------------------------------------------"
vcpkg install qgis[bindings,3d,server,pip-mirrors,debug-tools,ltr] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --recurse  --editable

echo "install  mnn"
echo "--------------------------------------------"
vcpkg install mnn[cuda,opencl,test,tools] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees --editable
