#!/bin/bash

for i in {1..20}; do ./4.curl_query.sh http-echo-dynamic.service.consul ; done 

# もしくは
# watch -n 1 ./4.curl_query.sh
