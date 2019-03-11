#! /bin/bash
# 11.03.2019 linudata, ts
# execute daily to circumvent lancom router bug in dns resolution
RESSOURCES_ARR=()

# fill in domain names in array
RESSOURCES_ARR[0]="google.de"
RESSOURCES_ARR[1]="yahoo.de"
RESSOURCES_ARR[2]="t-online.de"

for item in ${RESSOURCES_ARR[*]}
do
	ping -w 5 -c2 ${item} &>/dev/null
	sleep 2
	host -t mx ${item} &>/dev/null
done;





