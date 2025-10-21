file(INSTALL
    "${CMAKE_CURRENT_LIST_DIR}/vcpkg_qmake_configure.cmake"
    "${CMAKE_CURRENT_LIST_DIR}/vcpkg_qmake_build.cmake"
    "${CMAKE_CURRENT_LIST_DIR}/vcpkg_qmake_install.cmake"
    "${CMAKE_CURRENT_LIST_DIR}/z_vcpkg_qmake_fix_makefiles.cmake"
    "${CMAKE_CURRENT_LIST_DIR}/vcpkg-port-config.cmake"
    DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

if("qt6" IN_LIST FEATURES)
    set(QT_VER qt6)
else()
    set(QT_VER qt5)
endif()

set(REP_FILES "${CURRENT_PACKAGES_DIR}/share/${PORT}/vcpkg_qmake_configure.cmake" "${CURRENT_PACKAGES_DIR}/share/${PORT}/vcpkg_qmake_install.cmake")
foreach(REP_FILE IN LISTS REP_FILES)
    file(READ "${REP_FILE}" _contents)
    string(TOUPPER ${QT_VER} TOUPPER_QT_VER)
    string(REPLACE "TOUPPER_QT_VER" "${TOUPPER_QT_VER}" _contents "${_contents}")
    string(REPLACE "QT_VER" "${QT_VER}" _contents "${_contents}")
    file(WRITE "${REP_FILE}" "${_contents}")
endforeach()

file(INSTALL "${VCPKG_ROOT_DIR}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
set(VCPKG_POLICY_CMAKE_HELPER_PORT enabled)
