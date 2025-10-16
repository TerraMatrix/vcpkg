#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "unofficial::osg::OpenThreads" for configuration "Debug"
set_property(TARGET unofficial::osg::OpenThreads APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::osg::OpenThreads PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/OpenThreadsd.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/OpenThreadsd.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::OpenThreads )
list(APPEND _cmake_import_check_files_for_unofficial::osg::OpenThreads "${_IMPORT_PREFIX}/debug/lib/OpenThreadsd.lib" "${_IMPORT_PREFIX}/debug/bin/OpenThreadsd.dll" )

# Import target "unofficial::osg::osg" for configuration "Debug"
set_property(TARGET unofficial::osg::osg APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::osg::osg PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/osgd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/osgd.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osg )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osg "${_IMPORT_PREFIX}/debug/lib/osgd.lib" "${_IMPORT_PREFIX}/debug/bin/osgd.dll" )

# Import target "unofficial::osg::osgDB" for configuration "Debug"
set_property(TARGET unofficial::osg::osgDB APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::osg::osgDB PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/osgDBd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "unofficial::osg::osg;unofficial::osg::osgUtil;unofficial::osg::OpenThreads;${_IMPORT_PREFIX}/debug/lib/zlibd.lib;opengl32"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/osgDBd.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgDB )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgDB "${_IMPORT_PREFIX}/debug/lib/osgDBd.lib" "${_IMPORT_PREFIX}/debug/bin/osgDBd.dll" )

# Import target "unofficial::osg::osgUtil" for configuration "Debug"
set_property(TARGET unofficial::osg::osgUtil APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::osg::osgUtil PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/osgUtild.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/osgUtild.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgUtil )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgUtil "${_IMPORT_PREFIX}/debug/lib/osgUtild.lib" "${_IMPORT_PREFIX}/debug/bin/osgUtild.dll" )

