if(EXISTS "${CURRENT_INSTALLED_DIR}/include/qt5/QtCore/qconfig.h")
  file(READ "${CURRENT_INSTALLED_DIR}/include/qt5/QtCore/qconfig.h" QCONFIG_CONTENTS)
  if(QCONFIG_CONTENTS)
    STRING(REGEX REPLACE "^.*QT_VERSION_STR +\"([^\"]+)\".*$" "\\1" QT_VERSION "${QCONFIG_CONTENTS}")
    MESSAGE(STATUS "QT_VERSION = ${QT_VERSION}")
  endif()
endif()

if(EXISTS "${CURRENT_INSTALLED_DIR}/include/Qsci/qsciglobal.h")
  file(READ "${CURRENT_INSTALLED_DIR}/include/Qsci/qsciglobal.h" QSCIGLOBAL_CONTENTS)
  if(QSCIGLOBAL_CONTENTS)
    STRING(REGEX REPLACE "^.*QSCINTILLA_VERSION_STR +\"([^\"]+)\".*$" "\\1" QSCINTILLA_VERSION "${QSCIGLOBAL_CONTENTS}")
    MESSAGE(STATUS "QSCINTILLA_VERSION = ${QSCINTILLA_VERSION}")
  endif()
endif()

set(PYTHON_VERSION_MAJOR  3)
set(PYTHON_VERSION_MINOR  8)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO qgis/QGIS
    REF final-3_30_2
    SHA512 72f9c926aeb4d5a13787e640523831217641094d00dd742fe4d9981db30c7b1349fa2a5ce36dfd5b1cc55e21f26681fc261b00c4db8e1be5c7f517b3048bea79
    HEAD_REF master
    PATCHES
        fix-build-failed.diff
        fix-vrgis.diff
)

vcpkg_find_acquire_program(FLEX)
vcpkg_find_acquire_program(BISON)
if(VCPKG_TARGET_IS_WINDOWS)
    vcpkg_find_acquire_program(PYTHON3)
else()
    set(PYTHON3 ${CURRENT_INSTALLED_DIR}/tools/python3/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR})
endif()
get_filename_component(PYTHON3_PATH ${PYTHON3} DIRECTORY)
message(STATUS "PYTHON3 = ${PYTHON3_PATH}")
vcpkg_add_to_path("${PYTHON3_PATH}")
if(VCPKG_TARGET_IS_WINDOWS)
    vcpkg_add_to_path("${PYTHON3_PATH}/Scripts")
else()
    vcpkg_add_to_path("${CURRENT_INSTALLED_DIR}/bin")
    vcpkg_add_to_path("${CURRENT_INSTALLED_DIR}/tools/qt5/bin")
    vcpkg_add_to_path("${CURRENT_INSTALLED_DIR}/tools/gdal")
    vcpkg_add_to_path("${CURRENT_INSTALLED_DIR}/tools/libpq/bin")
endif()
set(PYTHON_EXECUTABLE ${PYTHON3})

list(APPEND QGIS_OPTIONS -DENABLE_TESTS:BOOL=OFF)
list(APPEND QGIS_OPTIONS -DWITH_QTWEBKIT:BOOL=OFF)
list(APPEND QGIS_OPTIONS -DWITH_GRASS7:BOOL=OFF)
list(APPEND QGIS_OPTIONS -DWITH_QSPATIALITE:BOOL=ON)
list(APPEND QGIS_OPTIONS -DWITH_CUSTOM_WIDGETS:BOOL=ON)
list(APPEND QGIS_OPTIONS -DSERVER_SKIP_ECW:BOOL=ON)
list(APPEND QGIS_OPTIONS -DWITH_INTERNAL_POLY2TRI:BOOL=OFF)

