#!/bin/bash

./vcpkg.exe install tinyxml  --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --downloads-root=F:/vcpkg/downloads   --recurse
./vcpkg.exe install tinyxml2  --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --downloads-root=F:/vcpkg/downloads   --recurse
