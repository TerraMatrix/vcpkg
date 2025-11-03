
add_library(Qt5::QGeoPositionInfoSourceFactoryPoll MODULE IMPORTED)


if(EXISTS "${_qt5Positioning_install_prefix}/plugins/position/qtposition_positionpoll.dll")
    _populate_Positioning_plugin_properties(QGeoPositionInfoSourceFactoryPoll RELEASE "position/qtposition_positionpoll.dll" FALSE)
endif()
if(EXISTS "${_qt5Positioning_install_prefix}/debug/plugins/position/qtposition_positionpolld.dll")
    _populate_Positioning_plugin_properties(QGeoPositionInfoSourceFactoryPoll DEBUG "position/qtposition_positionpolld.dll" FALSE)
endif()

list(APPEND Qt5Positioning_PLUGINS Qt5::QGeoPositionInfoSourceFactoryPoll)
set_property(TARGET Qt5::Positioning APPEND PROPERTY QT_ALL_PLUGINS_position Qt5::QGeoPositionInfoSourceFactoryPoll)
set_property(TARGET Qt5::QGeoPositionInfoSourceFactoryPoll PROPERTY QT_PLUGIN_TYPE "position")
set_property(TARGET Qt5::QGeoPositionInfoSourceFactoryPoll PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QGeoPositionInfoSourceFactoryPoll PROPERTY QT_PLUGIN_CLASS_NAME "QGeoPositionInfoSourceFactoryPoll")
