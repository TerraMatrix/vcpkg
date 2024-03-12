vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO castano/nvidia-texture-tools
    REF aeddd65f81d36d8cb7b169b469ef25156666077e  # 2.1.2
    SHA512 a4ed0009465002d4c5ba227d1f0a38e80f78d85677332a48601cb0a26738e18a836e03cd579d57005c4817e09802f0b2e093b606b9c4bca1d471b9de1c57077a
    HEAD_REF master
    PATCHES
        001-define-value-for-HAVE_UNISTD_H-in-mac-os.patch
        bc6h.patch
        bc7.patch
        squish.patch
        fix-build-error.patch
        add-compile-options-for-osx.patch
        skip-building-libsquish.patch
        fix-intrinsic-function.patch
        fix-release-flags.patch
)

if(VCPKG_TARGET_ARCHITECTURE STREQUAL "arm" OR VCPKG_TARGET_ARCHITECTURE STREQUAL "arm64")
    vcpkg_apply_patches(
        SOURCE_PATH "${SOURCE_PATH}"
        PATCHES 
            fix-arm.patch
    )
    file(COPY "${CURRENT_INSTALLED_DIR}/include/sse2neon.h" DESTINATION "${SOURCE_PATH}/extern/CMP_Core/source")
endif()

vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        cuda    CMAKE_REQUIRE_FIND_PACKAGE_CUDA
    INVERTED_FEATURES
        cuda    CMAKE_DISABLE_FIND_PACKAGE_CUDA
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DNVTT_SHARED=0
        ${FEATURE_OPTIONS}
    OPTIONS_DEBUG
        -DCMAKE_DEBUG_POSTFIX=_d # required by OSG
)

vcpkg_cmake_install()

if(VCPKG_LIBRARY_LINKAGE STREQUAL "static")
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/bin" "${CURRENT_PACKAGES_DIR}/debug/bin")
endif()

vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

# Handle copyright
file(REMOVE "${CURRENT_PACKAGES_DIR}/share/doc/nvtt/LICENSE")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
