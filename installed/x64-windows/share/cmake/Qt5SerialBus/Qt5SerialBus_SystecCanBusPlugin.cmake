
add_library(Qt5::SystecCanBusPlugin MODULE IMPORTED)


if(EXISTS "${_qt5SerialBus_install_prefix}/plugins/canbus/qtsysteccanbus.dll")
    _populate_SerialBus_plugin_properties(SystecCanBusPlugin RELEASE "canbus/qtsysteccanbus.dll" FALSE)
endif()
if(EXISTS "${_qt5SerialBus_install_prefix}/debug/plugins/canbus/qtsysteccanbusd.dll")
    _populate_SerialBus_plugin_properties(SystecCanBusPlugin DEBUG "canbus/qtsysteccanbusd.dll" FALSE)
endif()

list(APPEND Qt5SerialBus_PLUGINS Qt5::SystecCanBusPlugin)
set_property(TARGET Qt5::SerialBus APPEND PROPERTY QT_ALL_PLUGINS_canbus Qt5::SystecCanBusPlugin)
set_property(TARGET Qt5::SystecCanBusPlugin PROPERTY QT_PLUGIN_TYPE "canbus")
set_property(TARGET Qt5::SystecCanBusPlugin PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::SystecCanBusPlugin PROPERTY QT_PLUGIN_CLASS_NAME "SystecCanBusPlugin")
