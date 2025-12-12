#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "unofficial::theora::theora" for configuration "Debug"
set_property(TARGET unofficial::theora::theora APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::theora::theora PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libtheora.so"
  IMPORTED_SONAME_DEBUG "libtheora.so"
  )

list(APPEND _cmake_import_check_targets unofficial::theora::theora )
list(APPEND _cmake_import_check_files_for_unofficial::theora::theora "${_IMPORT_PREFIX}/debug/lib/libtheora.so" )

# Import target "unofficial::theora::theoraenc" for configuration "Debug"
set_property(TARGET unofficial::theora::theoraenc APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::theora::theoraenc PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libtheoraenc.so"
  IMPORTED_SONAME_DEBUG "libtheoraenc.so"
  )

list(APPEND _cmake_import_check_targets unofficial::theora::theoraenc )
list(APPEND _cmake_import_check_files_for_unofficial::theora::theoraenc "${_IMPORT_PREFIX}/debug/lib/libtheoraenc.so" )

# Import target "unofficial::theora::theoradec" for configuration "Debug"
set_property(TARGET unofficial::theora::theoradec APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::theora::theoradec PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libtheoradec.so"
  IMPORTED_SONAME_DEBUG "libtheoradec.so"
  )

list(APPEND _cmake_import_check_targets unofficial::theora::theoradec )
list(APPEND _cmake_import_check_files_for_unofficial::theora::theoradec "${_IMPORT_PREFIX}/debug/lib/libtheoradec.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
