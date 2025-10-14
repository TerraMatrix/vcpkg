#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "SuiteSparse::suitesparseconfig" for configuration "Debug"
set_property(TARGET SuiteSparse::suitesparseconfig APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(SuiteSparse::suitesparseconfig PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/suitesparseconfigd.lib"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::suitesparseconfig )
list(APPEND _cmake_import_check_files_for_SuiteSparse::suitesparseconfig "${_IMPORT_PREFIX}/debug/lib/suitesparseconfigd.lib" )

# Import target "SuiteSparse::amd" for configuration "Debug"
set_property(TARGET SuiteSparse::amd APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(SuiteSparse::amd PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/libamdd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "SuiteSparse::suitesparseconfig"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/libamdd.dll"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::amd )
list(APPEND _cmake_import_check_files_for_SuiteSparse::amd "${_IMPORT_PREFIX}/debug/lib/libamdd.lib" "${_IMPORT_PREFIX}/debug/bin/libamdd.dll" )

# Import target "SuiteSparse::btf" for configuration "Debug"
set_property(TARGET SuiteSparse::btf APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(SuiteSparse::btf PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/libbtfd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "SuiteSparse::suitesparseconfig"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/libbtfd.dll"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::btf )
list(APPEND _cmake_import_check_files_for_SuiteSparse::btf "${_IMPORT_PREFIX}/debug/lib/libbtfd.lib" "${_IMPORT_PREFIX}/debug/bin/libbtfd.dll" )

# Import target "SuiteSparse::camd" for configuration "Debug"
set_property(TARGET SuiteSparse::camd APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(SuiteSparse::camd PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/libcamdd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "SuiteSparse::suitesparseconfig"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/libcamdd.dll"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::camd )
list(APPEND _cmake_import_check_files_for_SuiteSparse::camd "${_IMPORT_PREFIX}/debug/lib/libcamdd.lib" "${_IMPORT_PREFIX}/debug/bin/libcamdd.dll" )

# Import target "SuiteSparse::ccolamd" for configuration "Debug"
set_property(TARGET SuiteSparse::ccolamd APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(SuiteSparse::ccolamd PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/libccolamdd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "SuiteSparse::suitesparseconfig"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/libccolamdd.dll"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::ccolamd )
list(APPEND _cmake_import_check_files_for_SuiteSparse::ccolamd "${_IMPORT_PREFIX}/debug/lib/libccolamdd.lib" "${_IMPORT_PREFIX}/debug/bin/libccolamdd.dll" )

# Import target "SuiteSparse::colamd" for configuration "Debug"
set_property(TARGET SuiteSparse::colamd APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(SuiteSparse::colamd PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/libcolamdd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "SuiteSparse::suitesparseconfig"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/libcolamdd.dll"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::colamd )
list(APPEND _cmake_import_check_files_for_SuiteSparse::colamd "${_IMPORT_PREFIX}/debug/lib/libcolamdd.lib" "${_IMPORT_PREFIX}/debug/bin/libcolamdd.dll" )

# Import target "SuiteSparse::cholmod" for configuration "Debug"
set_property(TARGET SuiteSparse::cholmod APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(SuiteSparse::cholmod PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/libcholmodd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "metis;SuiteSparse::amd;SuiteSparse::camd;SuiteSparse::colamd;SuiteSparse::ccolamd;SuiteSparse::suitesparseconfig;${_IMPORT_PREFIX}/debug/lib/lapack.lib;${_IMPORT_PREFIX}/debug/lib/openblas.lib;${_IMPORT_PREFIX}/debug/lib/openblas.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/libcholmodd.dll"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::cholmod )
list(APPEND _cmake_import_check_files_for_SuiteSparse::cholmod "${_IMPORT_PREFIX}/debug/lib/libcholmodd.lib" "${_IMPORT_PREFIX}/debug/bin/libcholmodd.dll" )

# Import target "SuiteSparse::cxsparse" for configuration "Debug"
set_property(TARGET SuiteSparse::cxsparse APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(SuiteSparse::cxsparse PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/libcxsparsed.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "SuiteSparse::suitesparseconfig"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/libcxsparsed.dll"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::cxsparse )
list(APPEND _cmake_import_check_files_for_SuiteSparse::cxsparse "${_IMPORT_PREFIX}/debug/lib/libcxsparsed.lib" "${_IMPORT_PREFIX}/debug/bin/libcxsparsed.dll" )

# Import target "SuiteSparse::klu" for configuration "Debug"
set_property(TARGET SuiteSparse::klu APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(SuiteSparse::klu PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/libklud.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "SuiteSparse::amd;SuiteSparse::colamd;SuiteSparse::btf;SuiteSparse::suitesparseconfig"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/libklud.dll"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::klu )
list(APPEND _cmake_import_check_files_for_SuiteSparse::klu "${_IMPORT_PREFIX}/debug/lib/libklud.lib" "${_IMPORT_PREFIX}/debug/bin/libklud.dll" )

# Import target "SuiteSparse::ldl" for configuration "Debug"
set_property(TARGET SuiteSparse::ldl APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(SuiteSparse::ldl PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/libldld.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "SuiteSparse::suitesparseconfig"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/libldld.dll"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::ldl )
list(APPEND _cmake_import_check_files_for_SuiteSparse::ldl "${_IMPORT_PREFIX}/debug/lib/libldld.lib" "${_IMPORT_PREFIX}/debug/bin/libldld.dll" )

# Import target "SuiteSparse::umfpack" for configuration "Debug"
set_property(TARGET SuiteSparse::umfpack APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(SuiteSparse::umfpack PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/libumfpackd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "SuiteSparse::amd;SuiteSparse::camd;SuiteSparse::colamd;SuiteSparse::ccolamd;SuiteSparse::cholmod;SuiteSparse::suitesparseconfig;${_IMPORT_PREFIX}/debug/lib/lapack.lib;${_IMPORT_PREFIX}/debug/lib/openblas.lib;${_IMPORT_PREFIX}/debug/lib/openblas.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/libumfpackd.dll"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::umfpack )
list(APPEND _cmake_import_check_files_for_SuiteSparse::umfpack "${_IMPORT_PREFIX}/debug/lib/libumfpackd.lib" "${_IMPORT_PREFIX}/debug/bin/libumfpackd.dll" )

# Import target "SuiteSparse::spqr" for configuration "Debug"
set_property(TARGET SuiteSparse::spqr APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(SuiteSparse::spqr PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/libspqrd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "SuiteSparse::camd;SuiteSparse::ccolamd;SuiteSparse::cholmod;metis;SuiteSparse::suitesparseconfig;${_IMPORT_PREFIX}/debug/lib/lapack.lib;${_IMPORT_PREFIX}/debug/lib/openblas.lib;${_IMPORT_PREFIX}/debug/lib/openblas.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/libspqrd.dll"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::spqr )
list(APPEND _cmake_import_check_files_for_SuiteSparse::spqr "${_IMPORT_PREFIX}/debug/lib/libspqrd.lib" "${_IMPORT_PREFIX}/debug/bin/libspqrd.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
