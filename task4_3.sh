#!/bin/bash

E_NOARGS=75

# Check options of runing command

set -e
if [ -z "$2" ] || ! [ -d "$1" ] || [ "$2" -le 0 ]
then
	echo "Usage: $0 path_to_dir backups_count"
	exit $E_NOARGS
fi
set +e
# Check and create backups folder

BACKUPS_DIR=/tmp/backups/

if  ! [ -d "$BACKUPS_DIR" ]
then
	mkdir "$BACKUPS_DIR"
fi


