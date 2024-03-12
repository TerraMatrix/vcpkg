vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO openscenegraph/VirtualPlanetBuilder
    REF bc1acd7ba80bc839e50866a8f71eea818b0282a4
    SHA512 58ddd3c3fe487d2b6996fdee6551f99fb093b62904435dd28615e62d911d0683ac1796b61e8c07583391c36f34863f3cf1c79afa3c80c75726d9b320fe7beea9
    HEAD_REF master
    PATCHES
        VpbMacroUtils.patch
)

if(VCPKG_TARGET_IS_OSX)
    string(APPEND VCPKG_CXX_FLAGS " -stdlib=libc++")
    string(APPEND VCPKG_C_FLAGS "") # both must be set
endif()

if(VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
    set(OPTIONS -DDYNAMIC_VIRTUALPLANETBUILDER=ON)
else()
    set(OPTIONS -DDYNAMIC_VIRTUALPLANETBUILDER=OFF)
endif()

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    WINDOWS_USE_MSBUILD
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_copy_tools(
    TOOL_NAMES
        osgdem
        vpbcache
        vpbmaster
        vpbsizes
    AUTO_CLEAN
)

#Debug
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
