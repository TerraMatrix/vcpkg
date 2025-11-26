vcpkg_minimum_required(VERSION 2023-02-16)

vcpkg_check_linkage(ONLY_DYNAMIC_LIBRARY)

# Find required programs
vcpkg_find_acquire_program(FLEX)
vcpkg_find_acquire_program(BISON)

# Python setup for different platforms
if(VCPKG_TARGET_IS_WINDOWS)
    vcpkg_find_acquire_program(PYTHON3)
    get_filename_component(PYTHON3_PATH ${PYTHON3} DIRECTORY)
    vcpkg_add_to_path("${PYTHON3_PATH}")
    vcpkg_add_to_path("${PYTHON3_PATH}/Scripts")
    set(PYTHON_EXECUTABLE ${PYTHON3})
else()
    # On Linux, use system Python or find it in PATH
    find_program(PYTHON3 NAMES python3 python)
    if(NOT PYTHON3)
        message(FATAL_ERROR "Python3 not found on system")
    endif()
    set(PYTHON_EXECUTABLE ${PYTHON3})
endif()

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO qgis/QGIS
    REF final-3_44_5
    SHA512 c29a6b6b466a848c4acd62ac9b55d4e42a2cdd3772d1715f3ae3f36cc2df901b0760e82a12c42fa25851606fe91626cb63914982031f5b05d29b88f46068797a
    HEAD_REF master
    PATCHES
        qscintilla_path_fix.patch

)

# Set up Python executable
if(VCPKG_TARGET_IS_WINDOWS)
    get_filename_component(PYTHON3_PATH ${PYTHON3} DIRECTORY)
    vcpkg_add_to_path("${PYTHON3_PATH}")
    vcpkg_add_to_path("${PYTHON3_PATH}/Scripts")
    set(PYTHON_EXECUTABLE ${PYTHON3})
else()
    set(PYTHON_EXECUTABLE ${PYTHON3})
endif()

# Core QGIS options
list(APPEND QGIS_OPTIONS
    -DENABLE_TESTS:BOOL=OFF
    -DWITH_QTWEBKIT:BOOL=OFF
    -DWITH_GRASS7:BOOL=OFF
    -DWITH_QSPATIALITE:BOOL=ON
    -DWITH_CUSTOM_WIDGETS:BOOL=ON
    -DSERVER_SKIP_ECW:BOOL=ON
    -DWITH_INTERNAL_POLY2TRI:BOOL=OFF
    -DWITH_STDLIB:BOOL=ON
    -DWITH_QWT:BOOL=ON
    -DWITH_QSCI:BOOL=ON
    -DWITH_QCA:BOOL=ON
)

# Add required programs
list(APPEND QGIS_OPTIONS
    -DPython_EXECUTABLE:FILEPATH=${PYTHON_EXECUTABLE}
    -DBISON_EXECUTABLE="${BISON}"
    -DFLEX_EXECUTABLE="${FLEX}"
)

# Feature-based options
if("server" IN_LIST FEATURES)
    list(APPEND QGIS_OPTIONS -DWITH_SERVER:BOOL=ON)
    if("bindings" IN_LIST FEATURES)
        list(APPEND QGIS_OPTIONS -DWITH_SERVER_PLUGINS:BOOL=ON)
    endif()
else()
    list(APPEND QGIS_OPTIONS -DWITH_SERVER:BOOL=OFF)
endif()

if("3d" IN_LIST FEATURES)
    list(APPEND QGIS_OPTIONS -DWITH_3D:BOOL=ON)
else()
    list(APPEND QGIS_OPTIONS -DWITH_3D:BOOL=OFF)
endif()

if("opencl" IN_LIST FEATURES)
    list(APPEND QGIS_OPTIONS -DWITH_OPENCL:BOOL=ON)
else()
    list(APPEND QGIS_OPTIONS -DWITH_OPENCL:BOOL=OFF)
endif()

if("quick" IN_LIST FEATURES)
    list(APPEND QGIS_OPTIONS -DWITH_QUICK:BOOL=ON)
else()
    list(APPEND QGIS_OPTIONS -DWITH_QUICK:BOOL=OFF)
endif()

# Debug tools configuration
if("debug-tools" IN_LIST FEATURES)
    # QGIS debug tools are typically built with the main application
    # This feature can be used to control additional debug information
    list(APPEND QGIS_OPTIONS -DCMAKE_BUILD_TYPE:STRING=Debug)
else()
    # For non-debug builds, use Release with debug info
    list(APPEND QGIS_OPTIONS -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo)
endif()

