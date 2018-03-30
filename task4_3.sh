#!/bin/bash


# Check options of runing command

E_NOARGS=75
if [ $# -ne 2 ] || ! [ -d "$1" ]
then
	echo "Usage: $0 path_to_dir backups_count"
	>&2 echo "ERROR: wrong options"
	exit $E_NOARGS
elif ! [ 0 -lt "$2" ]
then
	echo "Usage: $0 path_to_dir backups_count"
	echo "backups_count - must be a natural number"
	>&2 echo "ERROR: wrong options"
	exit $E_NOARGS
fi
START_PATH=$1
BACKUPS_COUNT=$2

# Check and create backups folder

BACKUPS_DIR=/tmp/backups/

if  ! [ -d "$BACKUPS_DIR" ]
then
	mkdir "$BACKUPS_DIR"
fi

# Resolve PATH_TO_DIR

CURRENT_PATH=$(pwd)
PATH_TO_DIR=$(cd \""$START_PATH"\" && pwd && cd \""$CURRENT_PATH"\" || exit 1)
echo "PATH_TO_DIR=$PATH_TO_DIR"

# Get new backup base name

BASE_NAME=$(echo "${PATH_TO_DIR:1:${#PATH_TO_DIR}}."|tr -s "\\/" "-")
echo "BASE_NAME=$BASE_NAME"
TEMP_NAME=$("$BASE_NAME""tar.gz.new")
echo "TEMP_NAME=$TEMP_NAME"

# Create tar gz

tar -czf \""$BACKUPS_DIR""$TEMP_NAME"\" \""$PATH_TO_DIR"\"

# Check move exist backup

## EXIST_BACKUPS=($(echo /directory/*mystring*))
EXIST_BACKUPS=($(ls -tr "$BACKUPS_DIR"|grep  "$BASE_NAME[0-9].tar.gz"))
echo "len EXIST_BACKUPS=${#EXIST_BACKUPS[@]}"

remove_old(){
	echo "remove=$1"
}

BACKUPS_DELTA=$(( ${#EXIST_BACKUPS[@]} -  BACKUPS_COUNT ))
if [ "$BACKUPS_DELTA" -le 0 ]
then
	echo
	remove_old "$BACKUPS_DELTA"

fi

## switch_backups

## remove_old $(( ${#EXIST_BACKUPS[@]} -  BACKUPS_COUNT ))

switch_older(){
	echo
}


switch_older 
i=$(( "$BACKUPS_COUNT" - 1 ))





for fff in $(ls -tr "$BACKUPS_DIR"|grep  "$BASE_NAME[0-9].tar.gz")
do
	echo "fff=$fff"
done





