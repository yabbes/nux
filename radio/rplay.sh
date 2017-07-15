#!/bin/bash
STATION=$1

cat ~/radio | grep $STATION | awk '{print $1}' | xargs mpv
