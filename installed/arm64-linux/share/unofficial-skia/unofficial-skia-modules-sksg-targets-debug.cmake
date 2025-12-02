get_filename_component(VCPKG_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)
# Exported from "//modules/sksg:sksg"
if("1")
    set_property(TARGET unofficial::skia::modules::sksg APPEND PROPERTY INTERFACE_LINK_LIBRARIES "\$<LINK_ONLY:\$<\$<CONFIG:DEBUG>:unofficial::skia::skia>>")
endif()
if("1")
    set_property(TARGET unofficial::skia::modules::sksg APPEND PROPERTY IMPORTED_CONFIGURATIONS "DEBUG")
    set_target_properties(unofficial::skia::modules::sksg PROPERTIES IMPORTED_LOCATION_DEBUG "${VCPKG_IMPORT_PREFIX}/debug/lib/libsksg.a")
    if("1")
        set_property(TARGET unofficial::skia::modules::sksg APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS "\$<\$<CONFIG:DEBUG>:SK_GAMMA_APPLY_TO_A8;SK_ALLOW_STATIC_GLOBAL_INITIALIZERS=1;SK_ENABLE_AVX512_OPTS;SK_FONTMGR_FCI_AVAILABLE;SK_FONTMGR_ANDROID_AVAILABLE;SK_FONTMGR_FREETYPE_DIRECTORY_AVAILABLE;SK_TYPEFACE_FACTORY_FREETYPE;SK_FONTMGR_FREETYPE_EMBEDDED_AVAILABLE;SK_FONTMGR_FREETYPE_EMPTY_AVAILABLE;SK_FONTMGR_FONTCONFIG_AVAILABLE;SK_CODEC_DECODES_ICO;SK_CODEC_DECODES_PNG;SK_CODEC_DECODES_PNG_WITH_LIBPNG;SK_CODEC_ENCODES_PNG;SK_CODEC_ENCODES_PNG_WITH_LIBPNG;SK_GL;SK_ENABLE_DUMP_GPU;SK_CODEC_ENCODES_JPEG;SK_SUPPORT_PDF;SK_CODEC_DECODES_JPEG;SK_CODEC_ENCODES_WEBP;SK_CODEC_DECODES_RAW;SK_CODEC_DECODES_WEBP;SK_HAS_WUFFS_LIBRARY;SK_CODEC_DECODES_GIF;SK_XML;SK_CODEC_DECODES_BMP;SK_CODEC_DECODES_WBMP;SK_R32_SHIFT=16;SK_ENABLE_PRECOMPILE;SK_GANESH;SK_USE_PERFETTO>")
        set_target_properties(unofficial::skia::modules::sksg PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${VCPKG_IMPORT_PREFIX}/include/skia"
            IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
        )
        z_vcpkg_skia_get_link_libraries(z_vcpkg_skia_link_libs "DEBUG" "fontconfig;expat;opengl32;turbojpeg;jpeg;harfbuzz-subset;harfbuzz;stdc++;freetyped;bz2d;png16d;z;brotlidec;brotlicommon;webpdecoder;webpdemux;webpmux;webp;sharpyuv;m;pthread;dl")
        set_property(TARGET unofficial::skia::modules::sksg APPEND PROPERTY INTERFACE_LINK_LIBRARIES "\$<LINK_ONLY:\$<\$<CONFIG:DEBUG>:${z_vcpkg_skia_link_libs}>>")
        unset(z_vcpkg_skia_link_libs)
    endif()
endif()
