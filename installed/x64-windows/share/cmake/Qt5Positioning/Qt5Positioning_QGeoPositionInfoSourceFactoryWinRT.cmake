
add_library(Qt5::QGeoPositionInfoSourceFactoryWinRT MODULE IMPORTED)


if(EXISTS "${_qt5Positioning_install_prefix}/plugins/position/qtposition_winrt.dll")
    _populate_Positioning_plugin_properties(QGeoPositionInfoSourceFactoryWinRT RELEASE "position/qtposition_winrt.dll" FALSE)
endif()
if(EXISTS "${_qt5Positioning_install_prefix}/debug/plugins/position/qtposition_winrtd.dll")
    _populate_Positioning_plugin_properties(QGeoPositionInfoSourceFactoryWinRT DEBUG "position/qtposition_winrtd.dll" FALSE)
endif()

list(APPEND Qt5Positioning_PLUGINS Qt5::QGeoPositionInfoSourceFactoryWinRT)
set_property(TARGET Qt5::Positioning APPEND PROPERTY QT_ALL_PLUGINS_position Qt5::QGeoPositionInfoSourceFactoryWinRT)
set_property(TARGET Qt5::QGeoPositionInfoSourceFactoryWinRT PROPERTY QT_PLUGIN_TYPE "position")
set_property(TARGET Qt5::QGeoPositionInfoSourceFactoryWinRT PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QGeoPositionInfoSourceFactoryWinRT PROPERTY QT_PLUGIN_CLASS_NAME "QGeoPositionInfoSourceFactoryWinRT")
