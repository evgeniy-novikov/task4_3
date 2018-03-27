#!/bin/bash


# Check options of runing command

E_NOARGS=75
if [ -z "$2" ] || ! [ -d "$1" ]
then
	echo "Usage: $0 path_to_dir backups_count"
	exit $E_NOARGS
elif ! [ 0 -lt "$2" ]
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

# Resolve path_to_dir

start_path=$1
if [ "${start_path:0:1}" = "." ]
then
    path_to_dir=`echo $(pwd)${start_path:1:${#start_path}}`
else
    path_to_dir=`dirname "$1"`
fi
## echo "path_to_dir=$path_to_dir"

# Get new backup base name

base_arr=(`echo $path_to_dir | awk 'BEGIN { FS="/" } /1/  {for (i=1; i<=NF; i++) print $i}'`)
## echo "${b[0]}"
## echo "${b[1]}"





