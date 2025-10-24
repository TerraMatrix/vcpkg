if(CMAKE_HOST_WIN32)
    set(program_name python)
    set(program_version 3.9.6)
    if(DEFINED ENV{PROCESSOR_ARCHITEW6432})
        set(build_arch $ENV{PROCESSOR_ARCHITEW6432})
    else()
        set(build_arch $ENV{PROCESSOR_ARCHITECTURE})
    endif()
    if(build_arch MATCHES "^(ARM|arm)64$")
        set(tool_subdirectory "python-${program_version}-arm64")
        # https://www.python.org/ftp/python/3.12.7/python-3.12.7-embed-arm64.zip
        set(download_urls "https://www.python.org/ftp/python/${program_version}/python-${program_version}-embed-arm64.zip")
        set(download_filename "python-${program_version}-embed-arm64.zip")
        set(download_sha512 f8946471ed7dbc8cbffc72298f99330794b127ce6aa60abc87e80b31bd26099a2f637db85af88ce78c06dcf6e19064184ef3768edf4b1a0f97c25898e379d121)
    elseif(build_arch MATCHES "(amd|AMD)64")
        set(tool_subdirectory "python-${program_version}-x64")
        # https://www.python.org/ftp/python/3.12.7/python-3.12.7-embed-amd64.zip change to
        # https://raw.githubusercontent.com/adang1345/PythonWin7/master/3.12.7/python-3.12.7-embed-amd64.zip
        set(download_urls "https://www.python.org/ftp/python/${PYTHON_VERSION}/python-${PYTHON_VERSION}-embed-amd64.zip")
        set(download_filename "python-${program_version}-embed-amd64.zip")
        set(download_sha512 f8946471ed7dbc8cbffc72298f99330794b127ce6aa60abc87e80b31bd26099a2f637db85af88ce78c06dcf6e19064184ef3768edf4b1a0f97c25898e379d121)
    else()
        set(tool_subdirectory "python-${program_version}-x86")
        # https://www.python.org/ftp/python/3.12.7/python-3.12.7-embed-win32.zip
        set(download_urls "https://www.python.org/ftp/python/${PYTHON_VERSION}/python-${PYTHON_VERSION}-embed-win32.zip")
        set(download_filename "python-${program_version}-embed-win32.zip")
        set(download_sha512 47bf00e4de74f33fe3d0c4f97773b221cf78c29f02257f43368f0414c88be1bdffc914e4e6516870c23cba84f4618edb8fe5a3ee43e41f492d812a90d93c1ea8)
    endif()

    set(paths_to_search "${DOWNLOADS}/tools/python/${tool_subdirectory}")

    # We want to be able to import stuff from outside of this embeddable package.
    # https://docs.python.org/3/library/sys_path_init.html#pth-files
    string(REGEX MATCH "^3\\.[0-9]+" _python_version_plain "${program_version}")
    string(REPLACE "." "" _python_version_plain "${_python_version_plain}")
    vcpkg_list(SET post_install_command "${CMAKE_COMMAND}" -E rm "python${_python_version_plain}._pth")
else()
    set(program_name python3)
    set(brew_package_name "python")
    set(apt_package_name "python3")
endif()
