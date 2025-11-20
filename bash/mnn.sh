#!/bin/bash

./vcpkg.exe install mnn[cuda,opencl,test,tools] --triplet=x64-windows --x-buildtrees-root=F:/vcpkg/buildtrees  --downloads-root=F:/vcpkg/downloads  --editable
