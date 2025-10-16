#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "unofficial::osg::OpenThreads" for configuration "Release"
set_property(TARGET unofficial::osg::OpenThreads APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::OpenThreads PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/OpenThreads.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/OpenThreads.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::OpenThreads )
list(APPEND _cmake_import_check_files_for_unofficial::osg::OpenThreads "${_IMPORT_PREFIX}/lib/OpenThreads.lib" "${_IMPORT_PREFIX}/bin/OpenThreads.dll" )

# Import target "unofficial::osg::osg" for configuration "Release"
set_property(TARGET unofficial::osg::osg APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osg PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/osg.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/osg.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osg )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osg "${_IMPORT_PREFIX}/lib/osg.lib" "${_IMPORT_PREFIX}/bin/osg.dll" )

# Import target "unofficial::osg::osgDB" for configuration "Release"
set_property(TARGET unofficial::osg::osgDB APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgDB PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/osgDB.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osg;unofficial::osg::osgUtil;unofficial::osg::OpenThreads;${_IMPORT_PREFIX}/lib/zlib.lib;opengl32"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/osgDB.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgDB )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgDB "${_IMPORT_PREFIX}/lib/osgDB.lib" "${_IMPORT_PREFIX}/bin/osgDB.dll" )

# Import target "unofficial::osg::osgUtil" for configuration "Release"
set_property(TARGET unofficial::osg::osgUtil APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgUtil PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/osgUtil.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/osgUtil.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgUtil )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgUtil "${_IMPORT_PREFIX}/lib/osgUtil.lib" "${_IMPORT_PREFIX}/bin/osgUtil.dll" )

# Import target "unofficial::osg::osgGA" for configuration "Release"
set_property(TARGET unofficial::osg::osgGA APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgGA PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/osgGA.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgDB;unofficial::osg::osgUtil;unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/osgGA.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgGA )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgGA "${_IMPORT_PREFIX}/lib/osgGA.lib" "${_IMPORT_PREFIX}/bin/osgGA.dll" )

# Import target "unofficial::osg::osgText" for configuration "Release"
set_property(TARGET unofficial::osg::osgText APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgText PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/osgText.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::osgUtil;unofficial::osg::OpenThreads;Fontconfig::Fontconfig;opengl32"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/osgText.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgText )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgText "${_IMPORT_PREFIX}/lib/osgText.lib" "${_IMPORT_PREFIX}/bin/osgText.dll" )

# Import target "unofficial::osg::osgViewer" for configuration "Release"
set_property(TARGET unofficial::osg::osgViewer APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgViewer PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/osgViewer.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgGA;unofficial::osg::osgText;unofficial::osg::osgDB;unofficial::osg::osgUtil;unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/osgViewer.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgViewer )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgViewer "${_IMPORT_PREFIX}/lib/osgViewer.lib" "${_IMPORT_PREFIX}/bin/osgViewer.dll" )

# Import target "unofficial::osg::osgAnimation" for configuration "Release"
set_property(TARGET unofficial::osg::osgAnimation APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgAnimation PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/osgAnimation.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osg;unofficial::osg::osgText;unofficial::osg::osgGA;unofficial::osg::osgViewer;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/osgAnimation.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgAnimation )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgAnimation "${_IMPORT_PREFIX}/lib/osgAnimation.lib" "${_IMPORT_PREFIX}/bin/osgAnimation.dll" )

# Import target "unofficial::osg::osgFX" for configuration "Release"
set_property(TARGET unofficial::osg::osgFX APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgFX PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/osgFX.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgUtil;unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/osgFX.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgFX )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgFX "${_IMPORT_PREFIX}/lib/osgFX.lib" "${_IMPORT_PREFIX}/bin/osgFX.dll" )

