#!/bin/bash

PREFIX='/usr/local'
ETC='/etc'

now() {
	date +'%d/%b/%Y:%H:%M:%S'
}

timestamp() {
	date +'%Y%m%d.%H%M%S'
}

log() {
	echo "`now` ${1}"
}

info() {
	log "INFO: ${1}"
}

warn() {
	log "WARN: ${1}"
}

critical() {
	log "CRIT: ${1}"
}

download() {
	# -L, --location
	# -o, --output
	# -s, --silent
	curl -L -s "${1}" -o "${2}"
}

make_folder() {
	if [ -d $1 ]
	then
		>&2 warn "Directory ${1} already exists"
	else
		mkdir -p $1
	fi
}

make_tmp_folder() {
	local TMP_FOLDER="${DIR}/.tmp/$(timestamp)"
	make_folder $TMP_FOLDER
	echo "${TMP_FOLDER}"
}

make_logs_folder() {
	local timestamp=$(date +'%Y.%m.%d')
	local LOGS_FOLDER="${DIR}/.logs/$(timestamp)"
	make_folder $LOGS_FOLDER
	echo "${LOGS_FOLDER}"
}

depends_on() {
	if ! command -v $1 &> /dev/null
	then
		>&2 critical "Dependancies not meet, ${1} is required to continue!"
		exit 2
	fi
}
