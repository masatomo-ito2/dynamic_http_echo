#!/bin/bash

#if [ $# -eq 0 ]
#	then
#		echo 'Needs to supply argument'
#		echo '  $1 = <arg>'
#		exit 1
#fi

dig +short SRV @localhost -p 8600 http-echo-dynamic.service.consul 
