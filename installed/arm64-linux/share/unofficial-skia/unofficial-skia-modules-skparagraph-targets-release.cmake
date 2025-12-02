get_filename_component(VCPKG_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)
# Exported from "//modules/skparagraph:skparagraph"
if("1")
    set_property(TARGET unofficial::skia::modules::skparagraph APPEND PROPERTY INTERFACE_LINK_LIBRARIES "\$<LINK_ONLY:\$<\$<NOT:\$<CONFIG:DEBUG>>:unofficial::skia::skia;unofficial::skia::modules::skshaper;unofficial::skia::modules::skunicode_core;unofficial::skia::modules::skunicode_icu>>")
endif()
if("1")
    set_property(TARGET unofficial::skia::modules::skparagraph APPEND PROPERTY IMPORTED_CONFIGURATIONS "RELEASE")
    set_target_properties(unofficial::skia::modules::skparagraph PROPERTIES IMPORTED_LOCATION_RELEASE "${VCPKG_IMPORT_PREFIX}/lib/libskparagraph.a")
    if("1")
        set_property(TARGET unofficial::skia::modules::skparagraph APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS "\$<\$<NOT:\$<CONFIG:DEBUG>>:SK_ENABLE_PARAGRAPH;SK_FONTMGR_FCI_AVAILABLE;SK_FONTMGR_ANDROID_AVAILABLE;SK_FONTMGR_FREETYPE_DIRECTORY_AVAILABLE;SK_TYPEFACE_FACTORY_FREETYPE;SK_FONTMGR_FREETYPE_EMBEDDED_AVAILABLE;SK_FONTMGR_FREETYPE_EMPTY_AVAILABLE;SK_FONTMGR_FONTCONFIG_AVAILABLE;SK_CODEC_DECODES_ICO;SK_CODEC_DECODES_PNG;SK_CODEC_DECODES_PNG_WITH_LIBPNG;SK_CODEC_ENCODES_PNG;SK_CODEC_ENCODES_PNG_WITH_LIBPNG;SK_GL;SK_CODEC_ENCODES_JPEG;SK_SUPPORT_PDF;SK_CODEC_DECODES_JPEG;SK_CODEC_ENCODES_WEBP;SK_CODEC_DECODES_RAW;SK_CODEC_DECODES_WEBP;SK_HAS_WUFFS_LIBRARY;SK_CODEC_DECODES_GIF;SK_XML;SK_CODEC_DECODES_BMP;SK_CODEC_DECODES_WBMP;SK_R32_SHIFT=16;SK_ENABLE_PRECOMPILE;SK_GANESH;SK_DISABLE_TRACING;SK_USE_PERFETTO;SK_UNICODE_AVAILABLE;SK_UNICODE_ICU_IMPLEMENTATION;SK_SHAPER_PRIMITIVE_AVAILABLE;SK_SHAPER_HARFBUZZ_AVAILABLE;SK_SHAPER_UNICODE_AVAILABLE>")
        set_target_properties(unofficial::skia::modules::skparagraph PROPERTIES
            INTERFACE_INCLUDE_DIRECTORIES "${VCPKG_IMPORT_PREFIX}/include/skia"
            IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
        )
        z_vcpkg_skia_get_link_libraries(z_vcpkg_skia_link_libs "RELEASE" "fontconfig;expat;opengl32;turbojpeg;jpeg;harfbuzz-subset;harfbuzz;freetype;bz2;png16;z;brotlidec;brotlicommon;webpdecoder;webpdemux;webpmux;webp;sharpyuv;icuuc;icudata;stdc++;m;pthread;dl")
        set_property(TARGET unofficial::skia::modules::skparagraph APPEND PROPERTY INTERFACE_LINK_LIBRARIES "\$<LINK_ONLY:\$<\$<NOT:\$<CONFIG:DEBUG>>:${z_vcpkg_skia_link_libs}>>")
        unset(z_vcpkg_skia_link_libs)
    endif()
endif()
