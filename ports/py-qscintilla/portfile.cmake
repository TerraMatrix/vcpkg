vcpkg_minimum_required(VERSION 2023-06-15)

set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_execute_build_process(
    COMMAND "${CURRENT_HOST_INSTALLED_DIR}/tools/python3/python${VCPKG_HOST_EXECUTABLE_SUFFIX}"
        -m pip install
        --no-deps
        --no-compile
        --no-cache-dir
        --target "${CURRENT_PACKAGES_DIR}/lib/python${VCPKG_PYTHON_VERSION_MAJOR}/site-packages"
        QScintilla==2.14.1
    WORKING_DIRECTORY "${CURRENT_PACKAGES_DIR}"
    LOGNAME "install-qscintilla"
)

vcpkg_execute_build_process(
    COMMAND "${CURRENT_HOST_INSTALLED_DIR}/tools/python3/python${VCPKG_HOST_EXECUTABLE_SUFFIX}"
        -c "import Qsci; print('QScintilla imported successfully')"
    WORKING_DIRECTORY "${CURRENT_PACKAGES_DIR}"
    LOGNAME "test-qscintilla-import"
)