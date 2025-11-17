#!/bin/bash

# Converted from freetype.bat for Linux compatibility
./vcpkg install freetype[core,brotli,bzip2,png,zlib] --triplet=x64-linux --x-buildtrees-root=/data/workspace/vcpkg/buildtrees  --downloads-root=/data/workspace/vcpkg/downloads  --recurse
