vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO vsg-dev/osg2vsg
    REF 24e01906c098cb49ab2a11a00d00c1450b765b30
    SHA512 9f54c46ae294657531e8f053b15efd3e603ddaee5ce6b80d3d7c69dfaa999e3f59321992224a289b5ba798ba2e2adf14ac617ad3ee5ab476339961ae07802e2c
    HEAD_REF master
	PATCHES
        fix-cmake.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    WINDOWS_USE_MSBUILD
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_copy_tools(
    TOOL_NAMES
        osggroups
        osgmaths
        vsgnodes
        vsgobjects
		vsgwithosg
    AUTO_CLEAN
)

# Move cmake configs
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})

#Debug
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(INSTALL "${SOURCE_PATH}/LICENSE.md" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
