#!/bin/bash

E_NOARGS=75

# Check options of runing command
if test -z "$2"
then
	echo "Usage: $0 path_to_dir backups_count"
	# exit 1
	exit $E_NOARGS
fi

# Check and create backups folder

BACKUPS_DIR=/tmp/backups/


