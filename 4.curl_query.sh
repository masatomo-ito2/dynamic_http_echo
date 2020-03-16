#!/bin/bash

if [ $# -eq 0 ]
	then
		echo 'Needs to supply argument'
		echo '  $1 = <Service name>'
		exit 1
fi

DIG_RESULT=$(dig @localhost +short -p 8600 ${1} SRV | head -n 1) 
HOSTNAME=$(echo ${DIG_RESULT} | cut -d ' ' -f 4)
HOSTNAME=$(echo ${HOSTNAME%.} )
PORT=$(echo ${DIG_RESULT} | cut -d ' ' -f 3)
SERVICE_URL=${HOSTNAME}:${PORT}

curl -s ${SERVICE_URL}
