# Declare a named external dependency for download with vcpkg_from_git,
# and validate against upstream's DEPS.
function(declare_external_from_git name)
    cmake_parse_arguments(PARSE_ARGV 1 arg "" "URL;REF;LICENSE_FILE" "")
    if(NOT arg_URL OR NOT arg_REF OR NOT arg_LICENSE_FILE)
        message(FATAL_ERROR "Arguments URL, REF and LICENSE_FILE are required.")
    endif()
    set(actual "${arg_URL}@${arg_REF}")
    file(STRINGS "${SOURCE_PATH}/DEPS" upstream REGEX "\"third_party/externals/${name}\"")
    string(REPLACE "https://chromium.googlesource.com/external/github.com" "https://github.com" upstream "${upstream}")
    string(REPLACE "https://skia.googlesource.com/external/github.com" "https://github.com" upstream "${upstream}")
    string(FIND "${upstream}" "${arg_URL}@${arg_REF}" pos)
    if(pos STREQUAL "-1")
        string(REGEX REPLACE "^[^:]*:  *" "" upstream "${upstream}")
        message(WARNING "Dependency ${name} diverges from upstream. Upstream: ${upstream} Actual: \"${actual}\"")
    endif()
    set(skia_external_license_${name} "${arg_LICENSE_FILE}" PARENT_SCOPE)
    list(REMOVE_ITEM ARGN "LICENSE_FILE" "${arg_LICENSE_FILE}")
    set(skia_external_git_${name} "${ARGN}" PARENT_SCOPE)
endfunction()

# Declare a named external dependencies to be resolved via pkgconfig.
function(declare_external_from_pkgconfig name)
    set(skia_external_pkgconfig_${name} "${ARGN}" PARENT_SCOPE)
endfunction()

# Declare a named external dependencies to be resolved via vcpkg installed tree.
function(declare_external_from_vcpkg name)
    set(skia_external_vcpkg_${name} "${ARGN}" PARENT_SCOPE)
endfunction()

# Download and integrate named external dependencies.
# Downlods must be handled before vcpkg in order to support --only-downloads mode.
function(get_externals)
    set(licenses_dir "${SOURCE_PATH}/third_party_licenses")
    file(REMOVE_RECURSE "${licenses_dir}")
    file(MAKE_DIRECTORY "${licenses_dir}")

    list(REMOVE_DUPLICATES ARGN)
    set(from_git "")
    set(from_pkgconfig "")
    set(from_vcpkg "")
    foreach(name IN LISTS ARGN)
        if(DEFINED "skia_external_git_${name}")
            list(APPEND from_git "${name}")
        elseif(DEFINED "skia_external_pkgconfig_${name}")
            list(APPEND from_pkgconfig "${name}")
        elseif(DEFINED "skia_external_vcpkg_${name}")
            list(APPEND from_vcpkg "${name}")
        else()
            message(FATAL_ERROR "Unknown external dependency '${name}'")
        endif()
    endforeach()
    foreach(name IN LISTS from_git)
        set(dir "third_party/externals/${name}")
        if(EXISTS "${SOURCE_PATH}/${dir}")
            message(STATUS "Using existing ${dir}")
            continue()
        endif()
        message(STATUS "Creating ${dir}")
        file(MAKE_DIRECTORY "${SOURCE_PATH}/third_party/externals")
        if("${name}" STREQUAL "sfntly")
             message(STATUS "name: ${name}")
             message(STATUS "staging_dir: ${staging_dir}")
             message(STATUS "skia_external_git_: ${skia_external_git_${name}}")
           #  vcpkg_from_git(
           #     OUT_SOURCE_PATH staging_dir
           #     ${skia_external_git_${name}}
           # )
             vcpkg_from_github(
                 OUT_SOURCE_PATH staging_dir
                 REPO "googlefonts/sfntly"
                 REF  "b55ff303ea2f9e26702b514cf6a3196a2e3e2974"
                 SHA512 "9be54aa7c6661ca96773754767e9eb18f5cd19f8589065fab109f41bf57852c1d2d915ed6177eefda11d19b2e72acb3cb2432540ace23434d719b92b7b12f5ff"
             )
        else()
            vcpkg_from_git(
                OUT_SOURCE_PATH staging_dir
                ${skia_external_git_${name}}
            )
        endif()
        file(RENAME "${staging_dir}" "${SOURCE_PATH}/${dir}")

        set(license_file "${SOURCE_PATH}/${dir}/${skia_external_license_${name}}")
        cmake_path(GET license_file FILENAME filename)
        file(COPY_FILE "${license_file}" "${licenses_dir}/## ${name} ${filename}")
    endforeach()
    foreach(name IN LISTS from_pkgconfig)
        third_party_from_pkgconfig("${name}" ${skia_external_pkgconfig_${name}})
    endforeach()
    foreach(name IN LISTS from_vcpkg)
        third_party_from_vcpkg("${name}" ${skia_external_vcpkg_${name}})
    endforeach()
