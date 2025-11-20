#!/bin/bash

# Converted from poppler.bat for Linux compatibility
./vcpkg install poppler[core,curl,zlib] --triplet=arm64-linux --x-buildtrees-root=/data/workspace/vcpkg/buildtrees  --downloads-root=/data/workspace/vcpkg/downloads  --recurse
