#!/bin/bash

for i in {1..20}; do ./4.curl_query.sh http-echo-dynamic.service.consul ; done 

# $B$b$7$/$O(B
# watch -n 1 ./4.curl_query.sh
