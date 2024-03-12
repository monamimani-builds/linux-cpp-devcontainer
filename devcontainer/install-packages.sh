#!/usr/bin/env bash

apt-get update 
apt-get upgrade -y
sudo apt-get install -y --no-install-recommends software-properties-common

pushd /tmp/
wget https://apt.kitware.com/kitware-archive.sh
chmod +x kitware-archive.sh
sudo ./kitware-archive.sh
sudo apt install -y cmake
popd

# vcpkg: https://github.com/microsoft/vcpkg/blob/master/README.md#quick-start-unix
# pushd $VCPKG_ROOT
# git config --system --add safe.directory "$VCPKG_ROOT" 
# git fetch --unshallow
# git pull --ff-only
# bootstrap-vcpkg.sh
# popd



# Cleaning
apt-get remove -y --auto-remove software-properties-common
apt-get autoremove -y
apt-get clean
rm -rf /var/lib/apt/lists/*