if(VCPKG_TARGET_IS_WINDOWS)
    # Extend vcpkg_copy_tool_dependencies to support the export of dll and exe dependencies in different directories to the same directory,
    # and support the copy of debug dependencies
    function(vcpkg_copy_tool_dependencies_ex TOOL_DIR OUTPUT_DIR SEARCH_DIR)
        find_program(PS_EXE powershell PATHS ${DOWNLOADS}/tool)
        if (PS_EXE-NOTFOUND)
            message(FATAL_ERROR "Could not find powershell in vcpkg tools, please open an issue to report this.")
        endif()
        macro(search_for_dependencies PATH_TO_SEARCH)
            file(GLOB TOOLS ${TOOL_DIR}/*.exe ${TOOL_DIR}/*.dll)
            foreach(TOOL ${TOOLS})
                vcpkg_execute_required_process(
                    COMMAND ${PS_EXE} -noprofile -executionpolicy Bypass -nologo
                        -file ${CMAKE_CURRENT_LIST_DIR}/applocal.ps1
                        -targetBinary ${TOOL}
                        -installedDir ${PATH_TO_SEARCH}
                        -outputDir    ${OUTPUT_DIR}
                    WORKING_DIRECTORY ${VCPKG_ROOT_DIR}
                    LOGNAME copy-tool-dependencies
                )
            endforeach()
        endmacro()
        search_for_dependencies(${CURRENT_PACKAGES_DIR}/${SEARCH_DIR})
        search_for_dependencies(${CURRENT_INSTALLED_DIR}/${SEARCH_DIR})
    endfunction()

    #vcpkg_copy_tool_dependencies_ex(E:/vcpkg/buildtrees/osg/x64-windows-dbg/bin E:/vcpkg/packages/osg_x64-windows/debug/tools/osg debug/bin)
    #vcpkg_copy_tool_dependencies_ex(E:/vcpkg/packages/osg_x64-windows/debug/tools/osg/osgPlugins-3.6.5 E:/vcpkg/packages/osg_x64-windows/debug/tools/osg debug/bin)
    #vcpkg_copy_tool_dependencies_ex(E:/vcpkg/packages/osg_x64-windows/tools/osg/osgPlugins-3.6.5 E:/vcpkg/packages/osg_x64-windows/tools/osg bin)
endif()

##############################################################################
# Not implemented
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
##############################################################################

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

# Configure debug and release library paths
macro(FIND_LIB_OPTIONS basename relname debname suffix libsuffix)
   file(TO_NATIVE_PATH "${CURRENT_INSTALLED_DIR}/lib/${VCPKG_TARGET_STATIC_LIBRARY_PREFIX}${relname}${libsuffix}" ${basename}_LIBRARY_RELEASE)
   file(TO_NATIVE_PATH "${CURRENT_INSTALLED_DIR}/debug/lib/${VCPKG_TARGET_STATIC_LIBRARY_PREFIX}${debname}${libsuffix}" ${basename}_LIBRARY_DEBUG)
   if( ${basename}_LIBRARY_DEBUG AND ${basename}_LIBRARY_RELEASE AND NOT ${basename}_LIBRARY_DEBUG STREQUAL ${basename}_LIBRARY_RELEASE )
        list(APPEND QGIS_OPTIONS_RELEASE -D${basename}_${suffix}:FILEPATH=${${basename}_LIBRARY_RELEASE})
        list(APPEND QGIS_OPTIONS_DEBUG -D${basename}_${suffix}:FILEPATH=${${basename}_LIBRARY_DEBUG})
   elseif( ${basename}_LIBRARY_RELEASE )
        list(APPEND QGIS_OPTIONS -D${basename}_${suffix}:FILEPATH=${${basename}_LIBRARY_RELEASE})
   elseif( ${basename}_LIBRARY_DEBUG )
        list(APPEND QGIS_OPTIONS -D${basename}_${suffix}:FILEPATH=${${basename}_LIBRARY_DEBUG})
   endif()
endmacro()

if(VCPKG_TARGET_IS_WINDOWS)
    if("quick" IN_LIST FEATURES)
        vcpkg_add_to_path(${CURRENT_INSTALLED_DIR}/bin)
        vcpkg_add_to_path(${CURRENT_INSTALLED_DIR}/debug/bin)
        if("ltr" IN_LIST FEATURES)
            vcpkg_apply_patches(
                    SOURCE_PATH ${SOURCE_PATH}
                    PATCHES "${CMAKE_CURRENT_LIST_DIR}/qgsquick-ltr.patch"
                    QUIET
                )
        else()
            vcpkg_apply_patches(
                    SOURCE_PATH ${SOURCE_PATH}
                    PATCHES "${CMAKE_CURRENT_LIST_DIR}/qgsquick.patch"
                    QUIET
                )
        endif()
    endif()

    ##############################################################################
    #Install pip
    if(NOT EXISTS "${PYTHON3_PATH}/Scripts/pip.exe")
        MESSAGE(STATUS  "Install pip for Python Begin ...")
        vcpkg_download_distfile(
            GET_PIP_PATH
            URLS https://bootstrap.pypa.io/get-pip.py
            FILENAME get-pip.py
            SHA512  91e56cba31827911707bca5c036e602a2ef01e15cdce3b07b4dd102577bd6c44727dad81c65be8375ee33857d8f01633397656c4b4702b968c041aecccc29b12
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
        MESSAGE(STATUS  "Install pip for Python End")
    endif (NOT EXISTS "${PYTHON3_PATH}/Scripts/pip.exe")
    ##############################################################################

    ##############################################################################
    #Install sip
    if(NOT EXISTS "${PYTHON3_PATH}/Scripts/sip-install.exe")
        MESSAGE(STATUS  "Install sip for Python Begin ...")
        #file(GLOB PYTHON_INCLUDE ${CURRENT_INSTALLED_DIR}/include/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/*)
        #file(COPY ${PYTHON_INCLUDE} DESTINATION "${PYTHON3_PATH}/Include")
        #file(COPY "${CURRENT_INSTALLED_DIR}/lib/python${PYTHON_VERSION_MAJOR}${PYTHON_VERSION_MINOR}.lib" DESTINATION "${PYTHON3_PATH}/libs")
        #file(COPY "${CURRENT_INSTALLED_DIR}/debug/lib/python${PYTHON_VERSION_MAJOR}${PYTHON_VERSION_MINOR}_d.lib" DESTINATION "${PYTHON3_PATH}/libs")

        vcpkg_execute_required_process(
            COMMAND "${PYTHON_EXECUTABLE}" -m pip install sip ${PIP_MIRRORS}
            WORKING_DIRECTORY ${PYTHON3_PATH}
            LOGNAME pip
        )
        MESSAGE(STATUS  "Install sip for Python End")
    endif (NOT EXISTS "${PYTHON3_PATH}/Scripts/sip-install.exe")

    #Install pyqt5 pyqt3d qscintilla
    if(NOT EXISTS "${PYTHON3_PATH}/Scripts/pyuic5.exe")
        MESSAGE(STATUS  "Install PyQt5 for Python Begin ...")
        vcpkg_execute_required_process(
            COMMAND "${PYTHON_EXECUTABLE}" -m pip install PyQt5==${QT_VERSION} PyQt5-sip QScintilla==${QSCINTILLA_VERSION} PyQt3D==${QT_VERSION} PyQt-builder ${PIP_MIRRORS}
            WORKING_DIRECTORY ${PYTHON3_PATH}
            LOGNAME pip
        )
        #file(COPY "${PYTHON3_PATH}/python${PYTHON_VERSION_MAJOR}.dll" DESTINATION "${PYTHON3_PATH}/Lib/site-packages/PyQt5")
        MESSAGE(STATUS  "Install PyQt5 for Python End")
    endif (NOT EXISTS "${PYTHON3_PATH}/Scripts/pyuic5.exe")

    #Install pyqt5's and pyqt3d's sip files
    if("bindings" IN_LIST FEATURES)
        EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} "${SOURCE_PATH}/cmake/FindSIP.py" OUTPUT_VARIABLE sip_config)
        if(sip_config)
            STRING(REGEX REPLACE ".*\ndefault_sip_dir:([^\n]+).*$" "\\1" SIP_DEFAULT_SIP_DIR ${sip_config})
        endif(sip_config)

        if( SIP_DEFAULT_SIP_DIR )
            if(NOT EXISTS "${SIP_DEFAULT_SIP_DIR}/QtCore/QtCoremod.sip")
                MESSAGE(STATUS  "Install PyQt5 sip for Python Begin ...")
                    file(GLOB PYQT5_SIP "${PYTHON3_PATH}/Lib/site-packages/PyQt5/bindings/*")
                    file(COPY ${PYQT5_SIP} DESTINATION "${SIP_DEFAULT_SIP_DIR}")
                MESSAGE(STATUS  "Install PyQt5 sip for Python End")
            endif (NOT EXISTS "${SIP_DEFAULT_SIP_DIR}/QtCore/QtCoremod.sip")

            #Install qgis dependencies Module for Python
            #MESSAGE(STATUS  "Install qgis dependencies Module for Python Begin ...")
            #set(PROJ_DIR ${CURRENT_INSTALLED_DIR}/include
            #vcpkg_execute_required_process(
            #    COMMAND "${PYTHON_EXECUTABLE}" -m pip install autopep8 python-dateutil future httplib2 lxml markupsafe mock nose2 plotly psycopg2 pygments six termcolor tz pyyaml psycopg2-binary numpy pyproj owslib jinja2 gdal ${PIP_MIRRORS}
            #    WORKING_DIRECTORY ${PYTHON3_PATH}
            #    LOGNAME pip
            #)
            #MESSAGE(STATUS  "Install qgis dependencies Module for Python End")
            #list(APPEND QGIS_OPTIONS_DEBUG -DWITH_BINDINGS:BOOL=OFF)
            #list(APPEND QGIS_OPTIONS_RELEASE -DWITH_BINDINGS:BOOL=ON)
            list(APPEND QGIS_OPTIONS -DWITH_BINDINGS:BOOL=ON)
        else()
            list(APPEND QGIS_OPTIONS -DWITH_BINDINGS:BOOL=OFF)
        endif()
    else()
        list(APPEND QGIS_OPTIONS -DWITH_BINDINGS:BOOL=OFF)
    endif()

    ##############################################################################

    list(APPEND QGIS_OPTIONS -DPython_EXECUTABLE:FILEPATH=${PYTHON_EXECUTABLE})
    # flex and bison for ANGLE library
    list(APPEND QGIS_OPTIONS -DBISON_EXECUTABLE="${BISON}")
    list(APPEND QGIS_OPTIONS -DFLEX_EXECUTABLE="${FLEX}")

    set(SPATIALINDEX_LIB_NAME spatialindex)
    if( VCPKG_TARGET_ARCHITECTURE STREQUAL "x64" OR VCPKG_TARGET_ARCHITECTURE STREQUAL "arm64" )
        set( SPATIALINDEX_LIB_NAME "spatialindex-64" )
    else()
        set( SPATIALINDEX_LIB_NAME "spatialindex-32" )
    endif()
    FIND_LIB_OPTIONS(SPATIALINDEX ${SPATIALINDEX_LIB_NAME} ${SPATIALINDEX_LIB_NAME} LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})

    # qgis_gui depends on Qt5UiTools, and Qt5UiTools is a static library.
    # If Qt5_EXCLUDE_STATIC_DEPENDENCIES is not set, it will add the QT release library that it depends on.
    # so that in debug mode, it will reference both the qt debug library and the release library.
    # In Debug mode, add Qt5_EXCLUDE_STATIC_DEPENDENCIES to avoid this bug
    list(APPEND QGIS_OPTIONS_DEBUG -DQt5_EXCLUDE_STATIC_DEPENDENCIES:BOOL=ON)

    FIND_LIB_OPTIONS(GEOS geos_c geos_c LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(GSL gsl gsld LIB ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(GSLCBLAS gslcblas gslcblasd LIB ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(PROJ proj proj_d LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(QCA qca qcad LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(QWT qwt qwtd LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(QTKEYCHAIN qt5keychain qt5keychaind LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(QSCINTILLA qscintilla2_qt5 qscintilla2_qt5d LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    if("server" IN_LIST FEATURES)
        FIND_LIB_OPTIONS(FCGI fcgi fcgi LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
        list(APPEND QGIS_OPTIONS -DFCGI_INCLUDE_DIR="${CURRENT_INSTALLED_DIR}/include/fastcgi")
    endif()

    file(REMOVE ${SOURCE_PATH}/cmake/FindProj.cmake)
    file(REMOVE ${SOURCE_PATH}/cmake/FindPoly2Tri.cmake)
    file(REMOVE ${SOURCE_PATH}/cmake/FindGSL.cmake)

elseif(VCPKG_TARGET_IS_LINUX OR VCPKG_TARGET_IS_OSX) # Build in UNIX
    vcpkg_execute_required_process(
        COMMAND "${PYTHON_EXECUTABLE}" -m pip install --upgrade pip ${PIP_MIRRORS}
        WORKING_DIRECTORY ${PYTHON3_PATH}
        LOGNAME pip
    )

    # install  sip pyqt-builder
    vcpkg_execute_required_process(
        COMMAND "${PYTHON_EXECUTABLE}" -m pip install sip pyqt-builder numpy PyQt5-sip ${PIP_MIRRORS}
        WORKING_DIRECTORY ${PYTHON3_PATH}
        LOGNAME pip
    )

    if(NOT EXISTS "${CURRENT_INSTALLED_DIR}/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages/PyQt5")
        MESSAGE(STATUS  "Install PyQt5 for Python Begin")
        vcpkg_download_distfile(
             PYQT5_PATH
             URLS https://files.pythonhosted.org/packages/5c/46/b4b6eae1e24d9432905ef1d4e7c28b6610e28252527cdc38f2a75997d8b5/PyQt5-5.15.9.tar.gz
             FILENAME PyQt5-5.15.9.tar.gz
             SHA512  1c07d93aefe1c24e80851eb4631b80a99e7ba06e823181325456edb90285d3d22417a9f7d4c3ff9c6195bd801e7dc2bbabf0587af844a5e4b0a410c4611d119e
        )

        vcpkg_extract_source_archive(
             ${PYQT5_PATH} ${PYTHON3_PATH}
        )

        vcpkg_execute_required_process(
            COMMAND "${CURRENT_INSTALLED_DIR}/bin/sip-install" --target-dir "${CURRENT_INSTALLED_DIR}/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages"
            WORKING_DIRECTORY ${PYTHON3_PATH}/PyQt5-5.15.9
            LOGNAME pip
        )
        file(REMOVE_RECURSE "${PYTHON3_PATH}/PyQt5-5.15.9")
        MESSAGE(STATUS  "Install PyQt5 for Python End")
    endif()

    if(NOT EXISTS "${CURRENT_INSTALLED_DIR}/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages/PyQt5/bindings/Qt3DCore")
        MESSAGE(STATUS  "Install PyQt3D for Python Begin")
        vcpkg_download_distfile(
             PYQT3D_PATH
             URLS https://files.pythonhosted.org/packages/a5/80/26e3394c25187854bd3b68865b2b46cfd285aae01bbf448ddcac6f466af0/PyQt3D-5.15.6.tar.gz
             FILENAME PyQt3D-5.15.6.tar.gz
             SHA512  fa1ebf773fb0a10b3ee58849c2273b6b5e9d3a5b14aa632c007381d494f6443d67e1d613a1fe65177412e6e46e9701767013ede1567a75f390930eda0bce19c4
        )

        vcpkg_extract_source_archive(
             ${PYQT3D_PATH} ${PYTHON3_PATH}
        )

        vcpkg_execute_required_process(
            COMMAND "${CURRENT_INSTALLED_DIR}/bin/sip-install" --target-dir "${CURRENT_INSTALLED_DIR}/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages"
            WORKING_DIRECTORY ${PYTHON3_PATH}/PyQt3D-5.15.6
            LOGNAME pip
        )
        file(REMOVE_RECURSE "${PYTHON3_PATH}/PyQt3D-5.15.6")
        MESSAGE(STATUS  "Install PyQt3D for Python End")
    endif()

    if(NOT EXISTS "${CURRENT_INSTALLED_DIR}/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages/PyQt5/bindings/Qsci")
        MESSAGE(STATUS  "Install QScintilla for Python Begin")
        vcpkg_download_distfile(
             PYQSCINTILLA_PATH
             URLS https://files.pythonhosted.org/packages/cb/e1/1f4cac5ce5f98ca7bfcf2f8aa44b8cb9d842f92143a5f53f4892cb6d3bc1/QScintilla-2.13.4.tar.gz
             FILENAME QScintilla-2.13.4.tar.gz
             SHA512  591379f4d48a6de1bc61db93f6c0d1c48b6830a852679b51e27debb866524c320e2db27d919baf32576c2bf40bba62e38378673a86f22db9839746e26b0f77cd
        )

        vcpkg_extract_source_archive(
             ${PYQSCINTILLA_PATH} ${PYTHON3_PATH}
        )

        file(COPY "${PYTHON3_PATH}/QScintilla_src-2.13.4/Python/pyproject-qt5.toml" DESTINATION "${PYTHON3_PATH}/QScintilla_src-2.13.4/Python/pyproject.toml")
        vcpkg_execute_required_process(
            COMMAND "${CURRENT_INSTALLED_DIR}/bin/sip-install" --target-dir "${CURRENT_INSTALLED_DIR}/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages"
            WORKING_DIRECTORY ${PYTHON3_PATH}/QScintilla_src-2.13.4/Python
            LOGNAME pip
        )
        file(REMOVE_RECURSE "${PYTHON3_PATH}/QScintilla_src-2.13.4")
        MESSAGE(STATUS  "Install QScintilla for Python End")
    endif()

    if(NOT EXISTS "${CURRENT_INSTALLED_DIR}/bin/gdal_merge.py")
        MESSAGE(STATUS  "Install gdal for Python Begin")
        vcpkg_download_distfile(
             PYGDAL_PATH
             URLS https://files.pythonhosted.org/packages/22/b3/bb0c26730ad1fb1bfc8994bc9b6bea9d4cd0ded48a4e33ed66408d089466/GDAL-3.7.0.tar.gz
             FILENAME GDAL-3.7.0.tar.gz
             SHA512  60d324369cd9274a60da834b63e177fc7e6e33018ee5ce558c9ebf060a149d2ff51246c4669cd62c6cc44d76555ae7521c234e1b592a02ad0da37b9e02afa1e3
        )

        vcpkg_extract_source_archive(
             ${PYGDAL_PATH} ${PYTHON3_PATH}
        )

        vcpkg_execute_required_process(
            COMMAND "${PYTHON_EXECUTABLE}" setup.py install
            WORKING_DIRECTORY ${PYTHON3_PATH}/GDAL-3.7.0
            LOGNAME pip
        )
        file(REMOVE_RECURSE "${PYTHON3_PATH}/PyQt3D-5.15.6")
        MESSAGE(STATUS  "Install gdal for Python End")
    endif()

    set(PYUIC5 ${PYTHON3_PATH}/pyuic5)
    set(PYRCC5 ${PYTHON3_PATH}/pyrcc5)

    vcpkg_execute_required_process(
        COMMAND "${PYTHON_EXECUTABLE}" -m pip install autopep8 python-dateutil future httplib2 lxml markupsafe mock nose2 plotly psycopg2 pygments six termcolor tz pyyaml psycopg2-binary numpy pyproj owslib jinja2 ${PIP_MIRRORS}
        WORKING_DIRECTORY ${PYTHON3_PATH}
        LOGNAME pip
    )

    file(REMOVE ${SOURCE_PATH}/cmake/FindProj.cmake)
    file(REMOVE ${SOURCE_PATH}/cmake/FindPoly2Tri.cmake)
    file(REMOVE ${SOURCE_PATH}/cmake/FindGSL.cmake)
else() # Other build system
  message(FATAL_ERROR "Unsupport build system.")
endif()

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
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/${PORT})

# Handle copyright
file(INSTALL ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
