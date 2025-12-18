
add_library(Qt5::QGeoServiceProviderFactoryMapboxGL MODULE IMPORTED)


if(EXISTS "${_qt5Location_install_prefix}/plugins/geoservices/libqtgeoservices_mapboxgl.so")
    _populate_Location_plugin_properties(QGeoServiceProviderFactoryMapboxGL RELEASE "geoservices/libqtgeoservices_mapboxgl.so" FALSE)
endif()
if(EXISTS "${_qt5Location_install_prefix}/debug/plugins/geoservices/libqtgeoservices_mapboxgl.so")
    _populate_Location_plugin_properties(QGeoServiceProviderFactoryMapboxGL DEBUG "geoservices/libqtgeoservices_mapboxgl.so" FALSE)
endif()

list(APPEND Qt5Location_PLUGINS Qt5::QGeoServiceProviderFactoryMapboxGL)
set_property(TARGET Qt5::Location APPEND PROPERTY QT_ALL_PLUGINS_geoservices Qt5::QGeoServiceProviderFactoryMapboxGL)
set_property(TARGET Qt5::QGeoServiceProviderFactoryMapboxGL PROPERTY QT_PLUGIN_TYPE "geoservices")
set_property(TARGET Qt5::QGeoServiceProviderFactoryMapboxGL PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QGeoServiceProviderFactoryMapboxGL PROPERTY QT_PLUGIN_CLASS_NAME "QGeoServiceProviderFactoryMapboxGL")
