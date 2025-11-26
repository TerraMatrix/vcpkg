# QGIS vcpkg Port - Latest Version

This port provides QGIS (Quantum GIS), a free and open-source Geographic Information System (GIS), based on the official vcpkg configuration from QGIS GitHub repository.

## Version Information

- **QGIS Version**: 3.44.5 (latest LTR release)
- **Python Version**: 3.11+
- **Supported Platforms**:
  - Windows 10+ (x64 & arm64)
  - Linux ARM64
- **Based on**: QGIS final-3_44_5 release
- **Qt Support**: Qt6 (optimized for modern systems)
- **Source**: Official QGIS vcpkg configuration with cross-platform enhancements

## Dependencies

### Core Dependencies (from official QGIS vcpkg.json)
- **Qt6**: qtbase, qtkeychain-qt6, qtlocation, qtsvg, qttools
- **Data Processing**: gdal (with freexl, kea, poppler)
- **Geometry**: geos, proj, libspatialindex, libspatialite
- **Compression**: zlib, meshoptimizer
- **Serialization**: nlohmann-json, protobuf, libxml2, libzip, expat
- **Security**: qca (with OpenSSL), exiv2 (with XMP)
- **Scientific**: gsl (GNU Scientific Library)
- **Additional**: jhasse-poly2tri, o2, pdal, libpq
- **Platform-specific**: libtasn1 (for iOS/macOS)

### Key Changes from Extended Version
- Streamlined to match official QGIS project configuration
- Removed experimental features (arrow-adbc, parquet, duckdb)
- Focused on stable and well-supported dependencies
- Added official `quick` feature for mobile interfaces
- Maintained enhanced Python bindings with py-urllib3

### Optional Features (from official QGIS project)

- `3d`: Enable 3D visualization capabilities (requires qt3d)
- `server`: Build QGIS Server components (requires fastcgi)
- `bindings`: Build Python bindings with comprehensive Python package support
- `gui`: Build GUI components (requires qscintilla, qtmultimedia, qwt)
- `opencl`: Add OpenCL support for accelerated processing
- `pdal`: Build with PDAL point cloud processing support (LiDAR data handling)
- `debug-tools`: Build with QGIS developer and debugging tools (Debug build)
- `quick`: Build QGIS quick components for mobile interfaces (requires qtdeclarative, qtquickcontrols2)

### Python Bindings (Optimized)

The `bindings` feature includes essential Python support:
- **Core packages**: py-numpy (numerical computing)
- **QGIS-specific**: py-qscintilla (code editing), py-pyqt6 (Qt6 GUI toolkit)
- **Python Environment**: python3 (core Python runtime)
- **Additional packages**: Additional Python packages are installed automatically by QGIS's build system

## Platform-Specific Installation

### Windows 10+ (x64 & ARM64)
```bash
# Basic installation
vcpkg install qgis[gui]

# Full-featured installation (recommended)
vcpkg install qgis[gui,3d,bindings,opencl,pdal,quick]

# With all features
vcpkg install qgis[gui,3d,server,bindings,opencl,pdal,quick]

# Debug build (development)
vcpkg install qgis[gui,bindings,debug-tools]

# Point cloud processing focus
vcpkg install qgis[gui,bindings,pdal]
```

### Linux ARM64
```bash
# Set target triplet for ARM64 Linux
export VCPKG_TARGET_TRIPLET=arm64-linux

# Basic installation
vcpkg install qgis[gui]

# Full-featured installation (recommended)
vcpkg install qgis[gui,3d,bindings,opencl,pdal,quick]

# Server installation
vcpkg install qgis[server,bindings]

# Debug build (development)
vcpkg install qgis[gui,bindings,debug-tools]

# Point cloud processing focus
vcpkg install qgis[gui,bindings,pdal]
```

## Installation Examples

### Server Installation
```bash
vcpkg install qgis[server,oracle,sfcgal]
```

### Python Bindings (Complete)
```bash
vcpkg install qgis[bindings,gui,3d]
```

### Minimal Installation
```bash
vcpkg install qgis
```

### Installation with All Official Features
```bash
vcpkg install qgis[gui,3d,server,bindings,opencl,quick]
```

### Installation with Enhanced Python Support
```bash
vcpkg install qgis[gui,bindings]
# This includes all Python packages: py-urllib3, py-numpy, py-pyqt6, py-shapely, etc.
```

## Usage in CMake Projects

Add to your CMakeLists.txt:

