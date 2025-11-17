#!/bin/bash

# Converted from gdal.bat for Linux compatibility
./vcpkg install gdal[core,curl,expat,geos,gif,hdf5,iconv,jpeg,lerc,libkml,libspatialite,libxml2,lzma,netcdf,openjpeg,openssl,pcre2,png,postgresql,qhull,recommended-features,sqlite3,webp,zstd] --triplet=arm64-linux --x-buildtrees-root=/data/workspace/vcpkg/buildtrees  --downloads-root=/data/workspace/vcpkg/downloads  --recurse --editable
