
add_library(Qt5::QGeoServiceProviderFactoryOsm MODULE IMPORTED)


if(EXISTS "${_qt5Location_install_prefix}/plugins/geoservices/libqtgeoservices_osm.so")
    _populate_Location_plugin_properties(QGeoServiceProviderFactoryOsm RELEASE "geoservices/libqtgeoservices_osm.so" FALSE)
endif()
if(EXISTS "${_qt5Location_install_prefix}/debug/plugins/geoservices/libqtgeoservices_osm.so")
    _populate_Location_plugin_properties(QGeoServiceProviderFactoryOsm DEBUG "geoservices/libqtgeoservices_osm.so" FALSE)
endif()

list(APPEND Qt5Location_PLUGINS Qt5::QGeoServiceProviderFactoryOsm)
set_property(TARGET Qt5::Location APPEND PROPERTY QT_ALL_PLUGINS_geoservices Qt5::QGeoServiceProviderFactoryOsm)
set_property(TARGET Qt5::QGeoServiceProviderFactoryOsm PROPERTY QT_PLUGIN_TYPE "geoservices")
set_property(TARGET Qt5::QGeoServiceProviderFactoryOsm PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QGeoServiceProviderFactoryOsm PROPERTY QT_PLUGIN_CLASS_NAME "QGeoServiceProviderFactoryOsm")
