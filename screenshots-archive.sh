#!/bin/bash

log_file="/data/kde-backup/kde-backup.log"
screenshots_backup="/data/kde-backup/screenshots-backup/"
screenshots_dir="/data/screenshots/"
USER=$1

if [ "$#" -eq 0 ]; then
    if [ -d $screenshots_dir ]; then
	cd $screenshots_backup
	dirname=`date +%d-%m-%Y`
	mkdir -p $screenshots_backup$dirname
        mv $screenshots_dir/* $screenshots_backup/$dirname
        echo "[`date +%d-%m-%Y-%H:%M:%S`] \"$screenshots_dir \" archive done." >> $log_file
    else
        echo "Not found: \"$screenshots_dir\" directory not found."
        echo "[`date +%d-%m-%Y-%H:%M:%S`] \"$screenshots_dir\" directory not found." >> $log_file
    fi
else
    echo "Format: $0 <username>"
    echo "Format: $0 <username>" >> $log_file
fi