endfunction()

# Setup a third-party dependency from pkg-config data
function(third_party_from_pkgconfig gn_group)
    cmake_parse_arguments(PARSE_ARGV 1 arg "" "PATH" "DEFINES;MODULES")
    if(NOT arg_PATH)
        set(arg_PATH "third_party/${gn_group}")
    endif()
    if(NOT arg_MODULES)
        set(arg_MODULES "${gn_group}")
    endif()
    if(arg_UNPARSED_ARGUMENTS)
        message(FATAL_ERROR "Unparsed arguments: ${arg_UNPARSED_ARGUMENTS}")
    endif()
    x_vcpkg_pkgconfig_get_modules(PREFIX PC_${module} MODULES ${arg_MODULES} CFLAGS LIBS)
    foreach(config IN ITEMS DEBUG RELEASE)
        separate_arguments(cflags UNIX_COMMAND "${PC_${module}_CFLAGS_${config}}")
        set(defines "${cflags}")
        list(FILTER defines INCLUDE REGEX "^-D" )
        list(TRANSFORM defines REPLACE "^-D" "")
        list(APPEND defines ${arg_DEFINES})
        set(include_dirs "${cflags}")
        list(FILTER include_dirs INCLUDE REGEX "^-I" )
        list(TRANSFORM include_dirs REPLACE "^-I" "")
        separate_arguments(libs UNIX_COMMAND "${PC_${module}_LIBS_${config}}")
        set(lib_dirs "${libs}")
        list(FILTER lib_dirs INCLUDE REGEX "^-L" )
        list(TRANSFORM lib_dirs REPLACE "^-L" "")
        # Passing link libraries via ldflags, cf. third-party.gn.in
        set(ldflags "${libs}")
        list(FILTER ldflags INCLUDE REGEX "^-l" )
        if(VCPKG_TARGET_IS_WINDOWS AND NOT VCPKG_TARGET_IS_MINGW)
            list(TRANSFORM ldflags REPLACE "^-l" "")
            list(TRANSFORM ldflags APPEND ".lib")
        endif()
        set(GN_OUT_${config} "")
        foreach(item IN ITEMS defines include_dirs lib_dirs ldflags)
            set("gn_${item}_${config}" "")
            if(NOT "${${item}}" STREQUAL "")
                list(JOIN ${item} [[", "]] list)
                set("gn_${item}_${config}" "\"${list}\"")
            endif()
        endforeach()
    endforeach()
    configure_file("${CMAKE_CURRENT_LIST_DIR}/third-party.gn.in" "${SOURCE_PATH}/${arg_PATH}/BUILD.gn" @ONLY)
endfunction()

