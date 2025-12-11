#!/bin/bash

# Converted from pcl.bat for Linux compatibility
./vcpkg install pcl[core,apps,libusb,examples,opengl,simulation,tools] --triplet=arm64-linux --x-buildtrees-root=/data/workspace/vcpkg/buildtrees  --downloads-root=/data/workspace/vcpkg/downloads --editable --allow-unsupported --keep-going
