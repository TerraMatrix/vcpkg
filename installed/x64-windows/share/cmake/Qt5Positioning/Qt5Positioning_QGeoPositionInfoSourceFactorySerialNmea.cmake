
add_library(Qt5::QGeoPositionInfoSourceFactorySerialNmea MODULE IMPORTED)


if(EXISTS "${_qt5Positioning_install_prefix}/plugins/position/qtposition_serialnmea.dll")
    _populate_Positioning_plugin_properties(QGeoPositionInfoSourceFactorySerialNmea RELEASE "position/qtposition_serialnmea.dll" FALSE)
endif()
if(EXISTS "${_qt5Positioning_install_prefix}/debug/plugins/position/qtposition_serialnmead.dll")
    _populate_Positioning_plugin_properties(QGeoPositionInfoSourceFactorySerialNmea DEBUG "position/qtposition_serialnmead.dll" FALSE)
endif()

list(APPEND Qt5Positioning_PLUGINS Qt5::QGeoPositionInfoSourceFactorySerialNmea)
set_property(TARGET Qt5::Positioning APPEND PROPERTY QT_ALL_PLUGINS_position Qt5::QGeoPositionInfoSourceFactorySerialNmea)
set_property(TARGET Qt5::QGeoPositionInfoSourceFactorySerialNmea PROPERTY QT_PLUGIN_TYPE "position")
set_property(TARGET Qt5::QGeoPositionInfoSourceFactorySerialNmea PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QGeoPositionInfoSourceFactorySerialNmea PROPERTY QT_PLUGIN_CLASS_NAME "QGeoPositionInfoSourceFactorySerialNmea")