# Setup a third-party dependency from vcpkg installed tree
function(third_party_from_vcpkg gn_group)
    cmake_parse_arguments(PARSE_ARGV 1 arg "" "PATH" "")
    if(NOT arg_PATH)
        set(arg_PATH "third_party/${gn_group}")
    endif()
    if(arg_UNPARSED_ARGUMENTS)
        message(FATAL_ERROR "Unparsed arguments: ${arg_UNPARSED_ARGUMENTS}")
    endif()
    set(defines "")
    set(include_dirs "${CURRENT_INSTALLED_DIR}/include")
    set(libdirs_RELEASE "${CURRENT_INSTALLED_DIR}/lib")
    set(libdirs_DEBUG "${CURRENT_INSTALLED_DIR}/lib/debug")
    set(ldflags "")
    foreach(config IN ITEMS DEBUG RELEASE)
        set(lib_dirs "${libdirs_${config}}")
        set(GN_OUT_${config} "")
        foreach(item IN ITEMS defines include_dirs lib_dirs ldflags)
            set("gn_${item}_${config}" "")
            if(NOT "${${item}}" STREQUAL "")
                list(JOIN ${item} [[", "]] list)
                set("gn_${item}_${config}" "\"${list}\"")
            endif()
        endforeach()
    endforeach()
    configure_file("${CMAKE_CURRENT_LIST_DIR}/third-party.gn.in" "${SOURCE_PATH}/${arg_PATH}/BUILD.gn" @ONLY)
endfunction()

# Turn a space separated string into a gn list:
# "a b c" -> ["a","b","c"]
function(string_to_gn_list out_var input)
    separate_arguments(list UNIX_COMMAND "${input}")
    if(NOT list STREQUAL "")
        list(JOIN list [[","]] temp)
        set(list "\"${temp}\"")
    endif()
    set("${out_var}" "[${list}]" PARENT_SCOPE)
endfunction()

# Remove all empty directories.
function(auto_clean dir)
    file(GLOB entries "${dir}/*")
    file(GLOB files LIST_DIRECTORIES false "${dir}/*")
    foreach(entry IN LISTS entries)
        if(entry IN_LIST files)
            continue()
        endif()
        file(GLOB_RECURSE children "${entry}/*")
        if(children)
            auto_clean("${entry}")
        else()
            file(REMOVE_RECURSE "${entry}")
        endif()
    endforeach()
endfunction()

function(list_from_json out_var json) # <path>
    vcpkg_list(SET list)
    string(JSON array ERROR_VARIABLE error GET "${json}" ${ARGN})
    if(NOT error)
        string(JSON len ERROR_VARIABLE error LENGTH "${array}")
        if(NOT error AND NOT len STREQUAL "0")
            math(EXPR last "${len} - 1")
            foreach(i RANGE "${last}")
                string(JSON item GET "${array}" "${i}")
                vcpkg_list(APPEND list "${item}")
            endforeach()
        endif()
    endif()
    set("${out_var}" "${list}" PARENT_SCOPE)
endfunction()

# Expand gn targets for installable components.
function(expand_gn_targets targets_var desc_var source_path)
    set(expand_gn_targets_components "")
    set(expand_gn_targets_visited "")
    foreach(gn_target IN LISTS "${targets_var}")
        expand_gn_targets_recurse("${gn_target}" "${desc_var}" "${source_path}")
    endforeach()
    set("${targets_var}" "${expand_gn_targets_components}" PARENT_SCOPE)
endfunction()

# Private helper for expand_gn_targets.
function(expand_gn_targets_recurse gn_target desc_var source_path)
    # shortcuts
    if(gn_target IN_LIST expand_gn_targets_components)
        return()
    elseif(gn_target IN_LIST expand_gn_targets_visited)
        return()
    endif()
    list(APPEND expand_gn_targets_visited "${gn_target}")

    # current target
    set(recurse 1)
    string(JSON current_json GET "${${desc_var}}" "${gn_target}")
    string(JSON target_type GET "${current_json}" "type")
    if(target_type STREQUAL "static_library" AND VCPKG_LIBRARY_LINKAGE STREQUAL "static")
        string(REGEX REPLACE "^//([^:]*):(.*)\$" "${source_path}/\\1/BUILD.gn" build_gn_file "${gn_target}")
        if(EXISTS "${build_gn_file}")
            # skia's third-party "dawn_component" creates separate _shared/_static libs.
            string(REGEX REPLACE "^(.*)(_static|_shared)\$" "(\\1\\2|\\1)" name_pattern "${CMAKE_MATCH_2}")
            file(STRINGS "${build_gn_file}" maybe_component REGEX "component[(]\"${name_pattern}\"[)]")
            if(NOT maybe_component STREQUAL "")
                list(APPEND expand_gn_targets_components "${gn_target}")
            endif()
        else()
            message(WARNING "No ${build_gn_file}")
        endif()
    elseif(target_type MATCHES "^(executable|loadable_module|shared_library)\$")
        list(APPEND expand_gn_targets_components "${gn_target}")
    elseif(NOT target_type MATCHES "^(group|source_set)\$")
        set(recurse 0)
    endif()

    if(recurse)
        list_from_json(deps "${current_json}" "deps")
        foreach(dep IN LISTS deps)
            expand_gn_targets_recurse("${dep}" "${desc_var}" "${source_path}")
        endforeach()
    endif()

    set(expand_gn_targets_components "${expand_gn_targets_components}" PARENT_SCOPE)
    set(expand_gn_targets_visited "${expand_gn_targets_visited}" PARENT_SCOPE)
