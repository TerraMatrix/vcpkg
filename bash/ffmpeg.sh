#!/bin/bash

# Converted from ffmpeg.bat for Linux compatibility
./vcpkg install ffmpeg[core] --triplet=arm64-linux --x-buildtrees-root=/data/workspace/vcpkg/buildtrees  --downloads-root=/data/workspace/vcpkg/downloads   --recurse --keep-going
