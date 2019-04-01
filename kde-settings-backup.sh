#!/bin/bash

log_file="/data/kde-backup/kde-backup.log"
backup_location="/data/kde-backup"
backup_time=`date +%d-%m-%Y-%H-%M-%S`
USER=$1

if [ "$#" -eq 1 ]; then
    if [ -d "/home/$1" ]; then
        cd /home/$USER
        7z a -r $backup_location/kde-plasma-backup-$backup_time.7z .config .local .kde
        echo "[`date +%d-%m-%Y-%H:%M:%S`] \".config, .local, .kde folders\" backup done." >> $log_file
    else
        echo "Not found: \"/home/$USER\" directory not found."
        echo "[`date +%d-%m-%Y-%H:%M:%S`] \"/home/$USER\" directory not found." >> $log_file
    fi
else
    echo "Format: $0 <username>"
    echo "Format: $0 <username>" >> $log_file
fi
