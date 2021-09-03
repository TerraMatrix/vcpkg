set(QT_VERSION 5.15.2)
set(QSCINTILLA_VERSION 2.12.0)
set(PYTHON_VERSION_MAJOR  3)
set(PYTHON_VERSION_MINOR  9)

vcpkg_check_linkage(ONLY_DYNAMIC_LIBRARY)

if("ltr" IN_LIST FEATURES)
    set(QGIS_REF VRGIS-3.16)
    set(QGIS_SHA512 0336f46adc300f740bfac70aec2142d1d1de7c4500c27e650014a09b6e6f4a7a6d65585e758a79bf9c73372ede2d85525b63c9c7d9aa29433ee0e4146bc4c32f)
else()
    set(QGIS_REF master)
    set(QGIS_SHA512 bf4fef8c605b5d52151343e7a7cbc2c6371d85034dddedca236d4e352a313baf9e3f11cf21e984cae65ac13f97c06817976961976789cdb6a3da4a1d0e3d44b1)
endif()

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO longhuan2018/QGIS
    REF ${QGIS_REF}
    SHA512   ${QGIS_SHA512}
    HEAD_REF master
    PATCHES
        # Make qgis support python's debug library
        qgspython.patch
        # In vcpkg, qca's library name is qca, but qgis defaults to qca-qt5 or qca2-qt5, so add qca for easy searching
        qca.patch
        fixpython3.patch
)

