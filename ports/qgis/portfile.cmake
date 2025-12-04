# QGIS 3.44.5 portfile.cmake

# Detect Qt and QScintilla versions for Python wheels pinning
set(QT_QCONFIG_HEADER "")
if(EXISTS "${CURRENT_INSTALLED_DIR}/include/qt6/QtCore/qconfig.h")
  set(QT_QCONFIG_HEADER "${CURRENT_INSTALLED_DIR}/include/qt6/QtCore/qconfig.h")
elseif(EXISTS "${CURRENT_INSTALLED_DIR}/include/qt5/QtCore/qconfig.h")
  set(QT_QCONFIG_HEADER "${CURRENT_INSTALLED_DIR}/include/qt5/QtCore/qconfig.h")
endif()
if(QT_QCONFIG_HEADER)
  file(READ "${QT_QCONFIG_HEADER}" QCONFIG_CONTENTS)
  if(QCONFIG_CONTENTS)
    string(REGEX REPLACE ".*QT_VERSION_STR +\"([^\"]+)\".*" "\\1" QT_VERSION "${QCONFIG_CONTENTS}")
    message(STATUS "QT_VERSION = ${QT_VERSION}")
  endif()
endif()

if(EXISTS "${CURRENT_INSTALLED_DIR}/include/Qsci/qsciglobal.h")
  file(READ "${CURRENT_INSTALLED_DIR}/include/Qsci/qsciglobal.h" QSCIGLOBAL_CONTENTS)
  if(QSCIGLOBAL_CONTENTS)
    string(REGEX REPLACE ".*QSCINTILLA_VERSION_STR +\"([^\"]+)\".*" "\\1" QSCINTILLA_VERSION "${QSCIGLOBAL_CONTENTS}")
    message(STATUS "QSCINTILLA_VERSION = ${QSCINTILLA_VERSION}")
  endif()
endif()

# Acquire tools
vcpkg_find_acquire_program(FLEX)
vcpkg_find_acquire_program(BISON)
if(VCPKG_TARGET_IS_WINDOWS)
  vcpkg_find_acquire_program(PYTHON3)
else()
  set(PYTHON3 ${CURRENT_INSTALLED_DIR}/tools/python3/python3)
endif()
get_filename_component(PYTHON3_PATH ${PYTHON3} DIRECTORY)
message(STATUS "PYTHON3 = ${PYTHON3_PATH}")
vcpkg_add_to_path("${PYTHON3_PATH}")
if(VCPKG_TARGET_IS_WINDOWS)
  vcpkg_add_to_path("${PYTHON3_PATH}/Scripts")
else()
  vcpkg_add_to_path("${CURRENT_INSTALLED_DIR}/bin")
  vcpkg_add_to_path("${CURRENT_INSTALLED_DIR}/tools/qt6/bin")
  vcpkg_add_to_path("${CURRENT_INSTALLED_DIR}/tools/gdal")
  vcpkg_add_to_path("${CURRENT_INSTALLED_DIR}/tools/libpq/bin")
endif()
set(PYTHON_EXECUTABLE ${PYTHON3})

# Derive python major/minor for non-Windows paths
execute_process(
  COMMAND "${PYTHON_EXECUTABLE}" -c "import sys;print(str(sys.version_info[0])+'.'+str(sys.version_info[1]))"
  OUTPUT_VARIABLE PYTHON_VERSION_MM
  OUTPUT_STRIP_TRAILING_WHITESPACE
)
if(PYTHON_VERSION_MM MATCHES "^([0-9]+)\.([0-9]+)$")
  string(REGEX REPLACE "^([0-9]+)\..*$" "\\1" PYTHON_VERSION_MAJOR "${PYTHON_VERSION_MM}")
  string(REGEX REPLACE "^[0-9]+\.([0-9]+)$" "\\1" PYTHON_VERSION_MINOR "${PYTHON_VERSION_MM}")
endif()

