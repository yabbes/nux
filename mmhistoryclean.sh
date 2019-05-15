#!/bin/bash
# script to remove all message history older than 1 month from the matermost database
# assuming mattermost is configured as a SystemV service unit

# set variables for your environment
mm_db_name="mattermost_test"
mysql_root_pw="password"

# fixed variables

myself=$(basename $0)
mm_stopped=0
lm_epoch=$(date +%s --date='-1 month')
lm_epoch_ms=$(($lm_epoch * 1000)) 


systemctl stop mattermost
if [ $? -gt 0 ]; then
    logger -t $myself stopping mattermost service for history clean failed
else
    logger -t $myself stopping mattermost service for history clean succesful
    mm_stopped=1
fi


if [ $mm_stopped -gt 0 ]; then
    mysql -u root -p${mysql_root_pw} -D ${mm_db_name} -e "DELETE FROM Posts WHERE Posts.CreateAt < '${lm_epoch_ms}';"
    
    if [ $? -gt 0 ]; then
        logger -t $myself deleting old message history failed
    else
        logger -t $myself deleting old message history succesful
    fi
fi



systemctl start mattermost
if [ $? -gt 0 ]; then
    logger -t $myself starting mattermost service again after history clean failed
else
    logger -t $myself starting mattermost service again after history clean succesful
fi
