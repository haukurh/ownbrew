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
# https://stedolan.github.io/jq/
# git repo: https://github.com/stedolan/jq

# Setting up some basic variables for ack
VERSION='1.6'
JQ_URL="https://github.com/stedolan/jq/releases/download/jq-${VERSION}/jq-osx-amd64"
JQ="${TF}/jq-v${VERSION}-osx-amd64"
BINARY="${PREFIX}/bin/jq"

info "Downloading jq v${VERSION}"
download $JQ_URL $JQ

info 'Setting permissions'
chmod 755 $JQ

info 'Installing jq'
sudo cp $JQ $BINARY

info 'Done installing jq'
