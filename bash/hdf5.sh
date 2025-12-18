#!/bin/bash

# Converted from hdf5.bat for Linux compatibility
./vcpkg install hdf5[core,cpp,szip,threadsafe,zlib] --triplet=arm64-linux --x-buildtrees-root=/data/workspace/vcpkg/buildtrees  --downloads-root=/data/workspace/vcpkg/downloads  --recurse --keep-going
