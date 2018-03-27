#!/bin/bash

E_NOARGS=75

# Check options of runing command

if [ -z "$2" ] || ! [ -d "$1" ]
then
	echo "Usage: $0 path_to_dir backups_count"
	exit $E_NOARGS
fi

if ! [ 0 -lt "$2" ]
then
	echo "Usage: $0 path_to_dir backups_count"
	echo "backups_count - must be a natural number"
	exit $E_NOARGS
fi

# Check and create backups folder

BACKUPS_DIR=/tmp/backups/

if  ! [ -d "$BACKUPS_DIR" ]
then
	mkdir "$BACKUPS_DIR"
fi


