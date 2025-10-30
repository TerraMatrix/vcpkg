get_filename_component(VCPKG_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)
# Exported from "//modules/skshaper:skshaper"
if("1")
    set_property(TARGET unofficial::skia::modules::skshaper APPEND PROPERTY INTERFACE_LINK_LIBRARIES "\$<LINK_ONLY:\$<\$<NOT:\$<CONFIG:DEBUG>>:unofficial::skia::skia>>")
endif()
if("1")
    set_property(TARGET unofficial::skia::modules::skshaper APPEND PROPERTY IMPORTED_CONFIGURATIONS "RELEASE")
    set_target_properties(unofficial::skia::modules::skshaper PROPERTIES IMPORTED_LOCATION_RELEASE "${VCPKG_IMPORT_PREFIX}/lib/skshaper.dll.lib")
    if("1")
        set_property(TARGET unofficial::skia::modules::skshaper APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS "\$<\$<NOT:\$<CONFIG:DEBUG>>:SK_GAMMA_APPLY_TO_A8;SK_ENABLE_AVX512_OPTS;SK_SHAPER_PRIMITIVE_AVAILABLE;SK_FONTMGR_ANDROID_AVAILABLE;SK_TYPEFACE_FACTORY_FREETYPE;SK_FONTMGR_FREETYPE_DIRECTORY_AVAILABLE;SK_FONTMGR_FREETYPE_EMBEDDED_AVAILABLE;SK_FONTMGR_FREETYPE_EMPTY_AVAILABLE;SK_TYPEFACE_FACTORY_DIRECTWRITE;SK_FONTMGR_DIRECTWRITE_AVAILABLE;SK_FONTMGR_GDI_AVAILABLE;SK_GL;SK_SUPPORT_PDF;SK_CODEC_DECODES_JPEG;SK_SUPPORT_XPS;SK_CODEC_DECODES_ICO;SK_CODEC_DECODES_PNG;SK_CODEC_DECODES_WEBP;SK_HAS_WUFFS_LIBRARY;SK_CODEC_DECODES_GIF;SK_XML;SK_CODEC_DECODES_BMP;SK_CODEC_DECODES_WBMP;SK_ENABLE_PRECOMPILE;SK_GANESH;SK_DISABLE_TRACING>")
        set_target_properties(unofficial::skia::modules::skshaper PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${VCPKG_IMPORT_PREFIX}/include/skia"
            IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
        )
        z_vcpkg_skia_get_link_libraries(z_vcpkg_skia_link_libs "RELEASE" "${z_vcpkg_skia_root}/lib/freetype.lib;${z_vcpkg_skia_root}/lib/libexpat.lib;${z_vcpkg_skia_root}/lib/turbojpeg.lib;${z_vcpkg_skia_root}/lib/jpeg.lib;${z_vcpkg_skia_root}/lib/zlib.lib;${z_vcpkg_skia_root}/lib/libpng16.lib;${z_vcpkg_skia_root}/lib/libwebpdecoder.lib;${z_vcpkg_skia_root}/lib/libwebpdemux.lib;${z_vcpkg_skia_root}/lib/libwebpmux.lib;${z_vcpkg_skia_root}/lib/libwebp.lib")
        set_property(TARGET unofficial::skia::modules::skshaper APPEND PROPERTY INTERFACE_LINK_LIBRARIES "\$<LINK_ONLY:\$<\$<NOT:\$<CONFIG:DEBUG>>:${z_vcpkg_skia_link_libs}>>")
        unset(z_vcpkg_skia_link_libs)
    endif()
endif()