endfunction()

# Provide a cmake target name (w/o namespace) in out_var
function(get_cmake_target out_var gn_target)
    if(gn_target MATCHES "/([^:/]+):")
        string(REPLACE "/${CMAKE_MATCH_1}:${CMAKE_MATCH_1}" "/${CMAKE_MATCH_1}" gn_target "${gn_target}")
    endif()
    string(REGEX REPLACE "[:/]+" "::" target "unofficial/${PORT}${gn_target}")
    set("${out_var}" "${target}" PARENT_SCOPE)
endfunction()

# Put the target's SK_<...> definitions in out_var
function(get_definitions out_var desc_json target)
    list_from_json(output "${desc_json}" "${target}" "defines")
    list(FILTER output INCLUDE REGEX "^SK_")
    set("${out_var}" "${output}" PARENT_SCOPE)
endfunction()

# Put the target's link libraries in out_var
function(get_link_libs out_var desc_json target)
    # We don't pass this variable explicitly now.
    separate_arguments(known_standard_libraries NATIVE_COMMAND "${VCPKG_DETECTED_CMAKE_CXX_STANDARD_LIBRARIES}")
    # From ldflags, we only want lib names or filepaths (cf. declare_external_from_pkgconfig)
    list_from_json(ldflags "${desc_json}" "${target}" "ldflags")
    string(REPLACE "-isysroot;" "-isysroot " ldflags "${ldflags}")
    if(VCPKG_TARGET_IS_WINDOWS AND NOT VCPKG_TARGET_IS_MINGW)
        list(FILTER ldflags INCLUDE REGEX "[.]lib\$")
    else()
        list(FILTER ldflags INCLUDE REGEX "^-l|^/")
    endif()
    list(TRANSFORM ldflags REPLACE "^-l" "")
    list_from_json(libs "${desc_json}" "${target}" "libs")
    vcpkg_list(SET frameworks)
    if(VCPKG_TARGET_IS_OSX OR VCPKG_TARGET_IS_IOS)
        list_from_json(frameworks "${desc_json}" "${target}" "frameworks")
        list(TRANSFORM frameworks REPLACE "^(.*)[.]framework\$" "-framework \\1")
    endif()
    vcpkg_list(SET output)
    foreach(lib IN LISTS frameworks ldflags libs)
        if(VCPKG_TARGET_IS_WINDOWS)
            string(TOLOWER "${lib}" lib_key)
        else()
            set(lib_key "{lib}")
        endif()
        if(lib_key IN_LIST known_standard_libraries)
            continue()
        endif()
        string(REPLACE "${CURRENT_INSTALLED_DIR}" "\${z_vcpkg_${PORT}_root}" lib "${lib}")
        string(REPLACE "${CURRENT_PACKAGES_DIR}" "\${z_vcpkg_${PORT}_root}" lib "${lib}")
        if(NOT lib MATCHES "^-L")
            vcpkg_list(REMOVE_ITEM output "${lib}")
        endif()
        vcpkg_list(APPEND output "${lib}")
    endforeach()
    set("${out_var}" "${output}" PARENT_SCOPE)
endfunction()

