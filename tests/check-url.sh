#!/bin/bash

url="http://172.17.0.1:9090/health"

if curl -s --head $url | head -n 1 | grep "HTTP/1.[01] [23].." > /dev/null
then
    echo "URL is reachable and valid"
    response=$(curl $url)
    echo $response
else
    echo "URL is not reachable or invalid"
fi