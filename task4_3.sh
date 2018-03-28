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

# Resolve PATH_TO_DIR

START_PATH=$1
CURRENT_PATH=`pwd`
PATH_TO_DIR=$(cd "$START_PATH" && pwd && cd "$CURRENT_PATH")

## if [ "${START_PATH:0:1}" = "." ]
## then
##    PATH_TO_DIR=`echo $(pwd)${START_PATH:1:${#START_PATH}}`
## else
##    PATH_TO_DIR=`dirname "$1"`
## fi
echo "PATH_TO_DIR=$PATH_TO_DIR"

# Get new backup base name

BASE_ARR=(`echo $PATH_TO_DIR | awk 'BEGIN { FS="/" } /1/  {for (i=1; i<=NF; i++) print $i}'`)
## echo "${b[0]}"
## echo "${b[1]}"
echo "len=${#BASE_ARR[@]}"
BASE_NAME=""

for B_NAME in "${BASE_ARR[@]}"
do
    BASE_NAME=`echo "$BASE_NAME""$B_NAME""-"`
done
echo "BASE_NAME=$BASE_NAME"

# Create tar gz

tar -cvzf `echo "$BACKUPS_DIR""$BASE_NAME""0"".tar.gz" "$PATH_TO_DIR"`





