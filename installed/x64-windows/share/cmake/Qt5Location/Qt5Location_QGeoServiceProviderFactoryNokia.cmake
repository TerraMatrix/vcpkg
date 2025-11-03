
add_library(Qt5::QGeoServiceProviderFactoryNokia MODULE IMPORTED)


if(EXISTS "${_qt5Location_install_prefix}/plugins/geoservices/qtgeoservices_nokia.dll")
    _populate_Location_plugin_properties(QGeoServiceProviderFactoryNokia RELEASE "geoservices/qtgeoservices_nokia.dll" FALSE)
endif()
if(EXISTS "${_qt5Location_install_prefix}/debug/plugins/geoservices/qtgeoservices_nokiad.dll")
    _populate_Location_plugin_properties(QGeoServiceProviderFactoryNokia DEBUG "geoservices/qtgeoservices_nokiad.dll" FALSE)
endif()

list(APPEND Qt5Location_PLUGINS Qt5::QGeoServiceProviderFactoryNokia)
set_property(TARGET Qt5::Location APPEND PROPERTY QT_ALL_PLUGINS_geoservices Qt5::QGeoServiceProviderFactoryNokia)
set_property(TARGET Qt5::QGeoServiceProviderFactoryNokia PROPERTY QT_PLUGIN_TYPE "geoservices")
set_property(TARGET Qt5::QGeoServiceProviderFactoryNokia PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QGeoServiceProviderFactoryNokia PROPERTY QT_PLUGIN_CLASS_NAME "QGeoServiceProviderFactoryNokia")
