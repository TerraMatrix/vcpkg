#!/bin/bash

./vcpkg.exe install --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --downloads-root=F:/vcpkg/downloads  --recurse  --editable qgis[desktop,gui,3d,server,bindings,postgis,spatialite,pdal] 
