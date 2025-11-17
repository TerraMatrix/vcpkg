#!/bin/bash

# Converted from proj.bat for Linux compatibility
./vcpkg install proj[core,tiff] --triplet=x64-linux --x-buildtrees-root=/data/workspace/vcpkg/buildtrees  --downloads-root=/data/workspace/vcpkg/downloads  --recurse  --editable