vcpkg_find_acquire_program(FLEX)
vcpkg_find_acquire_program(BISON)
vcpkg_find_acquire_program(PYTHON3)
get_filename_component(PYTHON3_PATH ${PYTHON3} DIRECTORY)
message(STATUS "PYTHON37 = ${PYTHON3_PATH}")
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
            SHA512  c11e0131fc9ba55f80cc223de6b9b8f9cefe7368f495cba8d45bbf052e2b0dc4f2f99e7d4e4492c01596540c14dea016123a168aea116ed2bcedfb8f289717cd
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
    if("sip5" IN_LIST FEATURES)
        if(NOT EXISTS "${PYTHON3_PATH}/Scripts/sip5.exe")
            MESSAGE(STATUS  "Install sip==5.5.0 for Python Begin ...")
            file(GLOB PYTHON_INCLUDE ${CURRENT_INSTALLED_DIR}/include/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/*)
            file(COPY ${PYTHON_INCLUDE} DESTINATION "${PYTHON3_PATH}/Include")
            file(COPY "${CURRENT_INSTALLED_DIR}/lib/python${PYTHON_VERSION_MAJOR}${PYTHON_VERSION_MINOR}.lib" DESTINATION "${PYTHON3_PATH}/libs")
            file(COPY "${CURRENT_INSTALLED_DIR}/debug/lib/python${PYTHON_VERSION_MAJOR}${PYTHON_VERSION_MINOR}_d.lib" DESTINATION "${PYTHON3_PATH}/libs")
        
            vcpkg_execute_required_process(
                COMMAND "${PYTHON_EXECUTABLE}" -m pip install sip ${PIP_MIRRORS}
                WORKING_DIRECTORY ${PYTHON3_PATH}
                LOGNAME pip
            )
            MESSAGE(STATUS  "Install sip for Python End")
        endif (NOT EXISTS "${PYTHON3_PATH}/Scripts/sip5.exe")
    else()
        if(NOT EXISTS "${PYTHON3_PATH}/Lib/site-packages/sip.pyd")
            MESSAGE(STATUS  "Install sip for Python Begin ...")
            set(SIP_VERSION "4.19.24")
            vcpkg_download_distfile(
                SIP_PATH
                URLS https://www.riverbankcomputing.com/static/Downloads/sip/${SIP_VERSION}/sip-${SIP_VERSION}.tar.gz
                FILENAME sip-${SIP_VERSION}.tar.gz
                SHA512  c9acf8c66da6ff24ffaeed254c11deabbc587cea0eb50164f2016199af30b85980f96a2d754ae5e7fe080f9076673b1abc82e2a6a41ff2ac442fb2b326fca1c0
            )

            vcpkg_extract_source_archive(
                 ${SIP_PATH} ${PYTHON3_PATH}
            )

            set(SIP_PATH ${PYTHON3_PATH}/sip-${SIP_VERSION})
            file(COPY "${SIP_PATH}/siputils.py" DESTINATION "${PYTHON3_PATH}")
            file(GLOB PYTHON_INCLUDE ${CURRENT_INSTALLED_DIR}/include/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/*)
            file(COPY ${PYTHON_INCLUDE} DESTINATION "${PYTHON3_PATH}/Include")
            file(COPY "${CURRENT_INSTALLED_DIR}/lib/python${PYTHON_VERSION_MAJOR}${PYTHON_VERSION_MINOR}.lib" DESTINATION "${PYTHON3_PATH}/libs")

            vcpkg_execute_required_process(
                COMMAND "${PYTHON_EXECUTABLE}" configure.py
                WORKING_DIRECTORY ${SIP_PATH}
                LOGNAME pip
            )

            find_program(NMAKE nmake REQUIRED)
            vcpkg_execute_required_process(
                COMMAND ${NMAKE} -f Makefile install
                WORKING_DIRECTORY ${SIP_PATH}
                LOGNAME pip
            )

            file(REMOVE_RECURSE "${PYTHON3_PATH}/siputils.py")
            file(REMOVE_RECURSE "${PYTHON3_PATH}/sip-${SIP_VERSION}.tar.gz.extracted")
            file(REMOVE_RECURSE "${SIP_PATH}")
            MESSAGE(STATUS  "Install sip for Python End")
        endif (NOT EXISTS "${PYTHON3_PATH}/Lib/site-packages/sip.pyd")
    endif ("sip5" IN_LIST FEATURES)

    #Install pyqt5 pyqt3d qscintilla
    if(NOT EXISTS "${PYTHON3_PATH}/Scripts/pyuic5.exe")
        MESSAGE(STATUS  "Install PyQt5 for Python Begin ...")
        vcpkg_execute_required_process(
            COMMAND "${PYTHON_EXECUTABLE}" -m pip install PyQt5==${QT_VERSION} PyQt5-sip QScintilla==${QSCINTILLA_VERSION} PyQt3D==${QT_VERSION} ${PIP_MIRRORS}
            WORKING_DIRECTORY ${PYTHON3_PATH}
            LOGNAME pip
        )
        file(COPY "${PYTHON3_PATH}/python${PYTHON_VERSION_MAJOR}.dll" DESTINATION "${PYTHON3_PATH}/Lib/site-packages/PyQt5")
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
            list(APPEND QGIS_OPTIONS -DWITH_BINDINGS:BOOL=ON)
        else()
            list(APPEND QGIS_OPTIONS -DWITH_BINDINGS:BOOL=OFF)
        endif()
    else()
        list(APPEND QGIS_OPTIONS -DWITH_BINDINGS:BOOL=OFF)
    endif()

    ##############################################################################

    list(APPEND QGIS_OPTIONS -DPYTHON_EXECUTABLE:FILEPATH=${PYTHON_EXECUTABLE})
    # flex and bison for ANGLE library
    list(APPEND QGIS_OPTIONS -DBISON_EXECUTABLE="${BISON}")
    list(APPEND QGIS_OPTIONS -DFLEX_EXECUTABLE="${FLEX}")

    list(APPEND QGIS_OPTIONS -DPYUIC_PROGRAM:FILEPATH=${PYTHON3_PATH}/Scripts/pyuic5.exe)
    list(APPEND QGIS_OPTIONS -DPYRCC_PROGRAM:FILEPATH=${PYTHON3_PATH}/Scripts/pyrcc5.exe)
    list(APPEND QGIS_OPTIONS -DQT_LRELEASE_EXECUTABLE:FILEPATH=${CURRENT_INSTALLED_DIR}/tools/qt5-tools/bin/lrelease.exe)

    if("quick" IN_LIST FEATURES)
        list(APPEND QGIS_OPTIONS_DEBUG -DQMLPLUGINDUMP_EXECUTABLE:FILEPATH=${CURRENT_INSTALLED_DIR}/tools/qt5/debug/bin/qmlplugindump.exe)
        list(APPEND QGIS_OPTIONS_RELEASE -DQMLPLUGINDUMP_EXECUTABLE:FILEPATH=${CURRENT_INSTALLED_DIR}/tools/qt5-declarative/bin/qmlplugindump.exe)
    endif()

    # qgis_gui depends on Qt5UiTools, and Qt5UiTools is a static library.
    # If Qt5_EXCLUDE_STATIC_DEPENDENCIES is not set, it will add the QT release library that it depends on.
    # so that in debug mode, it will reference both the qt debug library and the release library.
    # In Debug mode, add Qt5_EXCLUDE_STATIC_DEPENDENCIES to avoid this bug
    list(APPEND QGIS_OPTIONS_DEBUG -DQt5_EXCLUDE_STATIC_DEPENDENCIES:BOOL=ON)

    FIND_LIB_OPTIONS(GDAL gdal gdald LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(GEOS geos_c geos_cd LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(GSL gsl gsld LIB ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(GSLCBLAS gslcblas gslcblasd LIB ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(POSTGRES libpq libpq LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(PROJ proj proj_d LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(PYTHON python${PYTHON_VERSION_MAJOR}${PYTHON_VERSION_MINOR} python${PYTHON_VERSION_MAJOR}${PYTHON_VERSION_MINOR}_d LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(QCA qca qcad LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(QWT qwt qwtd LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(QTKEYCHAIN qt5keychain qt5keychaind LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(QSCINTILLA qscintilla2_qt5 qscintilla2_qt5d LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
    list(APPEND QGIS_OPTIONS -DPoly2Tri_INCLUDE_DIR="${CURRENT_INSTALLED_DIR}/include/poly2tri")
    if("server" IN_LIST FEATURES)
        FIND_LIB_OPTIONS(FCGI libfcgi libfcgi LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
        list(APPEND QGIS_OPTIONS -DFCGI_INCLUDE_DIR="${CURRENT_INSTALLED_DIR}/include/fastcgi")
    endif()

    set(SPATIALINDEX_LIB_NAME spatialindex)
    if( VCPKG_TARGET_ARCHITECTURE STREQUAL "x64" OR VCPKG_TARGET_ARCHITECTURE STREQUAL "arm64" )
        set( SPATIALINDEX_LIB_NAME "spatialindex-64" )
    else()
        set( SPATIALINDEX_LIB_NAME "spatialindex-32" )
    endif()
    FIND_LIB_OPTIONS(SPATIALINDEX ${SPATIALINDEX_LIB_NAME} ${SPATIALINDEX_LIB_NAME}d LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})

    if("pdal" IN_LIST FEATURES)
        FIND_LIB_OPTIONS(ZSTD zstd zstdd LIBRARY ${VCPKG_TARGET_IMPORT_LIBRARY_SUFFIX})
        set(PDAL_CPP_LIBRARY_DEBUG "${CURRENT_INSTALLED_DIR}/debug/lib/pdalcpp.lib$$<SEMICOLON>ws2_32.lib")
        set(PDAL_CPP_LIBRARY_RELEASE "${CURRENT_INSTALLED_DIR}/lib/pdalcpp.lib$$<SEMICOLON>ws2_32.lib")
        list(APPEND QGIS_OPTIONS_DEBUG -DPDAL_CPP_LIBRARY=${PDAL_CPP_LIBRARY_DEBUG})
        list(APPEND QGIS_OPTIONS_RELEASE -DPDAL_CPP_LIBRARY=${PDAL_CPP_LIBRARY_RELEASE})
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
        COMMAND "${PYTHON_EXECUTABLE}" -m pip install sip PyQt5==${QT_VERSION} PyQt5-sip QScintilla==${QSCINTILLA_VERSION} PyQt3D==${QT_VERSION} ${PIP_MIRRORS}
        WORKING_DIRECTORY ${PYTHON3_PATH}
        LOGNAME pip
    )

    find_program(PYUIC5 pyuic5)
    if (NOT PYUIC5)
        INSTALL_PROGRAM(pyqt5-dev-tools)
    endif()

    find_program(PYRCC5 pyrcc5)

    set(VCPKG_DEVELOPMENT_WARNINGS OFF)
    list(APPEND QGIS_OPTIONS -DQT_LRELEASE_EXECUTABLE:FILEPATH=${CURRENT_INSTALLED_DIR}/tools/qt5-tools/bin/lrelease${VCPKG_TARGET_EXECUTABLE_SUFFIX})
    if("quick" IN_LIST FEATURES)
        list(APPEND QGIS_OPTIONS_DEBUG -DQMLPLUGINDUMP_EXECUTABLE:FILEPATH=${CURRENT_INSTALLED_DIR}/tools/qt5/debug/bin/qmlplugindump${VCPKG_TARGET_EXECUTABLE_SUFFIX})
        list(APPEND QGIS_OPTIONS_RELEASE -DQMLPLUGINDUMP_EXECUTABLE:FILEPATH=${CURRENT_INSTALLED_DIR}/tools/qt5-declarative/bin/qmlplugindump${VCPKG_TARGET_EXECUTABLE_SUFFIX})
    endif()
    list(APPEND QGIS_OPTIONS_DEBUG -DQt5_EXCLUDE_STATIC_DEPENDENCIES:BOOL=ON)

    list(APPEND QGIS_OPTIONS_DEBUG -DQT_INSTALL_LIBS:PATH=${CURRENT_INSTALLED_DIR}/debug/lib)
    list(APPEND QGIS_OPTIONS_RELEASE -DQT_INSTALL_LIBS:PATH=${CURRENT_INSTALLED_DIR}/lib)
    list(APPEND QGIS_OPTIONS -DGDAL_CONFIG=" ")
    list(APPEND QGIS_OPTIONS -DGDAL_INCLUDE_DIR:PATH=${CURRENT_INSTALLED_DIR}/include)
    FIND_LIB_OPTIONS(GDAL gdal gdal LIBRARY ${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX})
    list(APPEND QGIS_OPTIONS -DGEOS_CONFIG=" ")
    FIND_LIB_OPTIONS(GEOS geos geosd LIBRARY ${VCPKG_TARGET_STATIC_LIBRARY_SUFFIX})
    list(APPEND QGIS_OPTIONS -DGSL_CONFIG=" ")
    list(APPEND QGIS_OPTIONS -DGSL_INCLUDE_DIR:PATH=${CURRENT_INSTALLED_DIR}/include)
    list(APPEND QGIS_OPTIONS_DEBUG -DGSL_LIBRARIES:FILEPATH=${CURRENT_INSTALLED_DIR}/debug/lib/${VCPKG_TARGET_STATIC_LIBRARY_PREFIX}gsld${VCPKG_TARGET_STATIC_LIBRARY_SUFFIX};${CURRENT_INSTALLED_DIR}/debug/lib/${VCPKG_TARGET_STATIC_LIBRARY_PREFIX}gslcblasd${VCPKG_TARGET_STATIC_LIBRARY_SUFFIX})
    list(APPEND QGIS_OPTIONS_RELEASE -DGSL_LIBRARIES:FILEPATH="${CURRENT_INSTALLED_DIR}/lib/${VCPKG_TARGET_STATIC_LIBRARY_PREFIX}gsl${VCPKG_TARGET_STATIC_LIBRARY_SUFFIX} ${CURRENT_INSTALLED_DIR}/lib/${VCPKG_TARGET_STATIC_LIBRARY_PREFIX}gslcblas${VCPKG_TARGET_STATIC_LIBRARY_SUFFIX}")
    list(APPEND QGIS_OPTIONS -DPYTHON_INCLUDE_PATH:PATH=${CURRENT_INSTALLED_DIR}/include/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}m)
    FIND_LIB_OPTIONS(PYTHON python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR} python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}d LIBRARY ${VCPKG_TARGET_STATIC_LIBRARY_SUFFIX})
    FIND_LIB_OPTIONS(QTKEYCHAIN qt5keychain qt5keychaind LIBRARY  ${VCPKG_TARGET_STATIC_LIBRARY_SUFFIX})
    if("server" IN_LIST FEATURES)
        FIND_LIB_OPTIONS(FCGI fcgi fcgi LIBRARY ${VCPKG_TARGET_SHARED_LIBRARY_SUFFIX})
        list(APPEND QGIS_OPTIONS -DFCGI_INCLUDE_DIR="${CURRENT_INSTALLED_DIR}/include/fastcgi")
    endif()

    FIND_LIB_OPTIONS(SPATIALINDEX spatialindex spatialindexd LIBRARY ${VCPKG_TARGET_STATIC_LIBRARY_SUFFIX})
else() # Other build system
  message(FATAL_ERROR "Unsupport build system.")
endif()

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    #PREFER_NINJA
    OPTIONS ${QGIS_OPTIONS} 
    OPTIONS_DEBUG ${QGIS_OPTIONS_DEBUG}
    OPTIONS_RELEASE ${QGIS_OPTIONS_RELEASE}
)

vcpkg_install_cmake()
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

file(GLOB INCLUDE_FILES "${CURRENT_PACKAGES_DIR}/include/*.h")
if(INCLUDE_FILES)
    file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/include/${PORT}")
    file(COPY ${INCLUDE_FILES} DESTINATION "${CURRENT_PACKAGES_DIR}/include/${PORT}")
    file(REMOVE_RECURSE ${INCLUDE_FILES})
endif()

file(REMOVE_RECURSE
    ${CURRENT_PACKAGES_DIR}/debug/include
)

# Handle copyright
file(INSTALL ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)
