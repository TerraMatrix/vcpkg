vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO githubuser0xFFFF/Qt-Advanced-Stylesheets
    REF 061247e40bb8194f86477a83b48da680ce8f252c #1.0.4
    SHA512 a8da6b9f4e52e0fdd9420a3d98fed8fba2538311f5ab9db8433bedf3b112af742dbf717721ee795a0793fc7224c6b7407e56bbe6824499526598da65e0840ec7
    PATCHES
        config_changes.patch
)

if("tools" IN_LIST FEATURES)
    set(FEATURE_OPTIONS "examples")
endif()

vcpkg_configure_qmake(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        CONFIG+=${VCPKG_LIBRARY_LINKAGE}
        CONFIG+=${FEATURE_OPTIONS}
)

vcpkg_install_qmake()

if("tools" IN_LIST FEATURES)
    file(GLOB_RECURSE release_bins "${CURRENT_BUILDTREES_DIR}/${TARGET_TRIPLET}-rel/*.exe")
    file(COPY ${release_bins} DESTINATION "${CURRENT_PACKAGES_DIR}/bin")
    vcpkg_copy_tools(
        TOOL_NAMES
            exporter
            full_features
        AUTO_CLEAN
    )
endif()

if(VCPKG_LIBRARY_LINKAGE STREQUAL "static")
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/bin" "${CURRENT_PACKAGES_DIR}/debug/bin")
endif()

#Install the header files
file(GLOB HEADER_FILES "${SOURCE_PATH}/src/*.h")
file(INSTALL ${HEADER_FILES} DESTINATION "${CURRENT_PACKAGES_DIR}/include/${PORT}")

# Handle copyright
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
