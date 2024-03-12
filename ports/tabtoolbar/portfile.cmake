vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO SeriousAlexej/TabToolbar
    REF a22ed2a4885b252c4d49cb43f82d71e10d0ec51e #v0.0.1
    SHA512 10d1e3d2cce33b4071e2b372868fbc0322b36e6972590404b3fe113eb40d10ae254e5fa65d14858004947edd8702022588dd805de5c701aa43963f81d551df57 
    HEAD_REF master
    PATCHES
        #config_changes.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS 
        -DTT_BUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
