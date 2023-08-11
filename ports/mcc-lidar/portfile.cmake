vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO TerraMatrix/MCC-LIDAR
    REF 005f5262cce6e9ca0b77107c6d4a8edc54f8ece3 #2.1.0
    SHA512  81e2967583a2f20eb49d17c10a12f427f99f9e7d6d45c1d305ae2c44dd1a1be926ddc9467a3c631ce31ef36df089a8988ee869a0c776358fcd1b9b69d1abae67
    HEAD_REF master
    PATCHES
        mcc-lidar-config.cmake.patch
)

file(REMOVE_RECURSE "${SOURCE_PATH}/cmake/modules")

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        cuda   WITH_CUDA
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

if (VCPKG_TARGET_IS_WINDOWS)
    vcpkg_cmake_config_fixup(CONFIG_PATH cmake)
else()
    vcpkg_cmake_config_fixup(CONFIG_PATH share/cmake/mcc-lidar)
endif()

vcpkg_replace_string ("${CURRENT_PACKAGES_DIR}/share/mcc-lidar/mcc-lidar-config.cmake" "_DIR}/.." "_DIR}/../..")
vcpkg_replace_string ("${CURRENT_PACKAGES_DIR}/share/mcc-lidar/mcc-lidar-config.cmake" "/lib" "$<$<CONFIG:DEBUG>:/debug>/lib")
vcpkg_replace_string ("${CURRENT_PACKAGES_DIR}/share/mcc-lidar/mcc-lidar-config.cmake" "/bin" "/tools/${PORT}")

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share"
)

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
