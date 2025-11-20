#!/bin/bash

./vcpkg.exe install  libpq[client,xml,xslt] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --downloads-root=F:/vcpkg/downloads  --recurse 
