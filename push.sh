#!/bin/bash

OUTPUT=""
EXIT_CODE=0
ERROR_STATUS=0

COMMENT=$1

if [ "$COMMENT" == "" ]; then
	echo "[ERROR] you need to input some comment"
	exit 2
fi

check_error () {
	if [ $EXIT_CODE -gt 0 ]; then
		echo "[ERROR]: $OUTPUT"
		ERROR_STATUS=1
		return 1
	fi
}

OUTPUT=$(eval 'git add . 2>&1')
EXIT_CODE=$?

check_error

OUTPUT=$(eval 'git commit -m "$COMMENT" 2>&1')
EXIT_CODE=$?

check_error

OUTPUT=$(eval 'git push origin main 2>&1')
EXIT_CODE=$?

check_error

if [ $ERROR_STATUS -eq 0 ]; then
	echo "Pushed"
fi