# A revised variant of vcpkg_gn_install
function(skia_gn_install_build_type)
    cmake_parse_arguments(PARSE_ARGV 0 "arg" "" "BUILD_TYPE;SOURCE_PATH;INSTALL_DIR;LABEL" "TARGETS")
    if(DEFINED arg_UNPARSED_ARGUMENTS)
        message(FATAL_ERROR "Internal error: skia_gn_install_build_type was passed extra arguments: ${arg_UNPARSED_ARGUMENTS}")
    endif()

    set(build_dir "${CURRENT_BUILDTREES_DIR}/${arg_LABEL}")

    # `gn desc json` output is dual-use: logging (early) and further processing
    # Cf. https://github.com/universeroc/gn/blob/master/docs/reference.md#desc
    vcpkg_find_acquire_program(GN)
    vcpkg_execute_required_process(
        COMMAND "${GN}" desc --format=json --all --testonly=false "${build_dir}" "*"
        WORKING_DIRECTORY "${arg_SOURCE_PATH}"
        LOGNAME "desc-${arg_LABEL}"
    )

    # build
    set(VCPKG_BUILD_TYPE "${arg_BUILD_TYPE}")
    vcpkg_build_ninja(TARGETS ${arg_TARGETS})

    # install and export
    set(logfile "${CURRENT_BUILDTREES_DIR}/install-${arg_LABEL}.log")
    file(WRITE "${logfile}" "")
    message(STATUS "Installing (${arg_LABEL})...")

    file(MAKE_DIRECTORY "${arg_INSTALL_DIR}/share/unofficial-${PORT}")

    list(TRANSFORM arg_TARGETS PREPEND "//")
    file(READ "${CURRENT_BUILDTREES_DIR}/desc-${arg_LABEL}-out.log" desc)
    string(REGEX REPLACE "^([^{]+)\n{\n" "{\n" desc "${desc}")
    if(NOT "${CMAKE_MATCH_1}" STREQUAL "")
        message(STATUS "${CMAKE_MATCH_1}")
    endif()
    expand_gn_targets(arg_TARGETS desc "${arg_SOURCE_PATH}")

    string(TOUPPER "${arg_BUILD_TYPE}" cmake_build_type)
    set(cmake_config_genex [[\$<NOT:\$<CONFIG:DEBUG>>]])
    if(cmake_build_type STREQUAL "DEBUG")
        set(cmake_config_genex [[\$<CONFIG:DEBUG>]])
    endif()

    foreach(gn_target IN LISTS arg_TARGETS)
        get_cmake_target(cmake_target "${gn_target}")
        set(add_target "add_library(${cmake_target} INTERFACE IMPORTED)")
        set(has_location "0")
        set(imported_location "")
        set(not_executable "1")
        string(JSON target_type GET "${desc}" "${gn_target}" "type")

        set(link_language "C")
        string(JSON sources ERROR_VARIABLE unused GET "${desc}" "${gn_target}" "sources")
        if(sources MATCHES "[.]cxx|[.]cpp")
            set(link_language "CXX")
        endif()

        list_from_json(outputs "${desc}" "${gn_target}" "outputs")
        foreach(output IN LISTS outputs)
            if(CMAKE_HOST_WIN32)
                # absolute path (e.g. /C:/path/to/target.lib)
                string(REGEX REPLACE "^/([^/]:)" "\\1" output "${output}")
            endif()
            # relative path (e.g. //out/Release/target.lib)
            string(REGEX REPLACE "^//" "${arg_SOURCE_PATH}/" output "${output}")

            cmake_path(GET output FILENAME filename)
            set(add_target "add_library(${cmake_target} UNKNOWN IMPORTED)")
            set(destination "${arg_INSTALL_DIR}/lib")
            set(has_location "1")
            if(target_type STREQUAL "executable")
                set(add_target "add_executable(${cmake_target} IMPORTED)")
                set(destination "${arg_INSTALL_DIR}/tools/${PORT}")
                set(imported_location "${destination}/${filename}")
                set(not_executable "0")
            elseif(filename MATCHES "\\.(dll|pdb)\$")
                if(CMAKE_MATCH_1 STREQUAL "pdb" AND NOT EXISTS "${output}")
                    continue()
                endif()
                set(destination "${arg_INSTALL_DIR}/bin")
                # Do not set (overwrite) imported_location
            else()
                set(imported_location "${destination}/${filename}")
            endif()
            # output artifact installation
            file(APPEND "${logfile}" "Installing: ${destination}/${filename}\n")
            file(COPY "${output}" DESTINATION "${destination}")
        endforeach()

        # CMake target properties
        string(REPLACE "::" "-" basename "${cmake_target}")
        get_definitions(interface_compile_definitions "${desc}" "${gn_target}")
        get_link_libs(interface_link_libs "${desc}" "${gn_target}")
        set(interface_link_targets "")
        list_from_json(deps "${desc}" "${gn_target}" "deps")
        foreach(dep IN LISTS deps)
            if(dep IN_LIST arg_TARGETS)
                get_cmake_target(cmake_dep "${dep}")
                list(APPEND interface_link_targets "${cmake_dep}")
            endif()
        endforeach()
        file(APPEND "${logfile}" "Installing: ${arg_INSTALL_DIR}/share/unofficial-${PORT}/${basename}-targets.cmake\n")
        configure_file("${CMAKE_CURRENT_LIST_DIR}/unofficial-${PORT}-targets.cmake" "${arg_INSTALL_DIR}/share/unofficial-${PORT}/${basename}-targets.cmake" @ONLY)
        file(APPEND "${logfile}" "Installing: ${arg_INSTALL_DIR}/share/unofficial-${PORT}/${basename}-targets-${arg_BUILD_TYPE}.cmake\n")
        configure_file("${CMAKE_CURRENT_LIST_DIR}/unofficial-${PORT}-targets-details.cmake" "${arg_INSTALL_DIR}/share/unofficial-${PORT}/${basename}-targets-${arg_BUILD_TYPE}.cmake" @ONLY)
    endforeach()

    # Main CMake config file
    file(APPEND "${logfile}" "Installing: ${arg_INSTALL_DIR}/share/unofficial-${PORT}/unofficial-${PORT}-config.cmake\n")
    configure_file("${CMAKE_CURRENT_LIST_DIR}/unofficial-${PORT}-config.cmake" "${arg_INSTALL_DIR}/share/unofficial-${PORT}/unofficial-${PORT}-config.cmake" @ONLY)
