#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "hdf5::hdf5-shared" for configuration "Debug"
set_property(TARGET hdf5::hdf5-shared APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::hdf5-shared PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/hdf5_D.lib"
  IMPORTED_LINK_DEPENDENT_LIBRARIES_DEBUG "libaec::sz;libaec::aec"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/hdf5_D.dll"
  )

list(APPEND _cmake_import_check_targets hdf5::hdf5-shared )
list(APPEND _cmake_import_check_files_for_hdf5::hdf5-shared "${_IMPORT_PREFIX}/debug/lib/hdf5_D.lib" "${_IMPORT_PREFIX}/debug/bin/hdf5_D.dll" )

# Import target "hdf5::hdf5_tools-shared" for configuration "Debug"
set_property(TARGET hdf5::hdf5_tools-shared APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::hdf5_tools-shared PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/hdf5_tools_D.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/hdf5_tools_D.dll"
  )

list(APPEND _cmake_import_check_targets hdf5::hdf5_tools-shared )
list(APPEND _cmake_import_check_files_for_hdf5::hdf5_tools-shared "${_IMPORT_PREFIX}/debug/lib/hdf5_tools_D.lib" "${_IMPORT_PREFIX}/debug/bin/hdf5_tools_D.dll" )

# Import target "hdf5::h5diff" for configuration "Debug"
set_property(TARGET hdf5::h5diff APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::h5diff PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/tools/hdf5/h5diff.exe"
  )

list(APPEND _cmake_import_check_targets hdf5::h5diff )
list(APPEND _cmake_import_check_files_for_hdf5::h5diff "${_IMPORT_PREFIX}/tools/hdf5/h5diff.exe" )

# Import target "hdf5::ph5diff" for configuration "Debug"
set_property(TARGET hdf5::ph5diff APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::ph5diff PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/tools/hdf5/ph5diff.exe"
  )

list(APPEND _cmake_import_check_targets hdf5::ph5diff )
list(APPEND _cmake_import_check_files_for_hdf5::ph5diff "${_IMPORT_PREFIX}/tools/hdf5/ph5diff.exe" )

# Import target "hdf5::h5ls" for configuration "Debug"
set_property(TARGET hdf5::h5ls APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::h5ls PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/tools/hdf5/h5ls.exe"
  )

list(APPEND _cmake_import_check_targets hdf5::h5ls )
list(APPEND _cmake_import_check_files_for_hdf5::h5ls "${_IMPORT_PREFIX}/tools/hdf5/h5ls.exe" )

# Import target "hdf5::h5debug" for configuration "Debug"
set_property(TARGET hdf5::h5debug APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::h5debug PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/tools/hdf5/h5debug.exe"
  )

list(APPEND _cmake_import_check_targets hdf5::h5debug )
list(APPEND _cmake_import_check_files_for_hdf5::h5debug "${_IMPORT_PREFIX}/tools/hdf5/h5debug.exe" )

# Import target "hdf5::h5repart" for configuration "Debug"
set_property(TARGET hdf5::h5repart APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::h5repart PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/tools/hdf5/h5repart.exe"
  )

list(APPEND _cmake_import_check_targets hdf5::h5repart )
list(APPEND _cmake_import_check_files_for_hdf5::h5repart "${_IMPORT_PREFIX}/tools/hdf5/h5repart.exe" )

# Import target "hdf5::h5mkgrp" for configuration "Debug"
set_property(TARGET hdf5::h5mkgrp APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::h5mkgrp PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/tools/hdf5/h5mkgrp.exe"
  )

list(APPEND _cmake_import_check_targets hdf5::h5mkgrp )
list(APPEND _cmake_import_check_files_for_hdf5::h5mkgrp "${_IMPORT_PREFIX}/tools/hdf5/h5mkgrp.exe" )

# Import target "hdf5::h5clear" for configuration "Debug"
set_property(TARGET hdf5::h5clear APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::h5clear PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/tools/hdf5/h5clear.exe"
  )

