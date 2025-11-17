#!/bin/bash

# Converted from gdal.bat for Linux compatibility
./vcpkg install gdal[core,libspatialite] --triplet=x64-linux --x-buildtrees-root=/data/workspace/vcpkg/buildtrees  --downloads-root=/data/workspace/vcpkg/downloads  --recurse --editable
