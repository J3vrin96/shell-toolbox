#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/config.sh"

if [ ! -f "$CONFIG_FILE" ]; then
	echo -e "\033[31m[ERROR] config.sh not found. Copy config.sh.example to config.sh and fill in your paths.\033[0m"
	exit 1
fi

source "$CONFIG_FILE"

CURRENT_WORKING_DIRECTORY=$(pwd)

empty() {
	echo "---------------------------"
	echo -e "\033[96mSTART - EMPTY FOLDER SCRIPT\033[0m"
	echo -e "---------------------------\n"

	local FOLDER_PATH

	case $1 in 
		"--bin")
			FOLDER_PATH="$BIN_PATH"
			;;
		"--downloads")
			FOLDER_PATH="$DOWNLOAD_PATH"
			;;
		*)
			echo -e "\033[31m[ERROR] INVALID ARGUMENT(S) -> EXITING\033[0m\n"
			exit 1
	esac

	if [ -z "$FOLDER_PATH" ]; then
		echo -e "\033[31m[ERROR] INVALID FOLDER_PATH -> EXITING\033[0m\n"
		exit 1
	fi

	echo -e "\033[34m[INFO] EMPTYING $FOLDER_PATH\033[0m\n"

	local FILES_IN_FOLDER=$(ls $FOLDER_PATH)
	
	echo -e "\033[34m[INFO] FILES WILL BE REMOVED $FILES_IN_FOLDER\033[0m\n"

	rm -rf "${FOLDER_PATH}"/*

	local RF_COMMAND_STATUS=$(echo $?)

	if [ $RF_COMMAND_STATUS = 0 ]; then
		echo -e "\033[32m[SUCCESS] STEP-1\033[0m\n"
	else
		echo -e "\033[31m[ERROR] STEP-1 -> EXITING\033[0m\n"
		exit 1
	fi

	echo -e "STEP-2: RETURNING TO: \033[33m${CURRENT_WORKING_DIRECTORY}\033[0m\n"

	cd $CURRENT_WORKING_DIRECTORY

	echo "---------------------------"
	echo -e "\033[96mFINISH - EMPTY FOLDER SCRIPT\033[0m"
	echo -e "---------------------------\n"

	exit 0
}

empty $1