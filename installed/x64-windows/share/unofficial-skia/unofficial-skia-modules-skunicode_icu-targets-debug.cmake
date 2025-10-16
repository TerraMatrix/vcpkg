get_filename_component(VCPKG_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)
# Exported from "//modules/skunicode:skunicode_icu"
if("1")
    set_property(TARGET unofficial::skia::modules::skunicode_icu APPEND PROPERTY INTERFACE_LINK_LIBRARIES "\$<LINK_ONLY:\$<\$<CONFIG:DEBUG>:unofficial::skia::skia;unofficial::skia::modules::skunicode_core>>")
endif()
if("1")
    set_property(TARGET unofficial::skia::modules::skunicode_icu APPEND PROPERTY IMPORTED_CONFIGURATIONS "DEBUG")
    set_target_properties(unofficial::skia::modules::skunicode_icu PROPERTIES IMPORTED_LOCATION_DEBUG "${VCPKG_IMPORT_PREFIX}/debug/lib/skunicode_icu.dll.lib")
    if("1")
        set_property(TARGET unofficial::skia::modules::skunicode_icu APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS "\$<\$<CONFIG:DEBUG>:SK_GAMMA_APPLY_TO_A8;SK_ALLOW_STATIC_GLOBAL_INITIALIZERS=1;SK_ENABLE_AVX512_OPTS;SK_TYPEFACE_FACTORY_DIRECTWRITE;SK_FONTMGR_DIRECTWRITE_AVAILABLE;SK_FONTMGR_GDI_AVAILABLE;SK_GL;SK_ENABLE_DUMP_GPU;SK_SUPPORT_PDF;SK_CODEC_DECODES_JPEG;SK_SUPPORT_XPS;SK_CODEC_DECODES_ICO;SK_CODEC_DECODES_PNG;SK_CODEC_DECODES_WEBP;SK_HAS_WUFFS_LIBRARY;SK_CODEC_DECODES_GIF;SK_XML;SK_CODEC_DECODES_BMP;SK_CODEC_DECODES_WBMP;SK_ENABLE_PRECOMPILE;SK_GANESH>")
        set_target_properties(unofficial::skia::modules::skunicode_icu PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${VCPKG_IMPORT_PREFIX}/include/skia"
            IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
        )
        z_vcpkg_skia_get_link_libraries(z_vcpkg_skia_link_libs "DEBUG" "${z_vcpkg_skia_root}/debug/lib/turbojpeg.lib;${z_vcpkg_skia_root}/debug/lib/jpeg.lib;${z_vcpkg_skia_root}/debug/lib/zlibd.lib;${z_vcpkg_skia_root}/debug/lib/harfbuzz-subset.lib;${z_vcpkg_skia_root}/debug/lib/harfbuzz.lib;${z_vcpkg_skia_root}/debug/lib/libpng16d.lib;${z_vcpkg_skia_root}/debug/lib/libwebpdecoder.lib;${z_vcpkg_skia_root}/debug/lib/libwebpdemux.lib;${z_vcpkg_skia_root}/debug/lib/libwebpmux.lib;${z_vcpkg_skia_root}/debug/lib/libwebp.lib;${z_vcpkg_skia_root}/debug/lib/libexpatd.lib;${z_vcpkg_skia_root}/debug/lib/icuucd.lib;${z_vcpkg_skia_root}/debug/lib/icudtd.lib")
        set_property(TARGET unofficial::skia::modules::skunicode_icu APPEND PROPERTY INTERFACE_LINK_LIBRARIES "\$<LINK_ONLY:\$<\$<CONFIG:DEBUG>:${z_vcpkg_skia_link_libs}>>")
        unset(z_vcpkg_skia_link_libs)
    endif()
endif()
