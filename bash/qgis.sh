#!/bin/bash

# Converted from qgis.bat for Linux compatibility
./vcpkg install qgis[bindings,3d,server,pdal,debug-tools] --triplet=arm64-linux --x-buildtrees-root=/data/workspace/vcpkg/buildtrees  --downloads-root=/data/workspace/vcpkg/downloads  --recurse  --editable --allow-unsupported --keep-going
