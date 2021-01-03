#!/bin/bash

# This directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# Parent directory
PDIR=$( dirname "${DIR}" )

# Load basic utils
source "${PDIR}/utils.sh"

# Setting up folders
TF=$(make_tmp_folder)
LF=$(make_logs_folder)

# Inspiration:
# https://github.com/Homebrew/homebrew-core/blob/HEAD/Formula/cmake.rb
# git repo: https://github.com/Kitware/CMake

# Setting up some basic variables for CMake
VERSION='3.19.2'
CMAKE_URL="https://github.com/Kitware/CMake/releases/download/v${VERSION}/cmake-${VERSION}.tar.gz"
CMAKE_TAR="${TF}/cmake-${VERSION}.tar.gz"
CMAKE_FOLDER="${TF}/cmake-${VERSION}"
OPTIONS="--prefix=${PREFIX} --no-system-libs --system-zlib --system-bzip2 --system-curl"

info 'Downloading CMake'
download $CMAKE_URL $CMAKE_TAR

info 'Extracting CMake'
tar xf $CMAKE_TAR -C $TF
cd $CMAKE_FOLDER

info 'Bootstraping CMake'
./bootstrap $OPTIONS 2>$LF/error.log 1>$LF/install.log

info 'Make CMake... kinda funny'
make 2>$LF/error.log 1>$LF/install.log

info 'Installing CMake'
sudo make install 2>$LF/error.log 1>$LF/install.log

# Clean up
info 'CMake installation done'
