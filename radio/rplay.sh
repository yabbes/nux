#!/bin/bash
STATION=$1

cat ~/radio | grep $STATION | xargs mpv {}
