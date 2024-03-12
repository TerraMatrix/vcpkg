vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO czyt1988/SARibbon
    REF 4ff0edcdd1200b47c79a9f6cd545d4e70463ab75 #v0.0.1
    SHA512 22e01193549859c299e09d2413a8faf1501626858ca9367307c38c3f6017fb42d8219cb2ed316a9a14c3e7f9cf6867d3af5fbd8bae8663bc332949cb67289ab2 
    HEAD_REF master
    PATCHES
        config_changes.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS 
        -DBUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
