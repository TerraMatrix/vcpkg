
add_library(Qt5::QGeoServiceProviderFactoryOsm MODULE IMPORTED)


if(EXISTS "${_qt5Location_install_prefix}/plugins/geoservices/qtgeoservices_osm.dll")
    _populate_Location_plugin_properties(QGeoServiceProviderFactoryOsm RELEASE "geoservices/qtgeoservices_osm.dll" FALSE)
endif()
if(EXISTS "${_qt5Location_install_prefix}/debug/plugins/geoservices/qtgeoservices_osmd.dll")
    _populate_Location_plugin_properties(QGeoServiceProviderFactoryOsm DEBUG "geoservices/qtgeoservices_osmd.dll" FALSE)
endif()

list(APPEND Qt5Location_PLUGINS Qt5::QGeoServiceProviderFactoryOsm)
set_property(TARGET Qt5::Location APPEND PROPERTY QT_ALL_PLUGINS_geoservices Qt5::QGeoServiceProviderFactoryOsm)
set_property(TARGET Qt5::QGeoServiceProviderFactoryOsm PROPERTY QT_PLUGIN_TYPE "geoservices")
set_property(TARGET Qt5::QGeoServiceProviderFactoryOsm PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QGeoServiceProviderFactoryOsm PROPERTY QT_PLUGIN_CLASS_NAME "QGeoServiceProviderFactoryOsm")
