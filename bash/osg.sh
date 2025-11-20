#!/bin/bash

./vcpkg.exe install osg[core,collada,examples,fontconfig,freetype,tools,plugins] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --downloads-root=F:/vcpkg/downloads  --recurse
