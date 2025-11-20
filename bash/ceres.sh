#!/bin/bash

./vcpkg.exe install ceres[core,eigensparse,lapack,schur,suitesparse] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --downloads-root=F:/vcpkg/downloads   --recurse
