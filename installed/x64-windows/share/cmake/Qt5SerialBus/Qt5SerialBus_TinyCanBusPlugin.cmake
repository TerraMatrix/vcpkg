
add_library(Qt5::TinyCanBusPlugin MODULE IMPORTED)


if(EXISTS "${_qt5SerialBus_install_prefix}/plugins/canbus/qttinycanbus.dll")
    _populate_SerialBus_plugin_properties(TinyCanBusPlugin RELEASE "canbus/qttinycanbus.dll" FALSE)
endif()
if(EXISTS "${_qt5SerialBus_install_prefix}/debug/plugins/canbus/qttinycanbusd.dll")
    _populate_SerialBus_plugin_properties(TinyCanBusPlugin DEBUG "canbus/qttinycanbusd.dll" FALSE)
endif()

list(APPEND Qt5SerialBus_PLUGINS Qt5::TinyCanBusPlugin)
set_property(TARGET Qt5::SerialBus APPEND PROPERTY QT_ALL_PLUGINS_canbus Qt5::TinyCanBusPlugin)
set_property(TARGET Qt5::TinyCanBusPlugin PROPERTY QT_PLUGIN_TYPE "canbus")
set_property(TARGET Qt5::TinyCanBusPlugin PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::TinyCanBusPlugin PROPERTY QT_PLUGIN_CLASS_NAME "TinyCanBusPlugin")
