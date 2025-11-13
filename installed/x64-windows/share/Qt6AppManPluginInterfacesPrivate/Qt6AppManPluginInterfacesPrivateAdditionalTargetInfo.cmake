# Additional target information for Qt6AppManPluginInterfacesPrivate
if(NOT DEFINED QT_DEFAULT_IMPORT_CONFIGURATION)
    set(QT_DEFAULT_IMPORT_CONFIGURATION RELEASE)
endif()
__qt_internal_promote_target_to_global_checked(Qt6::AppManPluginInterfacesPrivate)
get_target_property(_qt_imported_location Qt6::AppManPluginInterfacesPrivate IMPORTED_LOCATION_RELEASE)
get_target_property(_qt_imported_location_default Qt6::AppManPluginInterfacesPrivate IMPORTED_LOCATION_${QT_DEFAULT_IMPORT_CONFIGURATION})

# Import target "Qt6::AppManPluginInterfacesPrivate" for configuration "RelWithDebInfo"
set_property(TARGET Qt6::AppManPluginInterfacesPrivate APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)

if(_qt_imported_location)
    set_property(TARGET Qt6::AppManPluginInterfacesPrivate PROPERTY IMPORTED_LOCATION_RELWITHDEBINFO "${_qt_imported_location}")
endif()

# Import target "Qt6::AppManPluginInterfacesPrivate" for configuration "MinSizeRel"
set_property(TARGET Qt6::AppManPluginInterfacesPrivate APPEND PROPERTY IMPORTED_CONFIGURATIONS MINSIZEREL)

if(_qt_imported_location)
    set_property(TARGET Qt6::AppManPluginInterfacesPrivate PROPERTY IMPORTED_LOCATION_MINSIZEREL "${_qt_imported_location}")
endif()

# Default configuration
if(_qt_imported_location_default)
    set_property(TARGET Qt6::AppManPluginInterfacesPrivate PROPERTY IMPORTED_LOCATION "${_qt_imported_location_default}")
endif()

unset(_qt_imported_location)
unset(_qt_imported_location_default)
unset(_qt_imported_soname)
unset(_qt_imported_soname_default)
unset(_qt_imported_link_dependencies)
unset(_qt_imported_link_dependencies_default)
unset(_qt_imported_objects)
unset(_qt_imported_objects_default)
unset(_qt_imported_clr)
unset(_qt_imported_clr_default)
unset(_qt_imported_configs)