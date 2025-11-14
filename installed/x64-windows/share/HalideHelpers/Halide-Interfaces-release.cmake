#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Halide::Adams2019" for configuration "Release"
set_property(TARGET Halide::Adams2019 APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Halide::Adams2019 PROPERTIES
  IMPORTED_COMMON_LANGUAGE_RUNTIME_RELEASE ""
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/autoschedule_adams2019.dll"
  )

list(APPEND _cmake_import_check_targets Halide::Adams2019 )
list(APPEND _cmake_import_check_files_for_Halide::Adams2019 "${_IMPORT_PREFIX}/bin/autoschedule_adams2019.dll" )

# Import target "Halide::Li2018" for configuration "Release"
set_property(TARGET Halide::Li2018 APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Halide::Li2018 PROPERTIES
  IMPORTED_COMMON_LANGUAGE_RUNTIME_RELEASE ""
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/autoschedule_li2018.dll"
  )

list(APPEND _cmake_import_check_targets Halide::Li2018 )
list(APPEND _cmake_import_check_files_for_Halide::Li2018 "${_IMPORT_PREFIX}/bin/autoschedule_li2018.dll" )

# Import target "Halide::Mullapudi2016" for configuration "Release"
set_property(TARGET Halide::Mullapudi2016 APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Halide::Mullapudi2016 PROPERTIES
  IMPORTED_COMMON_LANGUAGE_RUNTIME_RELEASE ""
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/autoschedule_mullapudi2016.dll"
  )

list(APPEND _cmake_import_check_targets Halide::Mullapudi2016 )
list(APPEND _cmake_import_check_files_for_Halide::Mullapudi2016 "${_IMPORT_PREFIX}/bin/autoschedule_mullapudi2016.dll" )

# Import target "Halide::Anderson2021" for configuration "Release"
set_property(TARGET Halide::Anderson2021 APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Halide::Anderson2021 PROPERTIES
  IMPORTED_COMMON_LANGUAGE_RUNTIME_RELEASE ""
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/autoschedule_anderson2021.dll"
  )

list(APPEND _cmake_import_check_targets Halide::Anderson2021 )
list(APPEND _cmake_import_check_files_for_Halide::Anderson2021 "${_IMPORT_PREFIX}/bin/autoschedule_anderson2021.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
