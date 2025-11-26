#!/bin/bash

# Converted from opencv4.bat for Linux compatibility
./vcpkg install opencv4[core,ade,contrib,dnn,eigen,halide,highgui,ipp,jpegxl,openvino,openjpeg,jpeg,nonfree,opencl,opengl,openmp,png,quirc,sfm,tbb,tiff,vtk,vulkan] --triplet=arm64-linux --x-buildtrees-root=/data/workspace/vcpkg/buildtrees  --downloads-root=/data/workspace/vcpkg/downloads --recurse --editable --allow-unsupported
