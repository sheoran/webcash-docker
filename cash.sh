#!/usr/bin/env bash

#ENVARS
# Hostname will ensure if you are using this script on NFS mounted home, each server gets its own wallet
WALLET_PATH=~/webcash_wallet_data/$(hostname)
ARGS=$@

echo "SourceCode can be reviwed at: https://github.com/sheoran/webcash-docker/cash.sh"
docker run --name webcash_cli -it --rm -v $WALLET_PATH:/data sheoran/webcash:latest bash -c "webcash $ARGS"
