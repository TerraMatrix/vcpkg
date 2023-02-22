




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
