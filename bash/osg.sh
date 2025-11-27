#!/bin/bash

# Converted from osg.bat for Linux compatibility
./vcpkg install osg[docs,examples,packages,collada,tools,plugins] --triplet=arm64-linux --x-buildtrees-root=/data/workspace/vcpkg/buildtrees  --downloads-root=/data/workspace/vcpkg/downloads  --recurse --allow-unsupported --keep-going
