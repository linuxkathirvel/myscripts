#!/bin/bash

log_file="/data/kde-backup/kde-backup.log"
downloads_backup="/data/kde-backup/downloads-backup/"
USER=$1

if [ "$#" -eq 1 ]; then
    if [ -d "/home/$1" ]; then
    	download_dir="/home/$USER/Downloads/"
	cd $downloads_backup
	dirname=`date +%d-%m-%Y`
	mkdir -p $donwnloads_backup$dirname
        mv $download_dir/* $downloads_backup/$dirname
        echo "[`date +%d-%m-%Y-%H:%M:%S`] \"$download_dir \" archive done." >> $log_file
    else
        echo "Not found: \"/home/$USER\" directory not found."
        echo "[`date +%d-%m-%Y-%H:%M:%S`] \"/home/$USER\" directory not found." >> $log_file
    fi
else
    echo "Format: $0 <username>"
    echo "Format: $0 <username>" >> $log_file
fi
