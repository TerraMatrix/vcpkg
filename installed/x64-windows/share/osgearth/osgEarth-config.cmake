#
# osgEarth CMake Config
#
# Developer inputs:
#    OSGEARTH_VERSION : osgEarth version string
#    OSGEARTH_COMPONENTS : list of libraries for which to create namespaced imports
#    OSGEARTH_PUBLIC_DEPENDENCIES : list of libraries for which to generate find_dependency
#
# User outputs:
#    osgEarth::osgEarth import library (and one for each additonal nodekit)
#    osgEarth_FOUND : true if successful
#    osgEarth_INCLUDE_DIR : include root
#    osgEarth_SHARE_DIR : location of share folder containing cmake files and external resources
#
cmake_minimum_required(VERSION 3.10.0)


####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was osgEarth-config.cmake.in                            ########

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

set(osgEarth_VERSION 3.7.1)
set(OSGEARTH_VERSION 3.7.1)

if(NOT CMAKE_CXX_STANDARD)
    set(CMAKE_CXX_STANDARD 14)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)
    set(CMAKE_CXX_EXTENSIONS OFF)
endif()

set(osgEarth_INCLUDE_DIR "${PACKAGE_PREFIX_DIR}/include")
set(osgEarth_SHARE_DIR "${PACKAGE_PREFIX_DIR}/share/osgEarth")
set_and_check(osgEarth_BUILD_DIR "${PACKAGE_PREFIX_DIR}")

# always depend on the public-facing OSG libraries
include(CMakeFindDependencyMacro)
find_dependency(OpenSceneGraph REQUIRED COMPONENTS osg osgDB osgGA osgUtil osgViewer OpenThreads)
include_directories(${OPENSCENEGRAPH_INCLUDE_DIR})

# additional public dependencies
foreach(MY_DEPENDENCY GLEW;OpenGL)
    find_dependency(${MY_DEPENDENCY} REQUIRED)
endforeach()

# include the target for each library in OSGEARTH_COMPONENTS:
foreach(MY_COMPONENT osgEarth;osgEarthImGui)
    if(NOT TARGET osgEarth::${MY_COMPONENT})
        include("${CMAKE_CURRENT_LIST_DIR}/${MY_COMPONENT}-targets.cmake")
    endif()
endforeach()

set(osgEarth_FOUND TRUE)
set(OSGEARTH_FOUND TRUE)
