#!/usr/bin/env bash
set -e # halt script on error

build_start=$4
build_end=$5
duration=$((build_end-build_start)) 
project=$3
cisystem=$1
branche=$2
keen_api_key=$(echo $keen_api_key)
test_result=$6

curl -s -X POST\
        -H "Content-Type: application/json"\
        -H "Accept: application/json"\
        -d '{"cisystem":"'${cisystem}'","project":"'${project}'","build_start":'${build_start}',"build_end":'${build_end}',"branche":"'${branche}'","test_result":'${test_result}',"duration":'${duration}'}'\
        https://api.keen.io/3.0/projects/578d609a80a7bd79bfd6cb0a/events/build?api_key=${keen_api_key}