endfunction()

# A revised variant of vcpkg_gn_install
function(skia_gn_install)
    cmake_parse_arguments(PARSE_ARGV 0 arg "" "SOURCE_PATH" "TARGETS")

    if(DEFINED arg_UNPARSED_ARGUMENTS)
        message(WARNING "vcpkg_gn_install was passed extra arguments: ${arg_UNPARSED_ARGUMENTS}")
    endif()
    if(NOT DEFINED arg_SOURCE_PATH)
        message(FATAL_ERROR "SOURCE_PATH must be specified.")
    endif()

    set(auto_clean_debug_share TRUE)
    if(NOT DEFINED VCPKG_BUILD_TYPE OR VCPKG_BUILD_TYPE STREQUAL "debug")
        if(EXISTS "${CURRENT_PACKAGES_DIR}/debug/share")
            set(auto_clean_debug_share FALSE)
        endif()
        skia_gn_install_build_type(
            BUILD_TYPE debug
            LABEL "${TARGET_TRIPLET}-dbg"
            SOURCE_PATH "${arg_SOURCE_PATH}"
            INSTALL_DIR "${CURRENT_PACKAGES_DIR}/debug"
            TARGETS ${arg_TARGETS}
        )
    endif()

    if(NOT DEFINED VCPKG_BUILD_TYPE OR VCPKG_BUILD_TYPE STREQUAL "release")
        skia_gn_install_build_type(
            BUILD_TYPE release
            LABEL "${TARGET_TRIPLET}-rel"
            SOURCE_PATH "${arg_SOURCE_PATH}"
            INSTALL_DIR "${CURRENT_PACKAGES_DIR}"
            TARGETS ${arg_TARGETS}
        )
    endif()

    vcpkg_cmake_config_fixup(PACKAGE_NAME "unofficial-${PORT}")
    if(auto_clean_debug_share)
        file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
    endif()
endfunction()
