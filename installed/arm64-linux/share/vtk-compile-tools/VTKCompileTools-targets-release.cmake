#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "VTKCompileTools::WrappingTools" for configuration "Release"
set_property(TARGET VTKCompileTools::WrappingTools APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(VTKCompileTools::WrappingTools PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libvtkWrappingTools_CompileTools-9.3.a"
  )

list(APPEND _cmake_import_check_targets VTKCompileTools::WrappingTools )
list(APPEND _cmake_import_check_files_for_VTKCompileTools::WrappingTools "${_IMPORT_PREFIX}/lib/libvtkWrappingTools_CompileTools-9.3.a" )

# Import target "VTKCompileTools::WrapHierarchy" for configuration "Release"
set_property(TARGET VTKCompileTools::WrapHierarchy APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(VTKCompileTools::WrapHierarchy PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/tools/vtk-compile-tools/vtkWrapHierarchy-9.3"
  )

list(APPEND _cmake_import_check_targets VTKCompileTools::WrapHierarchy )
list(APPEND _cmake_import_check_files_for_VTKCompileTools::WrapHierarchy "${_IMPORT_PREFIX}/tools/vtk-compile-tools/vtkWrapHierarchy-9.3" )

# Import target "VTKCompileTools::WrapPython" for configuration "Release"
set_property(TARGET VTKCompileTools::WrapPython APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(VTKCompileTools::WrapPython PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/tools/vtk-compile-tools/vtkWrapPython-9.3"
  )

list(APPEND _cmake_import_check_targets VTKCompileTools::WrapPython )
list(APPEND _cmake_import_check_files_for_VTKCompileTools::WrapPython "${_IMPORT_PREFIX}/tools/vtk-compile-tools/vtkWrapPython-9.3" )

# Import target "VTKCompileTools::WrapPythonInit" for configuration "Release"
set_property(TARGET VTKCompileTools::WrapPythonInit APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(VTKCompileTools::WrapPythonInit PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/tools/vtk-compile-tools/vtkWrapPythonInit-9.3"
  )

list(APPEND _cmake_import_check_targets VTKCompileTools::WrapPythonInit )
list(APPEND _cmake_import_check_files_for_VTKCompileTools::WrapPythonInit "${_IMPORT_PREFIX}/tools/vtk-compile-tools/vtkWrapPythonInit-9.3" )

# Import target "VTKCompileTools::ParseJava" for configuration "Release"
set_property(TARGET VTKCompileTools::ParseJava APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(VTKCompileTools::ParseJava PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/tools/vtk-compile-tools/vtkParseJava-9.3"
  )

list(APPEND _cmake_import_check_targets VTKCompileTools::ParseJava )
list(APPEND _cmake_import_check_files_for_VTKCompileTools::ParseJava "${_IMPORT_PREFIX}/tools/vtk-compile-tools/vtkParseJava-9.3" )

# Import target "VTKCompileTools::WrapJava" for configuration "Release"
set_property(TARGET VTKCompileTools::WrapJava APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(VTKCompileTools::WrapJava PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/tools/vtk-compile-tools/vtkWrapJava-9.3"
  )

list(APPEND _cmake_import_check_targets VTKCompileTools::WrapJava )
list(APPEND _cmake_import_check_files_for_VTKCompileTools::WrapJava "${_IMPORT_PREFIX}/tools/vtk-compile-tools/vtkWrapJava-9.3" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