list(APPEND _cmake_import_check_targets hdf5::h5clear )
list(APPEND _cmake_import_check_files_for_hdf5::h5clear "${_IMPORT_PREFIX}/tools/hdf5/h5clear.exe" )

# Import target "hdf5::h5delete" for configuration "Debug"
set_property(TARGET hdf5::h5delete APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::h5delete PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/tools/hdf5/h5delete.exe"
  )

list(APPEND _cmake_import_check_targets hdf5::h5delete )
list(APPEND _cmake_import_check_files_for_hdf5::h5delete "${_IMPORT_PREFIX}/tools/hdf5/h5delete.exe" )

# Import target "hdf5::h5import" for configuration "Debug"
set_property(TARGET hdf5::h5import APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::h5import PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/tools/hdf5/h5import.exe"
  )

list(APPEND _cmake_import_check_targets hdf5::h5import )
list(APPEND _cmake_import_check_files_for_hdf5::h5import "${_IMPORT_PREFIX}/tools/hdf5/h5import.exe" )

# Import target "hdf5::h5repack" for configuration "Debug"
set_property(TARGET hdf5::h5repack APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::h5repack PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/tools/hdf5/h5repack.exe"
  )

list(APPEND _cmake_import_check_targets hdf5::h5repack )
list(APPEND _cmake_import_check_files_for_hdf5::h5repack "${_IMPORT_PREFIX}/tools/hdf5/h5repack.exe" )

# Import target "hdf5::h5jam" for configuration "Debug"
set_property(TARGET hdf5::h5jam APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::h5jam PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/tools/hdf5/h5jam.exe"
  )

list(APPEND _cmake_import_check_targets hdf5::h5jam )
list(APPEND _cmake_import_check_files_for_hdf5::h5jam "${_IMPORT_PREFIX}/tools/hdf5/h5jam.exe" )

# Import target "hdf5::h5unjam" for configuration "Debug"
set_property(TARGET hdf5::h5unjam APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::h5unjam PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/tools/hdf5/h5unjam.exe"
  )

list(APPEND _cmake_import_check_targets hdf5::h5unjam )
list(APPEND _cmake_import_check_files_for_hdf5::h5unjam "${_IMPORT_PREFIX}/tools/hdf5/h5unjam.exe" )

# Import target "hdf5::h5copy" for configuration "Debug"
set_property(TARGET hdf5::h5copy APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::h5copy PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/tools/hdf5/h5copy.exe"
  )

list(APPEND _cmake_import_check_targets hdf5::h5copy )
list(APPEND _cmake_import_check_files_for_hdf5::h5copy "${_IMPORT_PREFIX}/tools/hdf5/h5copy.exe" )

# Import target "hdf5::h5stat" for configuration "Debug"
set_property(TARGET hdf5::h5stat APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::h5stat PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/tools/hdf5/h5stat.exe"
  )

list(APPEND _cmake_import_check_targets hdf5::h5stat )
list(APPEND _cmake_import_check_files_for_hdf5::h5stat "${_IMPORT_PREFIX}/tools/hdf5/h5stat.exe" )

# Import target "hdf5::h5dump" for configuration "Debug"
set_property(TARGET hdf5::h5dump APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::h5dump PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/tools/hdf5/h5dump.exe"
  )

list(APPEND _cmake_import_check_targets hdf5::h5dump )
list(APPEND _cmake_import_check_files_for_hdf5::h5dump "${_IMPORT_PREFIX}/tools/hdf5/h5dump.exe" )

# Import target "hdf5::h5format_convert" for configuration "Debug"
set_property(TARGET hdf5::h5format_convert APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::h5format_convert PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/tools/hdf5/h5format_convert.exe"
  )

list(APPEND _cmake_import_check_targets hdf5::h5format_convert )
list(APPEND _cmake_import_check_files_for_hdf5::h5format_convert "${_IMPORT_PREFIX}/tools/hdf5/h5format_convert.exe" )

