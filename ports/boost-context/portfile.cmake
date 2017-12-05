# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)
include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular.cmake)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/context
    REF boost-1.66.0
    SHA512 73efe1ab2c3b589e0ec7a095ab4a62090d8a980efbc81ac915823d1015fec215647a558bf0102fb42dbcdb05e9a4f70bd145bba095f09f1f4aec24eceddef3d4
    HEAD_REF master
)

boost_modular_build(SOURCE_PATH ${SOURCE_PATH})
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
