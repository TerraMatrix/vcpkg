#!/bin/bash

# Converted from curl.bat for Linux compatibility
./vcpkg install curl[core,brotli,http2,non-http,ssl,ssh,websockets] --triplet=arm64-linux --x-buildtrees-root=/data/workspace/vcpkg/buildtrees  --downloads-root=/data/workspace/vcpkg/downloads    --recurse  --keep-going --allow-unsupported
