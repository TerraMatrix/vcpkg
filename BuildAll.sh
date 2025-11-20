#!/bin/bash

# Set proxy if needed
# Uncomment and modify the following lines if you need to set proxy
# export http_proxy=http://127.0.0.1:7890
# export https_proxy=http://127.0.0.1:7890

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

echo "Setting up vcpkg with custom install and packages directories..."
./vcpkg --x-install-root=./installed --x-packages-root=./packages --vcpkg-root=./

# Function to run a bash script if it exists
run_script() {
    local script_name=$1
    local script_path="./bash/${script_name}.sh"
    
    if [ -f "$script_path" ]; then
        echo "Installing ${script_name}..."
        echo "--------------------------------------------"
        bash "$script_path"
        if [ $? -ne 0 ]; then
            echo "Error: Failed to install ${script_name}" >&2
            return 1
        fi
    else
        echo "Warning: Script ${script_name}.sh not found, skipping..." >&2
        return 0
    fi
}

# List of packages to install (in order)
packages=(
    "boost"
    "fmt"
    "sltbench"
    "tinyxml2"
    "cryptopp"
    "freetype"
    "hdf5"
    "flann"
    "glm"
    "gtest"
    "glew"
    "gmp"
    "cereal"
    "gsl"
    "openni2"
    "openexr"
    "pybind11"
    "ceres"
    "curl"
    "proj"
    "libgeotiff"
    "liblas"
    "mcc-lidar"
    "crunch"
    "libkml"
    "xerces-c"
    "libxml2"
    "libpq"
    "lastools"
    "poppler"
    "gdal"
    "pdal"
    "qt5"
    "qt"
    "glib"
    "ilmbase"
    "fontconfig"
    "ffmpeg"
    "cgal"
    "pcl"
    "opencv4"
    "osg"
    "osg-qt"
    "leveldb"
    "grpc"
    "shapelib"
    "vcglib"
    "pugixml"
    "nlohmann-json"
    "highway"
    "skia"
    "qgis"
)

# Install each package
for pkg in "${packages[@]}"; do
    run_script "$pkg" || exit 1
done

echo "All packages have been installed successfully!"
exit 0
