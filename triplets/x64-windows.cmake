set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE dynamic)
set(VCPRG_PLATEORM_TOOLSET v142)

# 不支持以下设置的有 lapack-reference(已修复)  pdal(已修复) hailde(已修复) qt5-base qt5-declarative qt5-webengine 
# set(VCPKG_C_FLAGS "${VCPKG_C_FLAGS} /D_WIN32_WINNT=0x0601 /DWINVER=0x0601")
# set(VCPKG_CXX_FLAGS "${VCPKG_CXX_FLAGS} /D_WIN32_WINNT=0x0601 /DWINVER=0x0601")