# Import target "unofficial::osg::osgGA" for configuration "Debug"
set_property(TARGET unofficial::osg::osgGA APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::osg::osgGA PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/osgGAd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "unofficial::osg::osgDB;unofficial::osg::osgUtil;unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/osgGAd.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgGA )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgGA "${_IMPORT_PREFIX}/debug/lib/osgGAd.lib" "${_IMPORT_PREFIX}/debug/bin/osgGAd.dll" )

# Import target "unofficial::osg::osgText" for configuration "Debug"
set_property(TARGET unofficial::osg::osgText APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::osg::osgText PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/osgTextd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::osgUtil;unofficial::osg::OpenThreads;Fontconfig::Fontconfig;opengl32"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/osgTextd.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgText )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgText "${_IMPORT_PREFIX}/debug/lib/osgTextd.lib" "${_IMPORT_PREFIX}/debug/bin/osgTextd.dll" )

# Import target "unofficial::osg::osgViewer" for configuration "Debug"
set_property(TARGET unofficial::osg::osgViewer APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::osg::osgViewer PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/osgViewerd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "unofficial::osg::osgGA;unofficial::osg::osgText;unofficial::osg::osgDB;unofficial::osg::osgUtil;unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/osgViewerd.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgViewer )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgViewer "${_IMPORT_PREFIX}/debug/lib/osgViewerd.lib" "${_IMPORT_PREFIX}/debug/bin/osgViewerd.dll" )

# Import target "unofficial::osg::osgAnimation" for configuration "Debug"
set_property(TARGET unofficial::osg::osgAnimation APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::osg::osgAnimation PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/osgAnimationd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "unofficial::osg::osg;unofficial::osg::osgText;unofficial::osg::osgGA;unofficial::osg::osgViewer;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/osgAnimationd.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgAnimation )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgAnimation "${_IMPORT_PREFIX}/debug/lib/osgAnimationd.lib" "${_IMPORT_PREFIX}/debug/bin/osgAnimationd.dll" )

# Import target "unofficial::osg::osgFX" for configuration "Debug"
set_property(TARGET unofficial::osg::osgFX APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::osg::osgFX PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/osgFXd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "unofficial::osg::osgUtil;unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/osgFXd.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgFX )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgFX "${_IMPORT_PREFIX}/debug/lib/osgFXd.lib" "${_IMPORT_PREFIX}/debug/bin/osgFXd.dll" )

# Import target "unofficial::osg::osgManipulator" for configuration "Debug"
set_property(TARGET unofficial::osg::osgManipulator APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::osg::osgManipulator PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/osgManipulatord.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "unofficial::osg::osgViewer;unofficial::osg::osgGA;unofficial::osg::osgUtil;unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/osgManipulatord.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgManipulator )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgManipulator "${_IMPORT_PREFIX}/debug/lib/osgManipulatord.lib" "${_IMPORT_PREFIX}/debug/bin/osgManipulatord.dll" )

# Import target "unofficial::osg::osgParticle" for configuration "Debug"
set_property(TARGET unofficial::osg::osgParticle APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::osg::osgParticle PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/osgParticled.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "unofficial::osg::osgUtil;unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/osgParticled.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgParticle )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgParticle "${_IMPORT_PREFIX}/debug/lib/osgParticled.lib" "${_IMPORT_PREFIX}/debug/bin/osgParticled.dll" )

# Import target "unofficial::osg::osgUI" for configuration "Debug"
set_property(TARGET unofficial::osg::osgUI APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::osg::osgUI PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/osgUId.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "unofficial::osg::osgDB;unofficial::osg::osgGA;unofficial::osg::osgUtil;unofficial::osg::osgText;unofficial::osg::osgViewer;unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/osgUId.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgUI )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgUI "${_IMPORT_PREFIX}/debug/lib/osgUId.lib" "${_IMPORT_PREFIX}/debug/bin/osgUId.dll" )

# Import target "unofficial::osg::osgVolume" for configuration "Debug"
set_property(TARGET unofficial::osg::osgVolume APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::osg::osgVolume PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/osgVolumed.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "unofficial::osg::osgUtil;unofficial::osg::osgDB;unofficial::osg::osgGA;unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/osgVolumed.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgVolume )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgVolume "${_IMPORT_PREFIX}/debug/lib/osgVolumed.lib" "${_IMPORT_PREFIX}/debug/bin/osgVolumed.dll" )

# Import target "unofficial::osg::osgShadow" for configuration "Debug"
set_property(TARGET unofficial::osg::osgShadow APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::osg::osgShadow PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/osgShadowd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "unofficial::osg::osgUtil;unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/osgShadowd.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgShadow )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgShadow "${_IMPORT_PREFIX}/debug/lib/osgShadowd.lib" "${_IMPORT_PREFIX}/debug/bin/osgShadowd.dll" )

# Import target "unofficial::osg::osgSim" for configuration "Debug"
set_property(TARGET unofficial::osg::osgSim APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::osg::osgSim PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/osgSimd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "unofficial::osg::osgText;unofficial::osg::osgUtil;unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/osgSimd.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgSim )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgSim "${_IMPORT_PREFIX}/debug/lib/osgSimd.lib" "${_IMPORT_PREFIX}/debug/bin/osgSimd.dll" )

# Import target "unofficial::osg::osgTerrain" for configuration "Debug"
set_property(TARGET unofficial::osg::osgTerrain APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::osg::osgTerrain PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/osgTerraind.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "unofficial::osg::osgUtil;unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/osgTerraind.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgTerrain )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgTerrain "${_IMPORT_PREFIX}/debug/lib/osgTerraind.lib" "${_IMPORT_PREFIX}/debug/bin/osgTerraind.dll" )

# Import target "unofficial::osg::osgWidget" for configuration "Debug"
set_property(TARGET unofficial::osg::osgWidget APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::osg::osgWidget PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/osgWidgetd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "unofficial::osg::osgText;unofficial::osg::osgViewer;unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::OpenThreads;unofficial::osg::osgGA;opengl32"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/osgWidgetd.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgWidget )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgWidget "${_IMPORT_PREFIX}/debug/lib/osgWidgetd.lib" "${_IMPORT_PREFIX}/debug/bin/osgWidgetd.dll" )

# Import target "unofficial::osg::osgPresentation" for configuration "Debug"
set_property(TARGET unofficial::osg::osgPresentation APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::osg::osgPresentation PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/osgPresentationd.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "unofficial::osg::osgViewer;unofficial::osg::osgUI;unofficial::osg::osgWidget;unofficial::osg::osgManipulator;unofficial::osg::osgVolume;unofficial::osg::osgFX;unofficial::osg::osgText;unofficial::osg::osgGA;unofficial::osg::osgUtil;unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/osgPresentationd.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgPresentation )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgPresentation "${_IMPORT_PREFIX}/debug/lib/osgPresentationd.lib" "${_IMPORT_PREFIX}/debug/bin/osgPresentationd.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
