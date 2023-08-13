echo "opencv[halide]依赖llvm, 目前编译llvm失败, 去掉了halide"
vcpkg install opencv4[core,ade,contrib,dnn,eigen,jasper,jpeg,lapack,nonfree,opengl,openmp,png,quirc,sfm,tbb,tiff] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/vcpkg-win7/buildtrees  --downloads-root=F:/vcpkg/downloads --editable

