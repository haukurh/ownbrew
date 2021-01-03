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
# https://evermeet.cx/ffmpeg/
# git repo: https://github.com/FFmpeg/FFmpeg

# Setting up some basic variables for ack
VERSION='4.3.1'
FFMPEG_URL="https://evermeet.cx/pub/ffmpeg/ffmpeg-${VERSION}.zip"
FFMPEG_ZIP="${TF}/ffmpeg-${VERSION}.zip"
FFMPEG="${TF}/ffmpeg"
BINARY="${PREFIX}/bin/ffmpeg"

info "Downloading ffmpeg v${VERSION}"
download $FFMPEG_URL $FFMPEG_ZIP

info 'Unzipping ffmpeg'
unzip $FFMPEG_ZIP -d $TF 2>$LF/error.log 1>$LF/install.log

info 'Installing ffmpeg'
sudo cp $FFMPEG $BINARY

info 'ffmpeg has been setup'
