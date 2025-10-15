
add_library(Qt5::VectorCanBusPlugin MODULE IMPORTED)


if(EXISTS "${_qt5SerialBus_install_prefix}/plugins/canbus/qtvectorcanbus.dll")
    _populate_SerialBus_plugin_properties(VectorCanBusPlugin RELEASE "canbus/qtvectorcanbus.dll" FALSE)
endif()
if(EXISTS "${_qt5SerialBus_install_prefix}/debug/plugins/canbus/qtvectorcanbusd.dll")
    _populate_SerialBus_plugin_properties(VectorCanBusPlugin DEBUG "canbus/qtvectorcanbusd.dll" FALSE)
endif()

list(APPEND Qt5SerialBus_PLUGINS Qt5::VectorCanBusPlugin)
set_property(TARGET Qt5::SerialBus APPEND PROPERTY QT_ALL_PLUGINS_canbus Qt5::VectorCanBusPlugin)
set_property(TARGET Qt5::VectorCanBusPlugin PROPERTY QT_PLUGIN_TYPE "canbus")
set_property(TARGET Qt5::VectorCanBusPlugin PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::VectorCanBusPlugin PROPERTY QT_PLUGIN_CLASS_NAME "VectorCanBusPlugin")
