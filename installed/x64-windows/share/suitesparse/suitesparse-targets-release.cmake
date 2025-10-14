#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "SuiteSparse::suitesparseconfig" for configuration "Release"
set_property(TARGET SuiteSparse::suitesparseconfig APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(SuiteSparse::suitesparseconfig PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/suitesparseconfig.lib"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::suitesparseconfig )
list(APPEND _cmake_import_check_files_for_SuiteSparse::suitesparseconfig "${_IMPORT_PREFIX}/lib/suitesparseconfig.lib" )

# Import target "SuiteSparse::amd" for configuration "Release"
set_property(TARGET SuiteSparse::amd APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(SuiteSparse::amd PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/libamd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "SuiteSparse::suitesparseconfig"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/libamd.dll"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::amd )
list(APPEND _cmake_import_check_files_for_SuiteSparse::amd "${_IMPORT_PREFIX}/lib/libamd.lib" "${_IMPORT_PREFIX}/bin/libamd.dll" )

# Import target "SuiteSparse::btf" for configuration "Release"
set_property(TARGET SuiteSparse::btf APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(SuiteSparse::btf PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/libbtf.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "SuiteSparse::suitesparseconfig"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/libbtf.dll"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::btf )
list(APPEND _cmake_import_check_files_for_SuiteSparse::btf "${_IMPORT_PREFIX}/lib/libbtf.lib" "${_IMPORT_PREFIX}/bin/libbtf.dll" )

# Import target "SuiteSparse::camd" for configuration "Release"
set_property(TARGET SuiteSparse::camd APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(SuiteSparse::camd PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/libcamd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "SuiteSparse::suitesparseconfig"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/libcamd.dll"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::camd )
list(APPEND _cmake_import_check_files_for_SuiteSparse::camd "${_IMPORT_PREFIX}/lib/libcamd.lib" "${_IMPORT_PREFIX}/bin/libcamd.dll" )

# Import target "SuiteSparse::ccolamd" for configuration "Release"
set_property(TARGET SuiteSparse::ccolamd APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(SuiteSparse::ccolamd PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/libccolamd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "SuiteSparse::suitesparseconfig"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/libccolamd.dll"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::ccolamd )
list(APPEND _cmake_import_check_files_for_SuiteSparse::ccolamd "${_IMPORT_PREFIX}/lib/libccolamd.lib" "${_IMPORT_PREFIX}/bin/libccolamd.dll" )

# Import target "SuiteSparse::colamd" for configuration "Release"
set_property(TARGET SuiteSparse::colamd APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(SuiteSparse::colamd PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/libcolamd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "SuiteSparse::suitesparseconfig"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/libcolamd.dll"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::colamd )
list(APPEND _cmake_import_check_files_for_SuiteSparse::colamd "${_IMPORT_PREFIX}/lib/libcolamd.lib" "${_IMPORT_PREFIX}/bin/libcolamd.dll" )

# Import target "SuiteSparse::cholmod" for configuration "Release"
set_property(TARGET SuiteSparse::cholmod APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(SuiteSparse::cholmod PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/libcholmod.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "metis;SuiteSparse::amd;SuiteSparse::camd;SuiteSparse::colamd;SuiteSparse::ccolamd;SuiteSparse::suitesparseconfig;${_IMPORT_PREFIX}/lib/lapack.lib;${_IMPORT_PREFIX}/lib/openblas.lib;${_IMPORT_PREFIX}/lib/openblas.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/libcholmod.dll"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::cholmod )
list(APPEND _cmake_import_check_files_for_SuiteSparse::cholmod "${_IMPORT_PREFIX}/lib/libcholmod.lib" "${_IMPORT_PREFIX}/bin/libcholmod.dll" )

# Import target "SuiteSparse::cxsparse" for configuration "Release"
set_property(TARGET SuiteSparse::cxsparse APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(SuiteSparse::cxsparse PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/libcxsparse.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "SuiteSparse::suitesparseconfig"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/libcxsparse.dll"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::cxsparse )
list(APPEND _cmake_import_check_files_for_SuiteSparse::cxsparse "${_IMPORT_PREFIX}/lib/libcxsparse.lib" "${_IMPORT_PREFIX}/bin/libcxsparse.dll" )

# Import target "SuiteSparse::klu" for configuration "Release"
set_property(TARGET SuiteSparse::klu APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(SuiteSparse::klu PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/libklu.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "SuiteSparse::amd;SuiteSparse::colamd;SuiteSparse::btf;SuiteSparse::suitesparseconfig"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/libklu.dll"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::klu )
list(APPEND _cmake_import_check_files_for_SuiteSparse::klu "${_IMPORT_PREFIX}/lib/libklu.lib" "${_IMPORT_PREFIX}/bin/libklu.dll" )

# Import target "SuiteSparse::ldl" for configuration "Release"
set_property(TARGET SuiteSparse::ldl APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(SuiteSparse::ldl PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/libldl.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "SuiteSparse::suitesparseconfig"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/libldl.dll"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::ldl )
list(APPEND _cmake_import_check_files_for_SuiteSparse::ldl "${_IMPORT_PREFIX}/lib/libldl.lib" "${_IMPORT_PREFIX}/bin/libldl.dll" )

# Import target "SuiteSparse::umfpack" for configuration "Release"
set_property(TARGET SuiteSparse::umfpack APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(SuiteSparse::umfpack PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/libumfpack.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "SuiteSparse::amd;SuiteSparse::camd;SuiteSparse::colamd;SuiteSparse::ccolamd;SuiteSparse::cholmod;SuiteSparse::suitesparseconfig;${_IMPORT_PREFIX}/lib/lapack.lib;${_IMPORT_PREFIX}/lib/openblas.lib;${_IMPORT_PREFIX}/lib/openblas.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/libumfpack.dll"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::umfpack )
list(APPEND _cmake_import_check_files_for_SuiteSparse::umfpack "${_IMPORT_PREFIX}/lib/libumfpack.lib" "${_IMPORT_PREFIX}/bin/libumfpack.dll" )

# Import target "SuiteSparse::spqr" for configuration "Release"
set_property(TARGET SuiteSparse::spqr APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(SuiteSparse::spqr PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/libspqr.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "SuiteSparse::camd;SuiteSparse::ccolamd;SuiteSparse::cholmod;metis;SuiteSparse::suitesparseconfig;${_IMPORT_PREFIX}/lib/lapack.lib;${_IMPORT_PREFIX}/lib/openblas.lib;${_IMPORT_PREFIX}/lib/openblas.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/libspqr.dll"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::spqr )
list(APPEND _cmake_import_check_files_for_SuiteSparse::spqr "${_IMPORT_PREFIX}/lib/libspqr.lib" "${_IMPORT_PREFIX}/bin/libspqr.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
