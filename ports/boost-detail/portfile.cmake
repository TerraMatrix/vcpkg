# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/detail
    REF boost-1.79.0
    SHA512 ca51c9127db37971b8ad32276d0aa666544a1382dc60298972a3075b81846b89257850cfd4ce7f9409bfb92c088c7df96618633a3b00f578dce86728074965b7
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
