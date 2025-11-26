set(QGIS_FOUND TRUE)

# Define the QGIS targets
add_library(Qgis::core SHARED IMPORTED)
add_library(Qgis::gui SHARED IMPORTED)
add_library(Qgis::analysis SHARED IMPORTED)

# Set the location of the libraries
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    set_target_properties(Qgis::core PROPERTIES
        IMPORTED_LOCATION "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/lib/qgis_cored.dll"
        IMPORTED_IMPLIB "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/lib/qgis_cored.lib"
        INTERFACE_INCLUDE_DIRECTORIES "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/include"
    )
    set_target_properties(Qgis::gui PROPERTIES
        IMPORTED_LOCATION "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/lib/qgis_guid.dll"
        IMPORTED_IMPLIB "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/lib/qgis_guid.lib"
        INTERFACE_INCLUDE_DIRECTORIES "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/include"
    )
    set_target_properties(Qgis::analysis PROPERTIES
        IMPORTED_LOCATION "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/lib/qgis_analysisd.dll"
        IMPORTED_IMPLIB "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/lib/qgis_analysisd.lib"
        INTERFACE_INCLUDE_DIRECTORIES "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/include"
    )
else()
    set_target_properties(Qgis::core PROPERTIES
        IMPORTED_LOCATION "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/lib/qgis_core.dll"
        IMPORTED_IMPLIB "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/lib/qgis_core.lib"
        INTERFACE_INCLUDE_DIRECTORIES "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/include"
    )
    set_target_properties(Qgis::gui PROPERTIES
        IMPORTED_LOCATION "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/lib/qgis_gui.dll"
        IMPORTED_IMPLIB "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/lib/qgis_gui.lib"
        INTERFACE_INCLUDE_DIRECTORIES "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/include"
    )
    set_target_properties(Qgis::analysis PROPERTIES
        IMPORTED_LOCATION "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/lib/qgis_analysis.dll"
        IMPORTED_IMPLIB "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/lib/qgis_analysis.lib"
        INTERFACE_INCLUDE_DIRECTORIES "${_VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/include"
    )
endif()

# Link dependencies
target_link_libraries(Qgis::core INTERFACE
    Qt6::Core
    Qt6::Xml
    Qt6::Network
    Qt6::Sql
    Qt6::Concurrent
    Qt6::Core5Compat
    GEOS::geos
    GDAL::GDAL
    PROJ::proj
    spatialindex::spatialindex
    expat::expat
    libzip::zip
    protobuf::libprotobuf
    nlohmann_json::nlohmann_json
    exiv2::exiv2
    QCA::QCA
    qt6-keychain::qt6-keychain
    GSL::gsl
    draco::draco
    meshoptimizer::meshoptimizer
    duckdb::duckdb
)

target_link_libraries(Qgis::gui INTERFACE
    Qgis::core
    Qt6::Widgets
    Qt6::Gui
    Qt6::Svg
    Qt6::PrintSupport
    QScintilla::QScintilla
    qwt::qwt
)

target_link_libraries(Qgis::analysis INTERFACE
    Qgis::core
    Qt6::Core
    Qt6::Gui
)