vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO qtwebkit/qtwebkit
    REF qtwebkit-5.212.0-alpha4
    SHA512 29864dee198e25ae9cd6a223f37bafc7e50da1a60e920b4c4fe4106f539d8d96ac49c97e1a8af8db0c85d04522358f65af8e926a3e53f6f80310c25fb7d04256
    HEAD_REF master
    #PATCHES
)

# # Check if one or more features are a part of a package installation.
# # See /docs/maintainers/vcpkg_check_features.md for more details
# vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
#   FEATURES # <- Keyword FEATURES is required because INVERTED_FEATURES are being used
#     tbb   WITH_TBB
#   INVERTED_FEATURES
#     tbb   ROCKSDB_IGNORE_PACKAGE_TBB
# )

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    # OPTIONS -DUSE_THIS_IN_ALL_BUILDS=1 -DUSE_THIS_TOO=2
    # OPTIONS_RELEASE -DOPTIMIZE=1
    # OPTIONS_DEBUG -DDEBUGGABLE=1
)

vcpkg_cmake_install()

# # Moves all .cmake files from /debug/share/qtwebkit/ to /share/qtwebkit/
# # See /docs/maintainers/ports/vcpkg-cmake-config/vcpkg_cmake_config_fixup.md for more details
# When you uncomment "vcpkg_cmake_config_fixup()", you need to add the following to "dependencies" vcpkg.json:
#{
#    "name": "vcpkg-cmake-config",
#    "host": true
#}
# vcpkg_cmake_config_fixup(CONFIG_PATH cmake TARGET_PATH share/qtwebkit)

# Uncomment the line below if necessary to install the license file for the port to share/${PORT}/copyright
# file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