# Python bindings
if("bindings" IN_LIST FEATURES)
    list(APPEND QGIS_OPTIONS -DWITH_BINDINGS:BOOL=ON)
    list(APPEND QGIS_OPTIONS -DBINDINGS_GLOBAL_INSTALL:BOOL=OFF)
else()
    list(APPEND QGIS_OPTIONS -DWITH_BINDINGS:BOOL=OFF)
endif()

# GUI components (default)
if("gui" IN_LIST FEATURES)
    list(APPEND QGIS_OPTIONS -DWITH_GUI:BOOL=ON)
    # Force linking of GUI-related libraries
    list(APPEND QGIS_OPTIONS -DQWT_FOUND:BOOL=ON)
    list(APPEND QGIS_OPTIONS -DQSCINTILLA_FOUND:BOOL=ON)
    list(APPEND QGIS_OPTIONS -DQCA_FOUND:BOOL=ON)
    list(APPEND QGIS_OPTIONS -DQWT_INCLUDE_DIR:STRING=${CURRENT_INSTALLED_DIR}/include/qwt)
    list(APPEND QGIS_OPTIONS -DQSCINTILLA_INCLUDE_DIR:STRING=${CURRENT_INSTALLED_DIR}/include/Qsci)
    list(APPEND QGIS_OPTIONS -DQCA_INCLUDE_DIR:STRING=${CURRENT_INSTALLED_DIR}/include/QtCrypto)
    # Set Qt5 version explicitly for bindings
    list(APPEND QGIS_OPTIONS -DQT5_QSCINTILLA_INCLUDE_DIR:STRING=${CURRENT_INSTALLED_DIR}/include/Qsci)
    list(APPEND QGIS_OPTIONS -DQT5_QSCINTILLA_LIBRARY:FILEPATH=${CURRENT_INSTALLED_DIR}/lib/qscintilla2_qt5${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
else()
    list(APPEND QGIS_OPTIONS -DWITH_GUI:BOOL=OFF)
endif()

# Platform-specific configurations
if(VCPKG_TARGET_IS_WINDOWS)
    # Windows-specific options
    list(APPEND QGIS_OPTIONS -DWITH_STDLIB:BOOL=ON)

    # Configure Qt tools
    if(EXISTS "${CURRENT_INSTALLED_DIR}/tools/qt6-tools/bin/lrelease.exe")
        list(APPEND QGIS_OPTIONS -DQT_LRELEASE_EXECUTABLE:FILEPATH=${CURRENT_INSTALLED_DIR}/tools/qt6-tools/bin/lrelease.exe)
    else()
        list(APPEND QGIS_OPTIONS -DQT_LRELEASE_EXECUTABLE:FILEPATH=${CURRENT_INSTALLED_DIR}/tools/qt5-tools/bin/lrelease.exe)
    endif()

    # Configure Python UI tools
    if(EXISTS "${PYTHON3_PATH}/Scripts/pyuic6.exe")
        list(APPEND QGIS_OPTIONS -DPYUIC_PROGRAM:FILEPATH=${PYTHON3_PATH}/Scripts/pyuic6.exe)
        list(APPEND QGIS_OPTIONS -DPYRCC_PROGRAM:FILEPATH=${PYTHON3_PATH}/Scripts/pyrcc6.exe)
    elseif(EXISTS "${PYTHON3_PATH}/Scripts/pyuic5.exe")
        list(APPEND QGIS_OPTIONS -DPYUIC_PROGRAM:FILEPATH=${PYTHON3_PATH}/Scripts/pyuic5.exe)
        list(APPEND QGIS_OPTIONS -DPYRCC_PROGRAM:FILEPATH=${PYTHON3_PATH}/Scripts/pyrcc5.exe)
    endif()

    # Add static library exclusion for debug builds and fix runtime library issues
    list(APPEND QGIS_OPTIONS_DEBUG -DQt5_EXCLUDE_STATIC_DEPENDENCIES:BOOL=ON)
    list(APPEND QGIS_OPTIONS_DEBUG -DQt6_EXCLUDE_STATIC_DEPENDENCIES:BOOL=ON)
    list(APPEND QGIS_OPTIONS_DEBUG -DCMAKE_DEBUG_POSTFIX:STRING=d)
    list(APPEND QGIS_OPTIONS_DEBUG -D_ITERATOR_DEBUG_LEVEL:STRING=2)
    list(APPEND QGIS_OPTIONS_RELEASE -D_ITERATOR_DEBUG_LEVEL:STRING=0)

    # Fix Python runtime library configuration
    list(APPEND QGIS_OPTIONS_DEBUG -DCMAKE_CXX_FLAGS_DEBUG:STRING="/MDd /Zi /Od /Ob0 /D _DEBUG /D_ITERATOR_DEBUG_LEVEL=2")
    list(APPEND QGIS_OPTIONS_DEBUG -DCMAKE_C_FLAGS_DEBUG:STRING="/MDd /Zi /Od /Ob0 /D _DEBUG /D_ITERATOR_DEBUG_LEVEL=2")
    list(APPEND QGIS_OPTIONS_RELEASE -DCMAKE_CXX_FLAGS_RELEASE:STRING="/MD /O2 /DNDEBUG /D_ITERATOR_DEBUG_LEVEL=0")
    list(APPEND QGIS_OPTIONS_RELEASE -DCMAKE_C_FLAGS_RELEASE:STRING="/MD /O2 /DNDEBUG /D_ITERATOR_DEBUG_LEVEL=0")

elseif(VCPKG_TARGET_IS_LINUX)
    # Linux-specific options
    list(APPEND QGIS_OPTIONS -DWITH_STDLIB:BOOL=OFF)

    # Configure Qt tools for Linux
    if(EXISTS "${CURRENT_INSTALLED_DIR}/tools/qt6-tools/bin/lrelease")
        list(APPEND QGIS_OPTIONS -DQT_LRELEASE_EXECUTABLE:FILEPATH=${CURRENT_INSTALLED_DIR}/tools/qt6-tools/bin/lrelease)
    else()
        # Try to find lrelease in PATH
        find_program(QT_LRELEASE_EXECUTABLE lrelease6 lrelease)
        if(QT_LRELEASE_EXECUTABLE)
            list(APPEND QGIS_OPTIONS -DQT_LRELEASE_EXECUTABLE:FILEPATH=${QT_LRELEASE_EXECUTABLE})
        endif()
    endif()

    # Configure Python UI tools for Linux
    find_program(PYUIC_EXECUTABLE pyuic6 pyuic5)
    if(PYUIC_EXECUTABLE)
        list(APPEND QGIS_OPTIONS -DPYUIC_PROGRAM:FILEPATH=${PYUIC_EXECUTABLE})
    endif()

    find_program(PYRCC_EXECUTABLE pyrcc6 pyrcc5)
    if(PYRCC_EXECUTABLE)
        list(APPEND QGIS_OPTIONS -DPYRCC_PROGRAM:FILEPATH=${PYRCC_EXECUTABLE})
    endif()
endif()

# Platform-specific library configuration
if(VCPKG_TARGET_IS_WINDOWS)
    # Library paths for Windows
    macro(FIND_LIB_OPTIONS basename relname debname suffix libsuffix)
        file(TO_NATIVE_PATH "${CURRENT_INSTALLED_DIR}/lib/${VCPKG_TARGET_STATIC_LIBRARY_PREFIX}${relname}${libsuffix}" ${basename}_LIBRARY_RELEASE)
        file(TO_NATIVE_PATH "${CURRENT_INSTALLED_DIR}/debug/lib/${VCPKG_TARGET_STATIC_LIBRARY_PREFIX}${debname}${libsuffix}" ${basename}_LIBRARY_DEBUG)
        if(${basename}_LIBRARY_DEBUG AND ${basename}_LIBRARY_RELEASE AND NOT ${basename}_LIBRARY_DEBUG STREQUAL ${basename}_LIBRARY_RELEASE)
            list(APPEND QGIS_OPTIONS_RELEASE -D${basename}_${suffix}:FILEPATH=${${basename}_LIBRARY_RELEASE})
            list(APPEND QGIS_OPTIONS_DEBUG -D${basename}_${suffix}:FILEPATH=${${basename}_LIBRARY_DEBUG})
        elseif(${basename}_LIBRARY_RELEASE)
            list(APPEND QGIS_OPTIONS -D${basename}_${suffix}:FILEPATH=${${basename}_LIBRARY_RELEASE})
        elseif(${basename}_LIBRARY_DEBUG)
            list(APPEND QGIS_OPTIONS -D${basename}_${suffix}:FILEPATH=${${basename}_LIBRARY_DEBUG})
        endif()
    endmacro()

    message(STATUS "Spatial index library configuration for architecture: ${VCPKG_TARGET_ARCHITECTURE}")
    message(STATUS "Available spatialindex libraries in debug: ${_VCPKG_INSTALLED_DIR}/${TARGET_TRIPLET}/debug/lib")
    message(STATUS "Available spatialindex libraries in release: ${_VCPKG_INSTALLED_DIR}/${TARGET_TRIPLET}/lib")

    # Configure library paths
    set(SPATIALINDEX_LIB_NAME spatialindex)
    if(VCPKG_TARGET_ARCHITECTURE STREQUAL "x64" OR VCPKG_TARGET_ARCHITECTURE STREQUAL "arm64")
        set(SPATIALINDEX_LIB_NAME "spatialindex-64")
    elseif()
        set(SPATIALINDEX_LIB_NAME "spatialindex-32")
    endif()

    FIND_LIB_OPTIONS(SPATIALINDEX ${SPATIALINDEX_LIB_NAME} ${SPATIALINDEX_LIB_NAME} LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(GDAL gdal gdal LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(GEOS geos_c geos_c LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(GSL gsl gsld LIB ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(GSLCBLAS gslcblas gslcblasd LIB ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(POSTGRES libpq libpq LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(PROJ proj proj_d LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(QCA qca qcad LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(QWT qwt qwtd LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(QSCINTILLA qscintilla2_qt6 qscintilla2_qt6d LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})

    # Additional library configuration to ensure proper linking
    list(APPEND QGIS_OPTIONS_DEBUG -DQWT_LIBRARY:FILEPATH=${CURRENT_INSTALLED_DIR}/debug/lib/qwtd${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    list(APPEND QGIS_OPTIONS_DEBUG -DQCA_LIBRARY:FILEPATH=${CURRENT_INSTALLED_DIR}/debug/lib/qcad${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    list(APPEND QGIS_OPTIONS_DEBUG -DQSCINTILLA_LIBRARY:FILEPATH=${CURRENT_INSTALLED_DIR}/debug/lib/qscintilla2_qt6d${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    list(APPEND QGIS_OPTIONS_RELEASE -DQWT_LIBRARY:FILEPATH=${CURRENT_INSTALLED_DIR}/lib/qwt${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    list(APPEND QGIS_OPTIONS_RELEASE -DQCA_LIBRARY:FILEPATH=${CURRENT_INSTALLED_DIR}/lib/qca${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    list(APPEND QGIS_OPTIONS_RELEASE -DQSCINTILLA_LIBRARY:FILEPATH=${CURRENT_INSTALLED_DIR}/lib/qscintilla2_qt6${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})

    list(APPEND QGIS_OPTIONS -DPoly2Tri_INCLUDE_DIR="${CURRENT_INSTALLED_DIR}/include/poly2tri")
    list(APPEND QGIS_OPTIONS -DPROJ_INCLUDE_DIR="${CURRENT_INSTALLED_DIR}/include")

    if("server" IN_LIST FEATURES)
        FIND_LIB_OPTIONS(FCGI fcgi fcgi LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
        list(APPEND QGIS_OPTIONS -DFCGI_INCLUDE_DIR="${CURRENT_INSTALLED_DIR}/include/fastcgi")
    endif()

    if("pdal" IN_LIST FEATURES)
        if(VCPKG_TARGET_IS_WINDOWS)
            set(PDAL_CPP_LIBRARY_DEBUG "${CURRENT_INSTALLED_DIR}/debug/lib/pdalcpp.lib$$<SEMICOLON>ws2_32.lib")
            set(PDAL_CPP_LIBRARY_RELEASE "${CURRENT_INSTALLED_DIR}/lib/pdalcpp.lib$$<SEMICOLON>ws2_32.lib")
            list(APPEND QGIS_OPTIONS_DEBUG -DPDAL_CPP_LIBRARY=${PDAL_CPP_LIBRARY_DEBUG})
            list(APPEND QGIS_OPTIONS_RELEASE -DPDAL_CPP_LIBRARY=${PDAL_CPP_LIBRARY_RELEASE})
        endif()

        # Enable PDAL support in QGIS
        list(APPEND QGIS_OPTIONS -DWITH_PDAL:BOOL=ON)
    else()
        # Explicitly disable PDAL if feature is not requested
        list(APPEND QGIS_OPTIONS -DWITH_PDAL:BOOL=OFF)
    endif()

elseif(VCPKG_TARGET_IS_LINUX)
    # Linux-specific library configuration (using pkg-config and find_package)
    list(APPEND QGIS_OPTIONS
        -DPoly2Tri_INCLUDE_DIR="${CURRENT_INSTALLED_DIR}/include/poly2tri"
        -DPROJ_INCLUDE_DIR="${CURRENT_INSTALLED_DIR}/include"
    )

    # Configure paths for Linux (ARM64)
    if(VCPKG_TARGET_ARCHITECTURE STREQUAL "arm64")
        set(SPATIALINDEX_LIB_NAME "spatialindex-64")
    else()
        set(SPATIALINDEX_LIB_NAME "spatialindex")
    endif()

    # PDAL configuration for Linux
    if("pdal" IN_LIST FEATURES)
        list(APPEND QGIS_OPTIONS -DWITH_PDAL:BOOL=ON)
    else()
        list(APPEND QGIS_OPTIONS -DWITH_PDAL:BOOL=OFF)
    endif()

    # Use find_package for most libraries on Linux
    # These will be found automatically by QGIS CMake scripts
endif()

if(VCPKG_TARGET_IS_WINDOWS)
    vcpkg_cmake_configure(
        SOURCE_PATH ${SOURCE_PATH}
        WINDOWS_USE_MSBUILD
        OPTIONS ${QGIS_OPTIONS}
        OPTIONS_DEBUG ${QGIS_OPTIONS_DEBUG}
        OPTIONS_RELEASE ${QGIS_OPTIONS_RELEASE}
        MAYBE_UNUSED_VARIABLES "GSLCBLAS_LIB;GSL_LIB;PDAL_CPP_LIBRARY;PROJ_INCLUDE_DIR;PROJ_LIBRARY;PYRCC_PROGRAM;PYUIC_PROGRAM;Poly2Tri_INCLUDE_DIR;Qt6_EXCLUDE_STATIC_DEPENDENCIES;WITH_OPENCL"
    )
else()
    vcpkg_cmake_configure(
        SOURCE_PATH ${SOURCE_PATH}
        OPTIONS ${QGIS_OPTIONS}
        OPTIONS_DEBUG ${QGIS_OPTIONS_DEBUG}
        OPTIONS_RELEASE ${QGIS_OPTIONS_RELEASE}
    )
endif()

vcpkg_cmake_install()
vcpkg_copy_pdbs()
vcpkg_fixup_pkgconfig()

# Copy tools and resources
function(copy_path basepath)
    file(GLOB ${basepath}_PATH ${CURRENT_PACKAGES_DIR}/${basepath}/*)
    if(${basepath}_PATH)
        file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/tools/${PORT}/${basepath})
        file(COPY ${${basepath}_PATH} DESTINATION ${CURRENT_PACKAGES_DIR}/tools/${PORT}/${basepath})
    endif()

    if(EXISTS "${CURRENT_PACKAGES_DIR}/${basepath}/")
        file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/${basepath}/)
    endif()
endfunction()

# Copy important paths
copy_path(doc)
copy_path(i18n)
copy_path(icons)
copy_path(images)
copy_path(plugins)
copy_path(python)
copy_path(resources)
copy_path(svg)

# Handle executables
file(GLOB QGIS_TOOL_PATH ${CURRENT_PACKAGES_DIR}/bin/*${VCPKG_TARGET_EXECUTABLE_SUFFIX} ${CURRENT_PACKAGES_DIR}/*${VCPKG_TARGET_EXECUTABLE_SUFFIX})
if(QGIS_TOOL_PATH)
    file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/tools/${PORT}/bin)
    file(COPY ${QGIS_TOOL_PATH} DESTINATION ${CURRENT_PACKAGES_DIR}/tools/${PORT}/bin)
    file(REMOVE_RECURSE ${QGIS_TOOL_PATH})
    file(GLOB QGIS_TOOL_PATH ${CURRENT_PACKAGES_DIR}/bin/*)
    file(COPY ${QGIS_TOOL_PATH} DESTINATION ${CURRENT_PACKAGES_DIR}/tools/${PORT}/bin)
endif()

# Handle cmake files
file(GLOB QGIS_CMAKE_PATH ${CURRENT_PACKAGES_DIR}/*.cmake)
if(QGIS_CMAKE_PATH)
    file(COPY ${QGIS_CMAKE_PATH} DESTINATION ${CURRENT_PACKAGES_DIR}/share/cmake/${PORT})
    file(REMOVE_RECURSE ${QGIS_CMAKE_PATH})
endif()

# Remove debug includes
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Copy header files to include directory
file(GLOB INCLUDE_FILES "${CURRENT_PACKAGES_DIR}/include/*.h")
if(INCLUDE_FILES)
    file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/include/${PORT}")
    file(COPY ${INCLUDE_FILES} DESTINATION "${CURRENT_PACKAGES_DIR}/include/${PORT}")
    file(REMOVE_RECURSE ${INCLUDE_FILES})
endif()

# Handle copyright
file(INSTALL ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)