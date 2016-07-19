#!/usr/bin/env bash
set -e # halt script on error

build_start=$(date +"%s")
build_end=$(date +"%s")
project="test"
cisystem="local"
branche="master"
keen_api_key=$(echo $keen_api_key)

curl -s -X POST\
        -H "Content-Type: application/json"\
        -H "Accept: application/json"\
        -d '{"cisystem":"'+cisystem+'","project":"'+project+'","build_start":"'+build_start+'","build_end":"'+build_end+'","branche":"'+branche+'"}'\
        https://api.keen.io/3.0/projects/578d609a80a7bd79bfd6cb0a/events/build?api_key=${keen_api_key}