# Import target "hdf5::h5perf_serial" for configuration "Debug"
set_property(TARGET hdf5::h5perf_serial APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::h5perf_serial PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/tools/hdf5/h5perf_serial.exe"
  )

list(APPEND _cmake_import_check_targets hdf5::h5perf_serial )
list(APPEND _cmake_import_check_files_for_hdf5::h5perf_serial "${_IMPORT_PREFIX}/tools/hdf5/h5perf_serial.exe" )

# Import target "hdf5::h5perf" for configuration "Debug"
set_property(TARGET hdf5::h5perf APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::h5perf PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/tools/hdf5/h5perf.exe"
  )

list(APPEND _cmake_import_check_targets hdf5::h5perf )
list(APPEND _cmake_import_check_files_for_hdf5::h5perf "${_IMPORT_PREFIX}/tools/hdf5/h5perf.exe" )

# Import target "hdf5::hdf5_hl-shared" for configuration "Debug"
set_property(TARGET hdf5::hdf5_hl-shared APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::hdf5_hl-shared PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/hdf5_hl_D.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/hdf5_hl_D.dll"
  )

list(APPEND _cmake_import_check_targets hdf5::hdf5_hl-shared )
list(APPEND _cmake_import_check_files_for_hdf5::hdf5_hl-shared "${_IMPORT_PREFIX}/debug/lib/hdf5_hl_D.lib" "${_IMPORT_PREFIX}/debug/bin/hdf5_hl_D.dll" )

# Import target "hdf5::gif2h5" for configuration "Debug"
set_property(TARGET hdf5::gif2h5 APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::gif2h5 PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/tools/hdf5/gif2h5.exe"
  )

list(APPEND _cmake_import_check_targets hdf5::gif2h5 )
list(APPEND _cmake_import_check_files_for_hdf5::gif2h5 "${_IMPORT_PREFIX}/tools/hdf5/gif2h5.exe" )

# Import target "hdf5::h52gif" for configuration "Debug"
set_property(TARGET hdf5::h52gif APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::h52gif PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/tools/hdf5/h52gif.exe"
  )

list(APPEND _cmake_import_check_targets hdf5::h52gif )
list(APPEND _cmake_import_check_files_for_hdf5::h52gif "${_IMPORT_PREFIX}/tools/hdf5/h52gif.exe" )

# Import target "hdf5::h5watch" for configuration "Debug"
set_property(TARGET hdf5::h5watch APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::h5watch PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/tools/hdf5/h5watch.exe"
  )

list(APPEND _cmake_import_check_targets hdf5::h5watch )
list(APPEND _cmake_import_check_files_for_hdf5::h5watch "${_IMPORT_PREFIX}/tools/hdf5/h5watch.exe" )

# Import target "hdf5::hdf5_cpp-shared" for configuration "Debug"
set_property(TARGET hdf5::hdf5_cpp-shared APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::hdf5_cpp-shared PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/hdf5_cpp_D.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/hdf5_cpp_D.dll"
  )

list(APPEND _cmake_import_check_targets hdf5::hdf5_cpp-shared )
list(APPEND _cmake_import_check_files_for_hdf5::hdf5_cpp-shared "${_IMPORT_PREFIX}/debug/lib/hdf5_cpp_D.lib" "${_IMPORT_PREFIX}/debug/bin/hdf5_cpp_D.dll" )

# Import target "hdf5::hdf5_hl_cpp-shared" for configuration "Debug"
set_property(TARGET hdf5::hdf5_hl_cpp-shared APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(hdf5::hdf5_hl_cpp-shared PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/hdf5_hl_cpp_D.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/hdf5_hl_cpp_D.dll"
  )

list(APPEND _cmake_import_check_targets hdf5::hdf5_hl_cpp-shared )
list(APPEND _cmake_import_check_files_for_hdf5::hdf5_hl_cpp-shared "${_IMPORT_PREFIX}/debug/lib/hdf5_hl_cpp_D.lib" "${_IMPORT_PREFIX}/debug/bin/hdf5_hl_cpp_D.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
