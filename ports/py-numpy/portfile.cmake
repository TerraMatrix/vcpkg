vcpkg_minimum_required(VERSION 2023-06-15)

set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_execute_build_process(
    COMMAND "${CURRENT_HOST_INSTALLED_DIR}/tools/python3/python${VCPKG_HOST_EXECUTABLE_SUFFIX}"
        -m pip install
        --no-deps
        --no-compile
        --no-cache-dir
        --target "${CURRENT_PACKAGES_DIR}/lib/python${VCPKG_PYTHON_VERSION_MAJOR}/site-packages"
        numpy==1.26.4
    WORKING_DIRECTORY "${CURRENT_PACKAGES_DIR}"
    LOGNAME "install-numpy"
)

vcpkg_execute_build_process(
    COMMAND "${CURRENT_HOST_INSTALLED_DIR}/tools/python3/python${VCPKG_HOST_EXECUTABLE_SUFFIX}"
        -c "import numpy as np; print(f'numpy {np.__version__} imported successfully')"
    WORKING_DIRECTORY "${CURRENT_PACKAGES_DIR}"
    LOGNAME "test-numpy-import"
)