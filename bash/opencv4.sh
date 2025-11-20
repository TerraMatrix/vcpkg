#!/bin/bash

./vcpkg.exe install opencv4[core,ade,contrib,dnn,eigen,halide,highgui,ipp,jpegxl,openvino,openjpeg,jpeg,nonfree,opencl,opengl,openmp,png,quirc,sfm,tbb,tiff,vtk,vulkan] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --downloads-root=F:/vcpkg/downloads --recurse --editable
