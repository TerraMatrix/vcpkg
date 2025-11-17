#!/bin/bash

# Converted from opencv4.bat for Linux compatibility
./vcpkg install opencv4[core,ade,contrib,dnn,eigen,jasper,jpeg,lapack,nonfree,opengl,openmp,png,quirc,sfm,tbb,tiff] --triplet=x64-linux --x-buildtrees-root=/data/workspace/vcpkg/buildtrees  --downloads-root=/data/workspace/vcpkg/downloads --editable
