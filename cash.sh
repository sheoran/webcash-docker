#!/usr/bin/env bash

#ENVARS
# Hostname will ensure if you are using this script on NFS mounted home, each server gets its own wallet
WALLET_PATH=~/webcash_wallet_data/$(hostname)
ARGS=$@
docker run --name webcash_cli -it --rm -v $WALLET_PATH:/data sheoran/webcash:latest bash -c "webcash $ARGS"
