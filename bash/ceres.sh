#!/bin/bash

# Converted from ceres.bat for Linux compatibility
./vcpkg install ceres[core,cxsparse,eigensparse,lapack,suitesparse,tools] --triplet=arm64-linux --x-buildtrees-root=/data/workspace/vcpkg/buildtrees  --downloads-root=/data/workspace/vcpkg/downloads   --recurse
