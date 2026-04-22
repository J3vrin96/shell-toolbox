#!/bin/bash

BIN_PATH=
DOWNLOAD_PATH=
CURRENT_WORKING_DIRECTORY=$(pwd)

emptyFolder() {
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

emptyFolder $1