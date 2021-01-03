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
FFPROBE_URL="https://evermeet.cx/pub/ffprobe/ffprobe-${VERSION}.zip"
FFPROBE_ZIP="${TF}/ffprobe-${VERSION}.zip"
FFPROBE="${TF}/ffprobe"
BINARY="${PREFIX}/bin/ffprobe"

info "Downloading ffprobe v${VERSION}"
download $FFPROBE_URL $FFPROBE_ZIP

info 'Unzipping ffprobe'
unzip $FFPROBE_ZIP -d $TF 2>$LF/error.log 1>$LF/install.log

info 'Installing ffprobe'
sudo cp $FFPROBE $BINARY

info 'ffprobe has been setup'
