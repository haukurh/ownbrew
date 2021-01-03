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
# https://beyondgrep.com/install
# git repo: https://github.com/beyondgrep/ack3

# Setting up some basic variables for ack
VERSION='3.4.0'
ACK_URL="https://beyondgrep.com/ack-v3.4.0"
ACK="${TF}/ack-v${VERSION}"
BINARY="${PREFIX}/bin/ack"

info "Downloading ack v${VERSION}"
download $ACK_URL $ACK

info 'Setting permissions'
chmod 755 $ACK

info 'Installing ack'
sudo cp $ACK $BINARY


info 'Done installing ack, go give it a try!'
