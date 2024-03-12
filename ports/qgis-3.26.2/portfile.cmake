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
    REF final-3_26_2
    SHA512 10d6ac267f5b62f6fd788010b82281972e34837229bb89503f2df3f774890e2952ce2cc1b1183e90b576c8f3e9afd66263a3ccde9f529b49c261d4f229f67c81
    HEAD_REF master
    PATCHES
        fix-build-failed.diff
        fix-vrgis.diff
)

vcpkg_find_acquire_program(FLEX)
vcpkg_find_acquire_program(BISON)
vcpkg_find_acquire_program(PYTHON3)
get_filename_component(PYTHON3_PATH ${PYTHON3} DIRECTORY)
message(STATUS "PYTHON3 = ${PYTHON3_PATH}")
vcpkg_add_to_path("${PYTHON3_PATH}")
vcpkg_add_to_path("${PYTHON3_PATH}/Scripts")
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

elseif(VCPKG_TARGET_IS_LINUX OR VCPKG_TARGET_IS_OSX) # Build in UNIX
    macro(INSTALL_PROGRAM program)
        if(VCPKG_TARGET_IS_OSX)
            message(STATUS "brew install ${program}")
            vcpkg_execute_required_process(
              COMMAND brew install ${program}
              WORKING_DIRECTORY ${CURRENT_BUILDTREES_DIR}
            )
        else()
            message(STATUS "sudo apt-get install ${program}")
            vcpkg_execute_required_process(
              COMMAND sudo apt-get install -y ${program}
              WORKING_DIRECTORY ${CURRENT_BUILDTREES_DIR}
            )
        endif()
    endmacro()

    find_program(PIP3 pip3)
    if (NOT PIP3)
        INSTALL_PROGRAM(python${PYTHON_VERSION_MAJOR}-pip)
    endif()

    vcpkg_execute_required_process(
        COMMAND "${PYTHON_EXECUTABLE}" -m pip install --upgrade pip ${PIP_MIRRORS}
        WORKING_DIRECTORY ${PYTHON3_PATH}
        LOGNAME pip
    )

    vcpkg_execute_required_process(
        COMMAND "${PYTHON_EXECUTABLE}" -m pip install sip===5.5.0 pyqt-builder===1.6.0 PyQt5==${QT_VERSION} PyQt5-sip QScintilla==${QSCINTILLA_VERSION} PyQt3D==${QT_VERSION} ${PIP_MIRRORS}
        WORKING_DIRECTORY ${PYTHON3_PATH}
        LOGNAME pip
    )

    find_program(PYUIC5 pyuic5)
    if (NOT PYUIC5)
        INSTALL_PROGRAM(pyqt5-dev-tools)
    endif()

    find_program(PYRCC5 pyrcc5)

    #file(REMOVE ${SOURCE_PATH}/cmake/FindProj.cmake)
    #file(REMOVE ${SOURCE_PATH}/cmake/FindGEOS.cmake)
    #file(REMOVE ${SOURCE_PATH}/cmake/FindExpat.cmake)
    #file(REMOVE ${SOURCE_PATH}/cmake/FindLibZip.cmake)
    #file(REMOVE ${SOURCE_PATH}/cmake/FindZLIB.cmake)
    #file(REMOVE ${SOURCE_PATH}/cmake/FindEXIV2.cmake)
    #file(REMOVE ${SOURCE_PATH}/cmake/FindPostgres.cmake)
    #file(REMOVE ${SOURCE_PATH}/cmake/FindZSTD.cmake)
    #file(REMOVE ${SOURCE_PATH}/cmake/FindPDAL.cmake)
    file(REMOVE ${SOURCE_PATH}/cmake/FindGSL.cmake)


    list(APPEND QGIS_OPTIONS -DPROJ_INCLUDE_DIR:FILEPATH=${CURRENT_INSTALLED_DIR}/include)

    list(APPEND QGIS_OPTIONS_DEBUG -DPROJ_LIBRARY="${CURRENT_INSTALLED_DIR}/debug/lib/libproj.a ${CURRENT_INSTALLED_DIR}/debug/lib/libcurl-d.a")
    list(APPEND QGIS_OPTIONS_RELEASE -DPROJ_LIBRARY="${CURRENT_INSTALLED_DIR}/lib/libproj.a ${CURRENT_INSTALLED_DIR}/debug/lib/libcurl.a")

    list(APPEND QGIS_OPTIONS_DEBUG -DQTKEYCHAIN_LIBRARY="${CURRENT_INSTALLED_DIR}/debug/lib/libqt5keychain -lgobject-2.0 -lgmodule-2.0 -lglib-2.0")
    list(APPEND QGIS_OPTIONS_RELEASE -DQTKEYCHAIN_LIBRARY="${CURRENT_INSTALLED_DIR}/lib/libqt5keychain -lgobject-2.0 -lgmodule-2.0 -lglib-2.0")

    list(APPEND QGIS_OPTIONS_DEBUG -DGDAL_LIBRARY="${CURRENT_INSTALLED_DIR}/debug/lib/libproj.a ${CURRENT_INSTALLED_DIR}/debug/lib/libcurl-d.a")
    list(APPEND QGIS_OPTIONS_RELEASE -DGDAL_LIBRARY="${CURRENT_INSTALLED_DIR}/lib/libproj.a ${CURRENT_INSTALLED_DIR}/debug/lib/libcurl.a")


    FIND_LIB_OPTIONS(SPATIALINDEX spatialindex spatialindex LIBRARY ${VCPKG_TARGET_STATIC_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(QWT qwt qwt LIBRARY ${VCPKG_TARGET_STATIC_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(QSCINTILLA qscintilla2_qt5 qscintilla2_qt5 LIBRARY ${VCPKG_TARGET_STATIC_LIBRARY_SUFFIX})
    #if("server" IN_LIST FEATURES)
    #    FIND_LIB_OPTIONS(FCGI fcgi fcgi LIBRARY ${VCPKG_TARGET_STATIC_LIBRARY_SUFFIX})
    #    list(APPEND QGIS_OPTIONS -DFCGI_INCLUDE_DIR:FILEPATH=${CURRENT_INSTALLED_DIR}/include/fastcgi)
    #endif()

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

# handle qgis tools and plugins
function(copy_path basepath)
    file(GLOB ${basepath}_PATH ${CURRENT_PACKAGES_DIR}/${basepath}/*)
    if( ${basepath}_PATH )
        file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/tools/${PORT}/${basepath})
        file(COPY ${${basepath}_PATH} DESTINATION ${CURRENT_PACKAGES_DIR}/tools/${PORT}/${basepath})
    endif()

    if(EXISTS "${CURRENT_PACKAGES_DIR}/${basepath}/")
        file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/${basepath}/)
    endif()

    if("debug-tools" IN_LIST FEATURES)
        file(GLOB ${basepath}_DEBUG_PATH ${CURRENT_PACKAGES_DIR}/debug/${basepath}/*)
        if( ${basepath}_DEBUG_PATH )
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
    file(COPY ${QGIS_CMAKE_PATH} DESTINATION ${CURRENT_PACKAGES_DIR}/share/cmake/${PORT})
    file(REMOVE_RECURSE ${QGIS_CMAKE_PATH})
endif()
file(GLOB QGIS_CMAKE_PATH_DEBUG ${CURRENT_PACKAGES_DIR}/debug/*.cmake)
if( QGIS_CMAKE_PATH_DEBUG )
    file(REMOVE_RECURSE ${QGIS_CMAKE_PATH_DEBUG})
endif()

file(GLOB QGIS_TOOL_PATH ${CURRENT_PACKAGES_DIR}/bin/*${VCPKG_TARGET_EXECUTABLE_SUFFIX} ${CURRENT_PACKAGES_DIR}/*${VCPKG_TARGET_EXECUTABLE_SUFFIX})
if(QGIS_TOOL_PATH)
    file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/tools/${PORT}/bin)
    file(COPY ${QGIS_TOOL_PATH} DESTINATION ${CURRENT_PACKAGES_DIR}/tools/${PORT}/bin)
    file(REMOVE_RECURSE ${QGIS_TOOL_PATH})
    file(GLOB QGIS_TOOL_PATH ${CURRENT_PACKAGES_DIR}/bin/* )
    file(COPY ${QGIS_TOOL_PATH} DESTINATION ${CURRENT_PACKAGES_DIR}/tools/${PORT}/bin)
endif()

file(GLOB QGIS_TOOL_PATH_DEBUG ${CURRENT_PACKAGES_DIR}/debug/bin/*${VCPKG_TARGET_EXECUTABLE_SUFFIX} ${CURRENT_PACKAGES_DIR}/debug/*${VCPKG_TARGET_EXECUTABLE_SUFFIX})
if(QGIS_TOOL_PATH_DEBUG)
    if("debug-tools" IN_LIST FEATURES)
        file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/debug/tools/${PORT}/bin)
        file(COPY ${QGIS_TOOL_PATH_DEBUG} DESTINATION ${CURRENT_PACKAGES_DIR}/debug/tools/${PORT}/bin)
        file(REMOVE_RECURSE ${QGIS_TOOL_PATH_DEBUG})
        file(GLOB QGIS_TOOL_PATH_DEBUG ${CURRENT_PACKAGES_DIR}/debug/bin/* )
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

    vcpkg_copy_tool_dependencies_ex(${CURRENT_PACKAGES_DIR}/tools/${PORT}/bin ${CURRENT_PACKAGES_DIR}/tools/${PORT}/bin bin)
    vcpkg_copy_tool_dependencies_ex(${CURRENT_PACKAGES_DIR}/tools/${PORT}/plugins ${CURRENT_PACKAGES_DIR}/tools/${PORT}/bin bin)
    if("debug-tools" IN_LIST FEATURES)
        vcpkg_copy_tool_dependencies_ex(${CURRENT_PACKAGES_DIR}/debug/tools/${PORT}/bin ${CURRENT_PACKAGES_DIR}/debug/tools/${PORT}/bin debug/bin)
        vcpkg_copy_tool_dependencies_ex(${CURRENT_PACKAGES_DIR}/debug/tools/${PORT}/plugins ${CURRENT_PACKAGES_DIR}/debug/tools/${PORT}/bin debug/bin)
    endif()
    if("server" IN_LIST FEATURES)
        vcpkg_copy_tool_dependencies_ex(${CURRENT_PACKAGES_DIR}/tools/${PORT}/server ${CURRENT_PACKAGES_DIR}/tools/${PORT}/bin bin)
        if("debug-tools" IN_LIST FEATURES)
            vcpkg_copy_tool_dependencies_ex(${CURRENT_PACKAGES_DIR}/debug/tools/${PORT}/server ${CURRENT_PACKAGES_DIR}/debug/tools/${PORT}/bin debug/bin)
        endif()
    endif()
endif()

file(GLOB INCLUDE_FILES "${CURRENT_PACKAGES_DIR}/include/*")
if(INCLUDE_FILES)
    file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/include/${PORT}")
    file(COPY ${INCLUDE_FILES} DESTINATION "${CURRENT_PACKAGES_DIR}/include/${PORT}")
    file(REMOVE_RECURSE ${INCLUDE_FILES})
endif()
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

# Handle copyright
file(INSTALL ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
