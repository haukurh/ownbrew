#!/bin/bash

PREFIX='/usr/local'
ETC='/etc'

now () {
	date +'%d/%b/%Y:%H:%M:%S'
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

make_tmp_folder() {
	TMP_FOLDER="${DIR}/.tmp"
	mkdir $TMP_FOLDER
	echo "${TMP_FOLDER}"
}

make_logs_folder() {
	LOGS_FOLDER="${DIR}/.logs"
	mkdir $LOGS_FOLDER
	echo "${LOGS_FOLDER}"
}

