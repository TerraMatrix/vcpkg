#!/bin/bash

# Converted from pcl.bat for Linux compatibility
./vcpkg install pcl[core,opengl,tools] --triplet=x64-linux --x-buildtrees-root=/data/workspace/vcpkg/buildtrees  --downloads-root=/data/workspace/vcpkg/downloads --editable
