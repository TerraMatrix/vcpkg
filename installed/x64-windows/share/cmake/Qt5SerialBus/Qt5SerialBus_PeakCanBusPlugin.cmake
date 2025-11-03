
add_library(Qt5::PeakCanBusPlugin MODULE IMPORTED)


if(EXISTS "${_qt5SerialBus_install_prefix}/plugins/canbus/qtpeakcanbus.dll")
    _populate_SerialBus_plugin_properties(PeakCanBusPlugin RELEASE "canbus/qtpeakcanbus.dll" FALSE)
endif()
if(EXISTS "${_qt5SerialBus_install_prefix}/debug/plugins/canbus/qtpeakcanbusd.dll")
    _populate_SerialBus_plugin_properties(PeakCanBusPlugin DEBUG "canbus/qtpeakcanbusd.dll" FALSE)
endif()

list(APPEND Qt5SerialBus_PLUGINS Qt5::PeakCanBusPlugin)
set_property(TARGET Qt5::SerialBus APPEND PROPERTY QT_ALL_PLUGINS_canbus Qt5::PeakCanBusPlugin)
set_property(TARGET Qt5::PeakCanBusPlugin PROPERTY QT_PLUGIN_TYPE "canbus")
set_property(TARGET Qt5::PeakCanBusPlugin PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::PeakCanBusPlugin PROPERTY QT_PLUGIN_CLASS_NAME "PeakCanBusPlugin")
