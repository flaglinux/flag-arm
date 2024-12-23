#!/bin/sh
PROJ=flag-arm
GIT_ROOT=https://github.com/wednus
BUILD_ROOT=$(pwd)

# To reduce the transfer size and improve reliability
git config --global http.postBuffer 524288000
git config --global core.compression 9
git config --global http.maxRequests 2
# not crossing filesystem boundaries unless explicitly configured:
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

# required for Python2.7.15
export SOURCE_DATE_EPOCH=$(date +%s)

# Define all repositories and their paths
repos="
manifest:lindenis-v536-manifest
build:lindenis-v536-build
config:lindenis-v536-config
device:lindenis-v536-device
package:lindenis-v536-package
prebuilt:lindenis-v536-prebuilt
scripts:lindenis-v536-scripts
softwinner:lindenis-v536-softwinner
target:lindenis-v536-target
toolchain:lindenis-v536-toolchain
tools:lindenis-v536-tools
lichee/linux-4.9:lindenis-v536-lichee-linux-4.9
lichee/brandy:lindenis-v536-lichee-brandy
dl:lindenis-v536-dl
"

# Clone each repository
for repo in $repos; do
    path=$(echo $repo | cut -d: -f1)
    name=$(echo $repo | cut -d: -f2)

    if [ -d "$path" ]; then
        # If directory exists, pull the latest changes
        echo "Directory $path exists. Pulling latest changes..."
        cd "$path"
        git pull origin main
        cd ${BUILD_ROOT}
    else
        # If directory doesn't exist, clone the repository
        echo "Directory $path does not exist. Cloning repository..."
        #git clone -b main ${GIT_ROOT/$name.git $path
        git clone --depth 1 -b main ${GIT_ROOT}/$name.git $path
        git fetch --unshallow
    fi
done

# copy make artifacts to the build root path
cp ./build/top_main.mk ./Makefile
cp ./build/rules.mk ./
cp ./config/top_config.in ./Config.in
cp ./manifest/.config ./
