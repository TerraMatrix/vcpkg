#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "openvino::frontend::onnx" for configuration "Debug"
set_property(TARGET openvino::frontend::onnx APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(openvino::frontend::onnx PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libopenvino_onnx_frontend.so.2025.3.0"
  IMPORTED_SONAME_DEBUG "libopenvino_onnx_frontend.so.2530"
  )

list(APPEND _cmake_import_check_targets openvino::frontend::onnx )
list(APPEND _cmake_import_check_files_for_openvino::frontend::onnx "${_IMPORT_PREFIX}/debug/lib/libopenvino_onnx_frontend.so.2025.3.0" )

# Import target "openvino::frontend::pytorch" for configuration "Debug"
set_property(TARGET openvino::frontend::pytorch APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(openvino::frontend::pytorch PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libopenvino_pytorch_frontend.so.2025.3.0"
  IMPORTED_SONAME_DEBUG "libopenvino_pytorch_frontend.so.2530"
  )

list(APPEND _cmake_import_check_targets openvino::frontend::pytorch )
list(APPEND _cmake_import_check_files_for_openvino::frontend::pytorch "${_IMPORT_PREFIX}/debug/lib/libopenvino_pytorch_frontend.so.2025.3.0" )

# Import target "openvino::frontend::tensorflow" for configuration "Debug"
set_property(TARGET openvino::frontend::tensorflow APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(openvino::frontend::tensorflow PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libopenvino_tensorflow_frontend.so.2025.3.0"
  IMPORTED_SONAME_DEBUG "libopenvino_tensorflow_frontend.so.2530"
  )

list(APPEND _cmake_import_check_targets openvino::frontend::tensorflow )
list(APPEND _cmake_import_check_files_for_openvino::frontend::tensorflow "${_IMPORT_PREFIX}/debug/lib/libopenvino_tensorflow_frontend.so.2025.3.0" )

# Import target "openvino::frontend::tensorflow_lite" for configuration "Debug"
set_property(TARGET openvino::frontend::tensorflow_lite APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(openvino::frontend::tensorflow_lite PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libopenvino_tensorflow_lite_frontend.so.2025.3.0"
  IMPORTED_SONAME_DEBUG "libopenvino_tensorflow_lite_frontend.so.2530"
  )

list(APPEND _cmake_import_check_targets openvino::frontend::tensorflow_lite )
list(APPEND _cmake_import_check_files_for_openvino::frontend::tensorflow_lite "${_IMPORT_PREFIX}/debug/lib/libopenvino_tensorflow_lite_frontend.so.2025.3.0" )

# Import target "openvino::frontend::paddle" for configuration "Debug"
set_property(TARGET openvino::frontend::paddle APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(openvino::frontend::paddle PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libopenvino_paddle_frontend.so.2025.3.0"
  IMPORTED_SONAME_DEBUG "libopenvino_paddle_frontend.so.2530"
  )

list(APPEND _cmake_import_check_targets openvino::frontend::paddle )
list(APPEND _cmake_import_check_files_for_openvino::frontend::paddle "${_IMPORT_PREFIX}/debug/lib/libopenvino_paddle_frontend.so.2025.3.0" )

# Import target "openvino::runtime" for configuration "Debug"
set_property(TARGET openvino::runtime APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(openvino::runtime PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libopenvino.so.2025.3.0"
  IMPORTED_SONAME_DEBUG "libopenvino.so.2530"
  )

list(APPEND _cmake_import_check_targets openvino::runtime )
list(APPEND _cmake_import_check_files_for_openvino::runtime "${_IMPORT_PREFIX}/debug/lib/libopenvino.so.2025.3.0" )

# Import target "openvino::runtime::c" for configuration "Debug"
set_property(TARGET openvino::runtime::c APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(openvino::runtime::c PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_DEBUG "openvino::runtime"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libopenvino_c.so.2025.3.0"
  IMPORTED_SONAME_DEBUG "libopenvino_c.so.2530"
  )

list(APPEND _cmake_import_check_targets openvino::runtime::c )
list(APPEND _cmake_import_check_files_for_openvino::runtime::c "${_IMPORT_PREFIX}/debug/lib/libopenvino_c.so.2025.3.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
