#!/bin/bash

./vcpkg.exe install poppler[core,curl,zlib] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --downloads-root=F:/vcpkg/downloads  --recurse
