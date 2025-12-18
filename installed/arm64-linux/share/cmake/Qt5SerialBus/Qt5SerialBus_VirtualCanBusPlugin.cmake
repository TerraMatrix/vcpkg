
add_library(Qt5::VirtualCanBusPlugin MODULE IMPORTED)


if(EXISTS "${_qt5SerialBus_install_prefix}/plugins/canbus/libqtvirtualcanbus.so")
    _populate_SerialBus_plugin_properties(VirtualCanBusPlugin RELEASE "canbus/libqtvirtualcanbus.so" FALSE)
endif()
if(EXISTS "${_qt5SerialBus_install_prefix}/debug/plugins/canbus/libqtvirtualcanbus.so")
    _populate_SerialBus_plugin_properties(VirtualCanBusPlugin DEBUG "canbus/libqtvirtualcanbus.so" FALSE)
endif()

list(APPEND Qt5SerialBus_PLUGINS Qt5::VirtualCanBusPlugin)
set_property(TARGET Qt5::SerialBus APPEND PROPERTY QT_ALL_PLUGINS_canbus Qt5::VirtualCanBusPlugin)
set_property(TARGET Qt5::VirtualCanBusPlugin PROPERTY QT_PLUGIN_TYPE "canbus")
set_property(TARGET Qt5::VirtualCanBusPlugin PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::VirtualCanBusPlugin PROPERTY QT_PLUGIN_CLASS_NAME "VirtualCanBusPlugin")
