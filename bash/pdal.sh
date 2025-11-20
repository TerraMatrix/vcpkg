#!/bin/bash

./vcpkg.exe install pdal[core,draco,e57,hdf,pgpointcloud,supported-plugins] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --downloads-root=F:/vcpkg/downloads  --recurse