# Fetch QGIS source
vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO qgis/QGIS
  REF final-3_44_5
  SHA512 c29a6b6b466a848c4acd62ac9b55d4e42a2cdd3772d1715f3ae3f36cc2df901b0760e82a12c42fa25851606fe91626cb63914982031f5b05d29b88f46068797a
  HEAD_REF master
  PATCHES
    fix-build-failed.diff
    qgspython.patch
)

# Base CMake options
list(APPEND QGIS_OPTIONS -DENABLE_TESTS:BOOL=OFF)
list(APPEND QGIS_OPTIONS -DWITH_QTWEBKIT:BOOL=OFF)
list(APPEND QGIS_OPTIONS -DBUILD_WITH_QT6:BOOL=ON)
list(APPEND QGIS_OPTIONS -DWITH_QSPATIALITE:BOOL=ON)
list(APPEND QGIS_OPTIONS -DWITH_CUSTOM_WIDGETS:BOOL=ON)
list(APPEND QGIS_OPTIONS -DSERVER_SKIP_ECW:BOOL=ON)
if(VCPKG_TARGET_IS_WINDOWS)
  # Fix MSVC C1128 (section count) for large translation units
  list(APPEND QGIS_OPTIONS_DEBUG "-DCMAKE_CXX_FLAGS_DEBUG=/bigobj")
  list(APPEND QGIS_OPTIONS_RELEASE "-DCMAKE_CXX_FLAGS_RELEASE=/bigobj")
endif()
list(APPEND QGIS_OPTIONS -DWITH_INTERNAL_POLY2TRI:BOOL=ON)

# Features mapping
if("server" IN_LIST FEATURES)
  list(APPEND QGIS_OPTIONS -DWITH_SERVER:BOOL=ON)
  if("bindings" IN_LIST FEATURES)
    list(APPEND QGIS_OPTIONS -DWITH_SERVER_PLUGINS:BOOL=ON)
  else()
    list(APPEND QGIS_OPTIONS -DWITH_SERVER_PLUGINS:BOOL=OFF)
  endif()
else()
  list(APPEND QGIS_OPTIONS -DWITH_SERVER:BOOL=OFF)
  list(APPEND QGIS_OPTIONS -DWITH_SERVER_PLUGINS:BOOL=OFF)
endif()

if("3d" IN_LIST FEATURES)
  list(APPEND QGIS_OPTIONS -DWITH_3D:BOOL=ON)
else()
  list(APPEND QGIS_OPTIONS -DWITH_3D:BOOL=OFF)
endif()

if("pdal" IN_LIST FEATURES)
  list(APPEND QGIS_OPTIONS -DWITH_PDAL:BOOL=ON)
  list(APPEND QGIS_OPTIONS -DWITH_EPT:BOOL=ON)
else()
  list(APPEND QGIS_OPTIONS -DWITH_PDAL:BOOL=OFF)
  list(APPEND QGIS_OPTIONS -DWITH_EPT:BOOL=OFF)
endif()

if("quick" IN_LIST FEATURES)
  list(APPEND QGIS_OPTIONS -DWITH_QUICK:BOOL=ON)
else()
  list(APPEND QGIS_OPTIONS -DWITH_QUICK:BOOL=OFF)
endif()

