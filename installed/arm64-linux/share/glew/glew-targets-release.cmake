#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "GLEW::glew" for configuration "Release"
set_property(TARGET GLEW::glew APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(GLEW::glew PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "/usr/lib/aarch64-linux-gnu/libGL.so;/usr/lib/aarch64-linux-gnu/libGLU.so;/usr/lib/aarch64-linux-gnu/libSM.so;/usr/lib/aarch64-linux-gnu/libICE.so;/usr/lib/aarch64-linux-gnu/libX11.so;/usr/lib/aarch64-linux-gnu/libXext.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libGLEW.so.2.2.0"
  IMPORTED_SONAME_RELEASE "libGLEW.so.2.2"
  )

list(APPEND _cmake_import_check_targets GLEW::glew )
list(APPEND _cmake_import_check_files_for_GLEW::glew "${_IMPORT_PREFIX}/lib/libGLEW.so.2.2.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