```cmake
find_package(Qgis REQUIRED)

# For core functionality only
target_link_libraries(myapp PRIVATE Qgis::core)

# For GUI applications
target_link_libraries(myapp PRIVATE Qgis::core Qgis::gui)

# For analysis tools
target_link_libraries(myapp PRIVATE Qgis::core Qgis::analysis)

# For full desktop application
target_link_libraries(myapp PRIVATE Qgis::core Qgis::gui Qgis::analysis)
```

Configure with:
```bash
cmake -DCMAKE_TOOLCHAIN_FILE=/path/to/vcpkg/scripts/buildsystems/vcpkg.cmake ...
```

## Known Limitations

1. **Platform Support**: Optimized for Windows 10 x64/arm64. Linux/macOS may need additional configuration.
2. **Memory Requirements**: QGIS is a large project with many dependencies. Ensure sufficient RAM (16GB+ recommended for Windows 10).
3. **Build Time**: First-time build can take several hours due to the number of dependencies.
4. **Disk Space**: Full installation may require several GB of disk space.
5. **Qt Version**: Supports both Qt6 and Qt5, automatically detects available version.

## Platform-Specific Notes

### Windows 10+ (x64 & ARM64)
#### Prerequisites
- Windows 10 SDK (latest version)
- Visual Studio 2019/2022 with C++ development tools
- Git (for vcpkg bootstrapping)
- Sufficient disk space (10GB+ recommended)

#### Performance Optimizations
- SSD storage highly recommended for faster builds
- Disable Windows Defender real-time protection temporarily for build directory
- Use Windows Terminal for better command-line experience

#### Python Integration
- Automatically installs required Python packages via pip
- Supports both PyQt5 and PyQt6 for maximum compatibility
- Python 3.11+ required for optimal performance

### Linux ARM64
#### Prerequisites
- ARM64 Linux distribution (Ubuntu 20.04+, Debian 11+, etc.)
- GCC 9+ or Clang 10+
- Python 3.11+ development headers
- CMake 3.16+
- Git and build-essential packages

#### Package Dependencies
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install build-essential cmake git python3-dev \
    qt6-base-dev qt6-tools-dev qt6-multimedia-dev \
    libgdal-dev libgeos-dev libproj-dev \
    libpq-dev libsqlite3-dev libxml2-dev libexpat1-dev
```

#### Build Configuration
- Uses system package manager for base dependencies
- Leverages vcpkg for specific versions and optional components
- Optimized for ARM64 architecture (aarch64)

#### Performance Tips
- Use appropriate swap space for compilation
- Consider using `make -j$(nproc)` for parallel builds
- Monitor memory usage during compilation (ARM64 may require more RAM)

## Troubleshooting

### Windows-Specific Issues

1. **Out of Memory Errors**: Try building with fewer parallel jobs or increase system page file.
2. **Missing Dependencies**: Ensure all required system dependencies are installed (Visual Studio Build Tools, etc.).
3. **Qt Version Conflicts**: This port uses Qt6. Ensure no Qt5 conflicts in your environment.
4. **Python Integration**: Python bindings require compatible Python development headers.

### Linux ARM64-Specific Issues

1. **Memory Exhaustion**: ARM64 builds can consume significant RAM. Use swap space or reduce parallel jobs:
   ```bash
   export MAKEFLAGS="-j2"  # Reduce parallelism
   ```

2. **Missing System Packages**: Ensure all required -dev packages are installed
3. **Qt6 Path Issues**: Make sure Qt6 development packages are in PKG_CONFIG_PATH:
   ```bash
   export PKG_CONFIG_PATH=/usr/lib/aarch64-linux-gnu/pkgconfig:$PKG_CONFIG_PATH
   ```

4. **Library Conflicts**: Clean build environment between different architectures:
   ```bash
   vcpkg remove qgis --triplet=arm64-linux
   vcpkg install qgis[gui] --triplet=arm64-linux
   ```

### Cross-Platform General Issues

1. **Python Bindings Fail**: Ensure Python 3.11+ with development headers
2. **GDAL Version Mismatch**: Clean rebuild of GDAL and its dependencies
3. **Missing C++ Compiler**: Verify C++17 support and proper toolchain configuration

### Build Tips

- Use SSD storage for faster builds
- Close unnecessary applications to free RAM
- Consider using `--x-use-binary-source` if available
- For development builds, consider `vcpkg install qgis[desktop]` first, then add features incrementally

## Contributing

This port is maintained based on the official QGIS source code. For issues specific to this vcpkg port, please check the vcpkg issue tracker. For QGIS-specific issues, refer to the official QGIS project.

## References

- [QGIS Official Website](https://qgis.org/)
- [QGIS Source Repository](https://github.com/qgis/QGIS)
- [QGIS Documentation](https://docs.qgis.org/)
- [vcpkg Documentation](https://vcpkg.io/)