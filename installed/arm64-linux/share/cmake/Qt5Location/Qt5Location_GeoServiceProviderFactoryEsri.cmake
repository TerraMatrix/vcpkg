
add_library(Qt5::GeoServiceProviderFactoryEsri MODULE IMPORTED)


if(EXISTS "${_qt5Location_install_prefix}/plugins/geoservices/libqtgeoservices_esri.so")
    _populate_Location_plugin_properties(GeoServiceProviderFactoryEsri RELEASE "geoservices/libqtgeoservices_esri.so" FALSE)
endif()
if(EXISTS "${_qt5Location_install_prefix}/debug/plugins/geoservices/libqtgeoservices_esri.so")
    _populate_Location_plugin_properties(GeoServiceProviderFactoryEsri DEBUG "geoservices/libqtgeoservices_esri.so" FALSE)
endif()

list(APPEND Qt5Location_PLUGINS Qt5::GeoServiceProviderFactoryEsri)
set_property(TARGET Qt5::Location APPEND PROPERTY QT_ALL_PLUGINS_geoservices Qt5::GeoServiceProviderFactoryEsri)
set_property(TARGET Qt5::GeoServiceProviderFactoryEsri PROPERTY QT_PLUGIN_TYPE "geoservices")
set_property(TARGET Qt5::GeoServiceProviderFactoryEsri PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::GeoServiceProviderFactoryEsri PROPERTY QT_PLUGIN_CLASS_NAME "GeoServiceProviderFactoryEsri")