# Import target "unofficial::osg::osgManipulator" for configuration "Release"
set_property(TARGET unofficial::osg::osgManipulator APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgManipulator PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/osgManipulator.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgViewer;unofficial::osg::osgGA;unofficial::osg::osgUtil;unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/osgManipulator.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgManipulator )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgManipulator "${_IMPORT_PREFIX}/lib/osgManipulator.lib" "${_IMPORT_PREFIX}/bin/osgManipulator.dll" )

# Import target "unofficial::osg::osgParticle" for configuration "Release"
set_property(TARGET unofficial::osg::osgParticle APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgParticle PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/osgParticle.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgUtil;unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/osgParticle.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgParticle )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgParticle "${_IMPORT_PREFIX}/lib/osgParticle.lib" "${_IMPORT_PREFIX}/bin/osgParticle.dll" )

# Import target "unofficial::osg::osgUI" for configuration "Release"
set_property(TARGET unofficial::osg::osgUI APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgUI PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/osgUI.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgDB;unofficial::osg::osgGA;unofficial::osg::osgUtil;unofficial::osg::osgText;unofficial::osg::osgViewer;unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/osgUI.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgUI )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgUI "${_IMPORT_PREFIX}/lib/osgUI.lib" "${_IMPORT_PREFIX}/bin/osgUI.dll" )

# Import target "unofficial::osg::osgVolume" for configuration "Release"
set_property(TARGET unofficial::osg::osgVolume APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgVolume PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/osgVolume.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgUtil;unofficial::osg::osgDB;unofficial::osg::osgGA;unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/osgVolume.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgVolume )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgVolume "${_IMPORT_PREFIX}/lib/osgVolume.lib" "${_IMPORT_PREFIX}/bin/osgVolume.dll" )

# Import target "unofficial::osg::osgShadow" for configuration "Release"
set_property(TARGET unofficial::osg::osgShadow APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgShadow PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/osgShadow.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgUtil;unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/osgShadow.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgShadow )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgShadow "${_IMPORT_PREFIX}/lib/osgShadow.lib" "${_IMPORT_PREFIX}/bin/osgShadow.dll" )

# Import target "unofficial::osg::osgSim" for configuration "Release"
set_property(TARGET unofficial::osg::osgSim APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgSim PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/osgSim.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgText;unofficial::osg::osgUtil;unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/osgSim.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgSim )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgSim "${_IMPORT_PREFIX}/lib/osgSim.lib" "${_IMPORT_PREFIX}/bin/osgSim.dll" )

# Import target "unofficial::osg::osgTerrain" for configuration "Release"
set_property(TARGET unofficial::osg::osgTerrain APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgTerrain PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/osgTerrain.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgUtil;unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/osgTerrain.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgTerrain )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgTerrain "${_IMPORT_PREFIX}/lib/osgTerrain.lib" "${_IMPORT_PREFIX}/bin/osgTerrain.dll" )

# Import target "unofficial::osg::osgWidget" for configuration "Release"
set_property(TARGET unofficial::osg::osgWidget APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgWidget PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/osgWidget.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgText;unofficial::osg::osgViewer;unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::OpenThreads;unofficial::osg::osgGA;opengl32"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/osgWidget.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgWidget )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgWidget "${_IMPORT_PREFIX}/lib/osgWidget.lib" "${_IMPORT_PREFIX}/bin/osgWidget.dll" )

# Import target "unofficial::osg::osgPresentation" for configuration "Release"
set_property(TARGET unofficial::osg::osgPresentation APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgPresentation PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/osgPresentation.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgViewer;unofficial::osg::osgUI;unofficial::osg::osgWidget;unofficial::osg::osgManipulator;unofficial::osg::osgVolume;unofficial::osg::osgFX;unofficial::osg::osgText;unofficial::osg::osgGA;unofficial::osg::osgUtil;unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::OpenThreads;opengl32"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/osgPresentation.dll"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgPresentation )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgPresentation "${_IMPORT_PREFIX}/lib/osgPresentation.lib" "${_IMPORT_PREFIX}/bin/osgPresentation.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
