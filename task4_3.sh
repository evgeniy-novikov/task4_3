#!/bin/bash

if [ -z "$2" ]
then
	echo "Usage: `$0` path_to_dir backups_count"
	exit $E_NOARGS
fi

BACKUPS_DIR=/tmp/backups/


