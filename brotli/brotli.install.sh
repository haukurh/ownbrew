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
# https://github.com/Homebrew/homebrew-core/blob/HEAD/Formula/brotli.rb
# git repo: https://github.com/google/brotli

# Setting up some basic variables for brotli
VERSION='1.0.9'
BROTLI_URL="https://github.com/google/brotli/archive/v${VERSION}.tar.gz"
BROTLI_TAR="${TF}/brotli-${VERSION}.tar.gz"
BROTLI_FOLDER="${TF}/brotli-${VERSION}"
OPTIONS="--prefix=${PREFIX}"

depends_on 'cmake'

info "Downloading brotli v${VERSION}"
download $BROTLI_URL $BROTLI_TAR

info 'Extracting brotli'
tar xf $BROTLI_TAR -C $TF
cd $BROTLI_FOLDER

info 'Configuring brotli'
./configure-cmake $OPTIONS 2>$LF/error.log 1>$LF/install.log

info 'make brotli'
make 2>$LF/error.log 1>$LF/install.log

info 'Running tests'
make test 2>$LF/error.log 1>$LF/install.log

info 'Installing brotli'
sudo make install 2>$LF/error.log 1>$LF/install.log

info 'Done installing brotli'
