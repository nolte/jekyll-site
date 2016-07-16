#!/usr/bin/env bash
set -e # halt script on error

cd ./content

bundle exec htmlproofer ./_site
