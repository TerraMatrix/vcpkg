
add_library(Qt5::QGeoServiceProviderFactoryItemsOverlay MODULE IMPORTED)


if(EXISTS "${_qt5Location_install_prefix}/plugins/geoservices/libqtgeoservices_itemsoverlay.so")
    _populate_Location_plugin_properties(QGeoServiceProviderFactoryItemsOverlay RELEASE "geoservices/libqtgeoservices_itemsoverlay.so" FALSE)
endif()
if(EXISTS "${_qt5Location_install_prefix}/debug/plugins/geoservices/libqtgeoservices_itemsoverlay.so")
    _populate_Location_plugin_properties(QGeoServiceProviderFactoryItemsOverlay DEBUG "geoservices/libqtgeoservices_itemsoverlay.so" FALSE)
endif()

list(APPEND Qt5Location_PLUGINS Qt5::QGeoServiceProviderFactoryItemsOverlay)
set_property(TARGET Qt5::Location APPEND PROPERTY QT_ALL_PLUGINS_geoservices Qt5::QGeoServiceProviderFactoryItemsOverlay)
set_property(TARGET Qt5::QGeoServiceProviderFactoryItemsOverlay PROPERTY QT_PLUGIN_TYPE "geoservices")
set_property(TARGET Qt5::QGeoServiceProviderFactoryItemsOverlay PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QGeoServiceProviderFactoryItemsOverlay PROPERTY QT_PLUGIN_CLASS_NAME "QGeoServiceProviderFactoryItemsOverlay")
