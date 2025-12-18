
add_library(Qt5::QXdgDesktopPortalThemePlugin MODULE IMPORTED)


if(EXISTS "${_qt5Gui_install_prefix}/plugins/platformthemes/libqxdgdesktopportal.so")
    _populate_Gui_plugin_properties(QXdgDesktopPortalThemePlugin RELEASE "platformthemes/libqxdgdesktopportal.so" FALSE)
endif()
if(EXISTS "${_qt5Gui_install_prefix}/debug/plugins/platformthemes/libqxdgdesktopportal.so")
    _populate_Gui_plugin_properties(QXdgDesktopPortalThemePlugin DEBUG "platformthemes/libqxdgdesktopportal.so" FALSE)
endif()

list(APPEND Qt5Gui_PLUGINS Qt5::QXdgDesktopPortalThemePlugin)
set_property(TARGET Qt5::Gui APPEND PROPERTY QT_ALL_PLUGINS_platformthemes Qt5::QXdgDesktopPortalThemePlugin)
set_property(TARGET Qt5::QXdgDesktopPortalThemePlugin PROPERTY QT_PLUGIN_TYPE "platformthemes")
set_property(TARGET Qt5::QXdgDesktopPortalThemePlugin PROPERTY QT_PLUGIN_EXTENDS "-")
set_property(TARGET Qt5::QXdgDesktopPortalThemePlugin PROPERTY QT_PLUGIN_CLASS_NAME "QXdgDesktopPortalThemePlugin")
