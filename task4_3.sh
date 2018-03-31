#!/bin/bash



#w=`echo $1 | sed -e "s/^\///" -e "s/\//-/g"`
#echo "$w"

    if [ $# -ne 2 ]; then
	echo "Wrong number of parameters" >&2
	exit 1
    elif ! [[ -d $1 ]]; then
        echo "Directory error" >&2
	exit 2
    elif [ -z "${2##*[!0-9]*}" ] || [ "${2}" -eq 0 ]; then
	echo "The second parameter error"  >&2
        exit 3
    fi

if ! [ -d "/tmp/backups/" ]; then
    mkdir "/tmp/backups/"
fi

BACKUP_NAME=$(echo $1 | sed -e "s/^\///" -e "s/\/$//" -e "s/\//-/g")
# BACKUP_NAME=$(echo $1 | sed -r 's/[/]+/-/g' | sed 's/^-//')
TIME=$(date +%Y-%m-%d-%H%M%S)
ARCHIVE_NAME="${BACKUP_NAME}.${TIME}.tar.gz"
#echo $BACKUP_NAME
#echo $BACKUP_NAME
srcdir="${1}"

tar -czf "/tmp/backups/$ARCHIVE_NAME" -P "${srcdir}"

find "/tmp/backups/" -name "${BACKUP_NAME}*" -type f -printf "/tmp/backups/%P\n"| sort -n | head -n -"$2" | sed "s/.*/\"&\"/"| xargs rm -f

exit 0
