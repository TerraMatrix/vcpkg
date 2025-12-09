#!/bin/bash

# Converted from pdal.bat for Linux compatibility
./vcpkg install pdal[core,draco,e57,hdf,pgpointcloud,supported-plugins] --triplet=arm64-linux --x-buildtrees-root=/data/workspace/vcpkg/buildtrees  --downloads-root=/data/workspace/vcpkg/downloads  --recurse --allow-unsupported --keep-going
