#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "unofficial::osg::OpenThreads" for configuration "Release"
set_property(TARGET unofficial::osg::OpenThreads APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::OpenThreads PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "-pthread"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libOpenThreads.a"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::OpenThreads )
list(APPEND _cmake_import_check_files_for_unofficial::osg::OpenThreads "${_IMPORT_PREFIX}/lib/libOpenThreads.a" )

# Import target "unofficial::osg::osg" for configuration "Release"
set_property(TARGET unofficial::osg::osg APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osg PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::OpenThreads;-pthread;/usr/lib/aarch64-linux-gnu/libm.so;/usr/lib/aarch64-linux-gnu/librt.so;/usr/lib/aarch64-linux-gnu/libdl.so;/usr/lib/aarch64-linux-gnu/libGL.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libosg.a"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osg )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osg "${_IMPORT_PREFIX}/lib/libosg.a" )

# Import target "unofficial::osg::osgDB" for configuration "Release"
set_property(TARGET unofficial::osg::osgDB APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgDB PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osg;unofficial::osg::osgUtil;unofficial::osg::OpenThreads;/usr/lib/aarch64-linux-gnu/libdl.so;${_IMPORT_PREFIX}/lib/libz.a;/usr/lib/aarch64-linux-gnu/libGL.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libosgDB.a"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgDB )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgDB "${_IMPORT_PREFIX}/lib/libosgDB.a" )

# Import target "unofficial::osg::osgUtil" for configuration "Release"
set_property(TARGET unofficial::osg::osgUtil APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgUtil PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osg;unofficial::osg::OpenThreads;/usr/lib/aarch64-linux-gnu/libGL.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libosgUtil.a"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgUtil )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgUtil "${_IMPORT_PREFIX}/lib/libosgUtil.a" )

# Import target "unofficial::osg::osgGA" for configuration "Release"
set_property(TARGET unofficial::osg::osgGA APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgGA PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgDB;unofficial::osg::osgUtil;unofficial::osg::osg;unofficial::osg::OpenThreads;/usr/lib/aarch64-linux-gnu/libGL.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libosgGA.a"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgGA )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgGA "${_IMPORT_PREFIX}/lib/libosgGA.a" )

# Import target "unofficial::osg::osgText" for configuration "Release"
set_property(TARGET unofficial::osg::osgText APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgText PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::osgUtil;unofficial::osg::OpenThreads;Fontconfig::Fontconfig;/usr/lib/aarch64-linux-gnu/libGL.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libosgText.a"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgText )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgText "${_IMPORT_PREFIX}/lib/libosgText.a" )

# Import target "unofficial::osg::osgViewer" for configuration "Release"
set_property(TARGET unofficial::osg::osgViewer APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgViewer PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgGA;unofficial::osg::osgText;unofficial::osg::osgDB;unofficial::osg::osgUtil;unofficial::osg::osg;unofficial::osg::OpenThreads;/usr/lib/aarch64-linux-gnu/libX11.so;/usr/lib/aarch64-linux-gnu/libGL.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libosgViewer.a"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgViewer )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgViewer "${_IMPORT_PREFIX}/lib/libosgViewer.a" )

# Import target "unofficial::osg::osgAnimation" for configuration "Release"
set_property(TARGET unofficial::osg::osgAnimation APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgAnimation PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osg;unofficial::osg::osgText;unofficial::osg::osgGA;unofficial::osg::osgViewer;unofficial::osg::OpenThreads;/usr/lib/aarch64-linux-gnu/libGL.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libosgAnimation.a"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgAnimation )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgAnimation "${_IMPORT_PREFIX}/lib/libosgAnimation.a" )

# Import target "unofficial::osg::osgFX" for configuration "Release"
set_property(TARGET unofficial::osg::osgFX APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgFX PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgUtil;unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::OpenThreads;/usr/lib/aarch64-linux-gnu/libGL.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libosgFX.a"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgFX )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgFX "${_IMPORT_PREFIX}/lib/libosgFX.a" )

# Import target "unofficial::osg::osgManipulator" for configuration "Release"
set_property(TARGET unofficial::osg::osgManipulator APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgManipulator PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgViewer;unofficial::osg::osgGA;unofficial::osg::osgUtil;unofficial::osg::osg;unofficial::osg::OpenThreads;/usr/lib/aarch64-linux-gnu/libGL.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libosgManipulator.a"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgManipulator )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgManipulator "${_IMPORT_PREFIX}/lib/libosgManipulator.a" )

# Import target "unofficial::osg::osgParticle" for configuration "Release"
set_property(TARGET unofficial::osg::osgParticle APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgParticle PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgUtil;unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::OpenThreads;/usr/lib/aarch64-linux-gnu/libGL.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libosgParticle.a"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgParticle )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgParticle "${_IMPORT_PREFIX}/lib/libosgParticle.a" )

# Import target "unofficial::osg::osgUI" for configuration "Release"
set_property(TARGET unofficial::osg::osgUI APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgUI PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgDB;unofficial::osg::osgGA;unofficial::osg::osgUtil;unofficial::osg::osgText;unofficial::osg::osgViewer;unofficial::osg::osg;unofficial::osg::OpenThreads;/usr/lib/aarch64-linux-gnu/libGL.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libosgUI.a"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgUI )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgUI "${_IMPORT_PREFIX}/lib/libosgUI.a" )

# Import target "unofficial::osg::osgVolume" for configuration "Release"
set_property(TARGET unofficial::osg::osgVolume APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgVolume PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgUtil;unofficial::osg::osgDB;unofficial::osg::osgGA;unofficial::osg::osg;unofficial::osg::OpenThreads;/usr/lib/aarch64-linux-gnu/libGL.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libosgVolume.a"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgVolume )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgVolume "${_IMPORT_PREFIX}/lib/libosgVolume.a" )

# Import target "unofficial::osg::osgShadow" for configuration "Release"
set_property(TARGET unofficial::osg::osgShadow APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgShadow PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgUtil;unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::OpenThreads;/usr/lib/aarch64-linux-gnu/libGL.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libosgShadow.a"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgShadow )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgShadow "${_IMPORT_PREFIX}/lib/libosgShadow.a" )

# Import target "unofficial::osg::osgSim" for configuration "Release"
set_property(TARGET unofficial::osg::osgSim APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgSim PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgText;unofficial::osg::osgUtil;unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::OpenThreads;/usr/lib/aarch64-linux-gnu/libGL.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libosgSim.a"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgSim )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgSim "${_IMPORT_PREFIX}/lib/libosgSim.a" )

# Import target "unofficial::osg::osgTerrain" for configuration "Release"
set_property(TARGET unofficial::osg::osgTerrain APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgTerrain PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgUtil;unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::OpenThreads;/usr/lib/aarch64-linux-gnu/libGL.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libosgTerrain.a"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgTerrain )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgTerrain "${_IMPORT_PREFIX}/lib/libosgTerrain.a" )

# Import target "unofficial::osg::osgWidget" for configuration "Release"
set_property(TARGET unofficial::osg::osgWidget APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgWidget PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgText;unofficial::osg::osgViewer;unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::OpenThreads;unofficial::osg::osgGA;/usr/lib/aarch64-linux-gnu/libGL.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libosgWidget.a"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgWidget )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgWidget "${_IMPORT_PREFIX}/lib/libosgWidget.a" )

# Import target "unofficial::osg::osgPresentation" for configuration "Release"
set_property(TARGET unofficial::osg::osgPresentation APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::osg::osgPresentation PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "unofficial::osg::osgViewer;unofficial::osg::osgUI;unofficial::osg::osgWidget;unofficial::osg::osgManipulator;unofficial::osg::osgVolume;unofficial::osg::osgFX;unofficial::osg::osgText;unofficial::osg::osgGA;unofficial::osg::osgUtil;unofficial::osg::osgDB;unofficial::osg::osg;unofficial::osg::OpenThreads;/usr/lib/aarch64-linux-gnu/libGL.so"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libosgPresentation.a"
  )

list(APPEND _cmake_import_check_targets unofficial::osg::osgPresentation )
list(APPEND _cmake_import_check_files_for_unofficial::osg::osgPresentation "${_IMPORT_PREFIX}/lib/libosgPresentation.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
