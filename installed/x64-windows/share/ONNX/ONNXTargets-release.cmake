#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "ONNX::onnx" for configuration "Release"
set_property(TARGET ONNX::onnx APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ONNX::onnx PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/onnx.lib"
  )

list(APPEND _cmake_import_check_targets ONNX::onnx )
list(APPEND _cmake_import_check_files_for_ONNX::onnx "${_IMPORT_PREFIX}/lib/onnx.lib" )

# Import target "ONNX::onnx_proto" for configuration "Release"
set_property(TARGET ONNX::onnx_proto APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(ONNX::onnx_proto PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/onnx_proto.lib"
  )

list(APPEND _cmake_import_check_targets ONNX::onnx_proto )
list(APPEND _cmake_import_check_files_for_ONNX::onnx_proto "${_IMPORT_PREFIX}/lib/onnx_proto.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
