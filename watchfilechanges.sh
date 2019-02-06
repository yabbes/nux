#!/bin/bash
# 31.10.2018 ts
# Fill in path variables with /
# check for changes and backup to history folder if yes
# before first use copy original file to backup_path
 
LOCATION="/etc/asterisk/sip.conf"
BACKUP_PATH="/root/linudata/"
HISTORY_PATH="/root/linudata/history/"
FILE_NAME="sip.conf"
 
EXISTINGMD5=$(md5sum $LOCATION | awk '{print $1}')
LATESTMD5=$(md5sum $BACKUP_PATH$FILE_NAME | awk '{print $1}')
 
if [ ! -d $HISTORY_PATH ]; then
    mkdir $HISTORY_PATH
fi
 
if [ -f $LOCATION ]; then
    if [ $EXISTINGMD5 != $LATESTMD5 ]; then
        cp $LOCATION $BACKUP_PATH$FILE_NAME
        cp $LOCATION $HISTORY_PATH$FILE_NAME$(date '+%Y-%m-%d_%H:%M:%S')
    fi
fi