if("pip-mirrors" IN_LIST FEATURES)
  set(PIP_MIRRORS -i https://mirrors.aliyun.com/pypi/simple)
endif()

# Bindings
if("bindings" IN_LIST FEATURES)
  if(VCPKG_TARGET_IS_WINDOWS)
    # Ensure pip
    if(NOT EXISTS "${PYTHON3_PATH}/Scripts/pip.exe")
      message(STATUS "Install pip for Python Begin ...")
      vcpkg_download_distfile(
        GET_PIP_PATH
        URLS https://bootstrap.pypa.io/get-pip.py
        FILENAME get-pip.py
        SHA512 91e56cba31827911707bca5c036e602a2ef01e15cdce3b07b4dd102577bd6c44727dad81c65be8375ee33857d8f01633397656c4b4702b968c041aecccc29b12
      )
      vcpkg_execute_required_process(
        COMMAND "${PYTHON_EXECUTABLE}" "${GET_PIP_PATH}"
        WORKING_DIRECTORY ${PYTHON3_PATH}
        LOGNAME pip
      )
      vcpkg_execute_required_process(
        COMMAND "${PYTHON_EXECUTABLE}" -m pip install --upgrade pip ${PIP_MIRRORS}
        WORKING_DIRECTORY ${PYTHON3_PATH}
        LOGNAME pip
      )
      message(STATUS "Install pip for Python End")
    endif()

    # sip
    if(NOT EXISTS "${PYTHON3_PATH}/Scripts/sip-install.exe")
      message(STATUS "Install sip for Python Begin ...")
      vcpkg_execute_required_process(
        COMMAND "${PYTHON_EXECUTABLE}" -m pip install sip ${PIP_MIRRORS}
        WORKING_DIRECTORY ${PYTHON3_PATH}
        LOGNAME pip
      )
      message(STATUS "Install sip for Python End")
    endif()

    # PyQt6 family for build tools (no strict version pinning)
    if(NOT EXISTS "${PYTHON3_PATH}/Scripts/pyuic6.exe")
      message(STATUS "Install PyQt6 tooling for Python Begin ...")
      vcpkg_execute_required_process(
        COMMAND "${PYTHON_EXECUTABLE}" -m pip install PyQt6 PyQt6-sip PyQt6-Qt6 PyQt6-3D PyQt6-QScintilla PyQt-builder ${PIP_MIRRORS}
        WORKING_DIRECTORY ${PYTHON3_PATH}
        LOGNAME pip
      )
      message(STATUS "Install PyQt6 tooling for Python End")
    endif()

    # Install PyQt sip files into default SIP dir for QGIS build
    execute_process(COMMAND ${PYTHON_EXECUTABLE} "${SOURCE_PATH}/cmake/FindSIP.py" OUTPUT_VARIABLE sip_config)
    if(sip_config)
      string(REGEX REPLACE ".*\ndefault_sip_dir:([^\n]+).*$" "\\1" SIP_DEFAULT_SIP_DIR ${sip_config})
    endif()
    if(SIP_DEFAULT_SIP_DIR AND NOT EXISTS "${SIP_DEFAULT_SIP_DIR}/QtCore/QtCoremod.sip")
      message(STATUS "Install PyQt5 sip for Python Begin ...")
      file(GLOB PYQT6_SIP "${PYTHON3_PATH}/Lib/site-packages/PyQt6/bindings/*")
      file(COPY ${PYQT6_SIP} DESTINATION "${SIP_DEFAULT_SIP_DIR}")
      message(STATUS "Install PyQt5 sip for Python End")
    endif()

    list(APPEND QGIS_OPTIONS -DWITH_BINDINGS:BOOL=ON)
  else()
    vcpkg_execute_required_process(
      COMMAND "${PYTHON_EXECUTABLE}" -m pip install --upgrade pip ${PIP_MIRRORS}
      WORKING_DIRECTORY ${PYTHON3_PATH}
      LOGNAME pip
    )
    vcpkg_execute_required_process(
      COMMAND "${PYTHON_EXECUTABLE}" -m pip install sip pyqt-builder numpy PyQt5-sip ${PIP_MIRRORS}
      WORKING_DIRECTORY ${PYTHON3_PATH}
      LOGNAME pip
    )
    set(PY_SITE "${CURRENT_INSTALLED_DIR}/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages")
    if(NOT EXISTS "${PY_SITE}/PyQt5")
      message(STATUS "Install PyQt5 for Python Begin ...")
      vcpkg_download_distfile(
        PYQT5_PATH
        URLS https://files.pythonhosted.org/packages/5c/46/b4b6eae1e24d9432905ef1d4e7c28b6610e28252527cdc38f2a75997d8b5/PyQt5-5.15.9.tar.gz
        FILENAME PyQt5-5.15.9.tar.gz
        SHA512 1c07d93aefe1c24e80851eb4631b80a99e7ba06e823181325456edb90285d3d22417a9f7d4c3ff9c6195bd801e7dc2bbabf0587af844a5e4b0a410c4611d119e
      )
      vcpkg_extract_source_archive(${PYQT5_PATH} ${PYTHON3_PATH})
      vcpkg_execute_required_process(
        COMMAND "${CURRENT_INSTALLED_DIR}/bin/sip-install" --target-dir "${PY_SITE}"
        WORKING_DIRECTORY ${PYTHON3_PATH}/PyQt5-5.15.9
        LOGNAME pip
      )
      file(REMOVE_RECURSE "${PYTHON3_PATH}/PyQt5-5.15.9")
      message(STATUS "Install PyQt5 for Python End")
    endif()
    if(NOT EXISTS "${PY_SITE}/PyQt5/bindings/Qt3DCore")
      message(STATUS "Install PyQt3D for Python Begin ...")
      vcpkg_download_distfile(
        PYQT3D_PATH
        URLS https://files.pythonhosted.org/packages/a5/80/26e3394c25187854bd3b68865b2b46cfd285aae01bbf448ddcac6f466af0/PyQt3D-5.15.6.tar.gz
        FILENAME PyQt3D-5.15.6.tar.gz
        SHA512 fa1ebf773fb0a10b3ee58849c2273b6b5e9d3a5b14aa632c007381d494f6443d67e1d613a1fe65177412e6e46e9701767013ede1567a75f390930eda0bce19c4
      )
      vcpkg_extract_source_archive(${PYQT3D_PATH} ${PYTHON3_PATH})
      vcpkg_execute_required_process(
        COMMAND "${CURRENT_INSTALLED_DIR}/bin/sip-install" --target-dir "${PY_SITE}"
        WORKING_DIRECTORY ${PYTHON3_PATH}/PyQt3D-5.15.6
        LOGNAME pip
      )
      file(REMOVE_RECURSE "${PYTHON3_PATH}/PyQt3D-5.15.6")
      message(STATUS "Install PyQt3D for Python End")
    endif()
    if(NOT EXISTS "${PY_SITE}/PyQt5/bindings/Qsci")
      message(STATUS "Install QScintilla for Python Begin ...")
      vcpkg_download_distfile(
        PYQSCINTILLA_PATH
        URLS https://files.pythonhosted.org/packages/cb/e1/1f4cac5ce5f98ca7bfcf2f8aa44b8cb9d842f92143a5f53f4892cb6d3bc1/QScintilla-2.13.4.tar.gz
        FILENAME QScintilla-2.13.4.tar.gz
        SHA512 591379f4d48a6de1bc61db93f6c0d1c48b6830a852679b51e27debb866524c320e2db27d919baf32576c2bf40bba62e38378673a86f22db9839746e26b0f77cd
      )
      vcpkg_extract_source_archive(${PYQSCINTILLA_PATH} ${PYTHON3_PATH})
      file(COPY "${PYTHON3_PATH}/QScintilla_src-2.13.4/Python/pyproject-qt6.toml" DESTINATION "${PYTHON3_PATH}/QScintilla_src-2.13.4/Python/pyproject.toml")
      vcpkg_execute_required_process(
        COMMAND "${CURRENT_INSTALLED_DIR}/bin/sip-install" --target-dir "${PY_SITE}"
        WORKING_DIRECTORY ${PYTHON3_PATH}/QScintilla_src-2.13.4/Python
        LOGNAME pip
      )
      file(REMOVE_RECURSE "${PYTHON3_PATH}/QScintilla_src-2.13.4")
      message(STATUS "Install QScintilla for Python End")
    endif()

    list(APPEND QGIS_OPTIONS -DWITH_BINDINGS:BOOL=ON)
  endif()
else()
  list(APPEND QGIS_OPTIONS -DWITH_BINDINGS:BOOL=OFF)
endif()

# Common options
list(APPEND QGIS_OPTIONS -DPython_EXECUTABLE:FILEPATH=${PYTHON_EXECUTABLE})
list(APPEND QGIS_OPTIONS -DBISON_EXECUTABLE="${BISON}")
list(APPEND QGIS_OPTIONS -DFLEX_EXECUTABLE="${FLEX}")

# Handle some Windows-specific linking quirks
if(VCPKG_TARGET_IS_WINDOWS)
  # Avoid Qt release libs leaking into debug builds
  list(APPEND QGIS_OPTIONS_DEBUG -DQt5_EXCLUDE_STATIC_DEPENDENCIES:BOOL=ON)

  # Provide explicit debug/release import libs when needed
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

  set(SPATIALINDEX_LIB_NAME spatialindex)
  if(VCPKG_TARGET_ARCHITECTURE STREQUAL "x64" OR VCPKG_TARGET_ARCHITECTURE STREQUAL "arm64")
    set(SPATIALINDEX_LIB_NAME spatialindex-64)
  else()
    set(SPATIALINDEX_LIB_NAME spatialindex-32)
  endif()
  FIND_LIB_OPTIONS(SPATIALINDEX ${SPATIALINDEX_LIB_NAME} ${SPATIALINDEX_LIB_NAME} LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
  FIND_LIB_OPTIONS(GEOS geos_c geos_c LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
  FIND_LIB_OPTIONS(GSL gsl gsld LIB ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
  FIND_LIB_OPTIONS(GSLCBLAS gslcblas gslcblasd LIB ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
  FIND_LIB_OPTIONS(PROJ proj proj_d LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
  FIND_LIB_OPTIONS(QCA qca qcad LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
  FIND_LIB_OPTIONS(QWT qwt qwtd LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
  FIND_LIB_OPTIONS(QSCINTILLA qscintilla2_qt6 qscintilla2_qt6d LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
  if("server" IN_LIST FEATURES)
    FIND_LIB_OPTIONS(FCGI fcgi fcgi LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    list(APPEND QGIS_OPTIONS -DFCGI_INCLUDE_DIR="${CURRENT_INSTALLED_DIR}/include/fastcgi")
  endif()
endif()

# Prefer config packages from vcpkg (but keep QGIS' FindProj.cmake to avoid package name mismatch)
file(REMOVE ${SOURCE_PATH}/cmake/FindPoly2Tri.cmake)
file(REMOVE ${SOURCE_PATH}/cmake/FindGSL.cmake)

vcpkg_cmake_configure(
  SOURCE_PATH ${SOURCE_PATH}
  WINDOWS_USE_MSBUILD
  OPTIONS
    ${QGIS_OPTIONS}
  OPTIONS_DEBUG
    ${QGIS_OPTIONS_DEBUG}
  OPTIONS_RELEASE
    ${QGIS_OPTIONS_RELEASE}
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()
vcpkg_fixup_pkgconfig()

function(copy_path basepath)
  file(GLOB ${basepath}_PATH ${CURRENT_PACKAGES_DIR}/${basepath}/*)
  if(${basepath}_PATH)
    file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/tools/${PORT}/${basepath})
    file(COPY ${${basepath}_PATH} DESTINATION ${CURRENT_PACKAGES_DIR}/tools/${PORT}/${basepath})
  endif()
  if(EXISTS "${CURRENT_PACKAGES_DIR}/${basepath}/")
    file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/${basepath}/)
  endif()
  if("debug-tools" IN_LIST FEATURES)
    file(GLOB ${basepath}_DEBUG_PATH ${CURRENT_PACKAGES_DIR}/debug/${basepath}/*)
    if(${basepath}_DEBUG_PATH)
      file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/debug/tools/${PORT}/${basepath})
      file(COPY ${${basepath}_DEBUG_PATH} DESTINATION ${CURRENT_PACKAGES_DIR}/debug/tools/${PORT}/${basepath})
    endif()
  endif()
  if(EXISTS "${CURRENT_PACKAGES_DIR}/debug/${basepath}/")
    file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/${basepath}/)
  endif()
endfunction()

file(GLOB QGIS_CMAKE_PATH ${CURRENT_PACKAGES_DIR}/*.cmake)
if(QGIS_CMAKE_PATH)
  file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/share/cmake/${PORT})
  file(COPY ${QGIS_CMAKE_PATH} DESTINATION ${CURRENT_PACKAGES_DIR}/share/cmake/${PORT})
  file(REMOVE_RECURSE ${QGIS_CMAKE_PATH})
endif()
file(GLOB QGIS_CMAKE_PATH_DEBUG ${CURRENT_PACKAGES_DIR}/debug/*.cmake)
if(QGIS_CMAKE_PATH_DEBUG)
  file(REMOVE_RECURSE ${QGIS_CMAKE_PATH_DEBUG})
endif()

file(GLOB QGIS_TOOL_PATH ${CURRENT_PACKAGES_DIR}/bin/*${VCPKG_TARGET_EXECUTABLE_SUFFIX} ${CURRENT_PACKAGES_DIR}/*${VCPKG_TARGET_EXECUTABLE_SUFFIX})
if(QGIS_TOOL_PATH)
  file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/tools/${PORT}/bin)
  file(COPY ${QGIS_TOOL_PATH} DESTINATION ${CURRENT_PACKAGES_DIR}/tools/${PORT}/bin)
  file(REMOVE_RECURSE ${QGIS_TOOL_PATH})
  file(GLOB QGIS_TOOL_PATH ${CURRENT_PACKAGES_DIR}/bin/*)
  file(COPY ${QGIS_TOOL_PATH} DESTINATION ${CURRENT_PACKAGES_DIR}/tools/${PORT}/bin)
endif()

file(GLOB QGIS_TOOL_PATH_DEBUG ${CURRENT_PACKAGES_DIR}/debug/bin/*${VCPKG_TARGET_EXECUTABLE_SUFFIX} ${CURRENT_PACKAGES_DIR}/debug/*${VCPKG_TARGET_EXECUTABLE_SUFFIX})
if(QGIS_TOOL_PATH_DEBUG)
  if("debug-tools" IN_LIST FEATURES)
    file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/debug/tools/${PORT}/bin)
    file(COPY ${QGIS_TOOL_PATH_DEBUG} DESTINATION ${CURRENT_PACKAGES_DIR}/debug/tools/${PORT}/bin)
    file(REMOVE_RECURSE ${QGIS_TOOL_PATH_DEBUG})
    file(GLOB QGIS_TOOL_PATH_DEBUG ${CURRENT_PACKAGES_DIR}/debug/bin/*)
    file(COPY ${QGIS_TOOL_PATH_DEBUG} DESTINATION ${CURRENT_PACKAGES_DIR}/debug/tools/${PORT}/bin)
  else()
    file(REMOVE_RECURSE ${QGIS_TOOL_PATH_DEBUG})
  endif()
endif()

copy_path(doc)
copy_path(i18n)
copy_path(icons)
copy_path(images)
copy_path(plugins)
copy_path(python)
if("quick" IN_LIST FEATURES)
  copy_path(qml)
endif()
copy_path(resources)
if("server" IN_LIST FEATURES)
  copy_path(server)
endif()
copy_path(svg)

file(GLOB INCLUDE_FILES "${CURRENT_PACKAGES_DIR}/include/*.h")
if(INCLUDE_FILES)
  file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/include/${PORT}")
  file(COPY ${INCLUDE_FILES} DESTINATION "${CURRENT_PACKAGES_DIR}/include/${PORT}")
  file(REMOVE_RECURSE ${INCLUDE_FILES})
endif()
if(EXISTS "${CURRENT_PACKAGES_DIR}/include/nlohmann")
  file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/include/nlohmann")
endif()
file(REMOVE_RECURSE
  ${CURRENT_PACKAGES_DIR}/debug/include
)

# Copyright
file(INSTALL ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
