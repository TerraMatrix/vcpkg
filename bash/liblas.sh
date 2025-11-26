#!/bin/bash

# Converted from liblas.bat for Linux compatibility
./vcpkg install liblas[core,jpeg,zlib] --triplet=arm64-linux --x-buildtrees-root=/data/workspace/vcpkg/buildtrees  --downloads-root=/data/workspace/vcpkg/downloads  --recurse --allow-unsupported
