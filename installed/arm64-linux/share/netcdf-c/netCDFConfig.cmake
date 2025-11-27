get_filename_component(VCPKG_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)
# NetCDF Configuration Summary
#
# General
#

####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was netCDFConfig.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

if(NOT "OFF")
  include(CMakeFindDependencyMacro)
  find_dependency(tinyxml2 CONFIG)
  if("")
    find_dependency(CURL)
  endif()
  if("OFF")
    find_dependency(libzip CONFIG)
  endif()
endif()

set(NetCDFVersion "4.9.3")
set_and_check(netCDF_INSTALL_PREFIX "${VCPKG_IMPORT_PREFIX}")
set_and_check(netCDF_INCLUDE_DIR "${VCPKG_IMPORT_PREFIX}/include")
set_and_check(netCDF_LIB_DIR "${VCPKG_IMPORT_PREFIX}/lib")
set(netCDF_LIBRARIES netCDF::netcdf)

# include target information
include("${CMAKE_CURRENT_LIST_DIR}/netCDFTargets.cmake")



# Compiling Options
#
set(netCDF_C_COMPILER "/usr/bin/cc")
set(netCDF_C_COMPILER_FLAGS "-fPIC -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O3 -DNDEBUG")
set(netCDF_C_CPP_FLAGS " ")
set(netCDF_LDFLAGS " ")
set(netCDF_AM_CFLAGS "")
set(netCDF_AM_CPPFLAGS "")
set(netCDF_AM_LDFLAGS "")
set(netCDF_SHARED no)
set(netCDF_STATIC yes)

# Features:
#
set(netCDF_HAS_NC2 yes)
set(netCDF_HAS_NC4 no)
set(netCDF_HAS_HDF4 no)
set(netCDF_HAS_HDF5 no)
set(netCDF_HAS_PNETCDF no)
set(netCDF_HAS_PARALLEL no)
set(netCDF_HAS_DAP no)
set(netCDF_HAS_DAP2 no)
set(netCDF_HAS_DAP4 no)
set(netCDF_HAS_DISKLESS yes)
set(netCDF_HAS_MMAP yes)
if (netCDF_HAS_HDF4 OR netCDF_HAS_HDF5)
  include(CMakeFindDependencyMacro)
  find_dependency(hdf5 CONFIG)
endif ()

if (no)
  include(CMakeFindDependencyMacro)
  find_dependency(MPI  EXACT)
endif()
