#!/usr/bin/env bash

#ENVARS
# Hostname will ensure if you are using this script on NFS mounted home, each server gets its own wallet
WALLET_PATH=~/webcash_wallet_data/$(hostname)
mkdir -p $WALLET_PATH

echo "SourceCode can be reviwed at: https://github.com/sheoran/webcash-docker/start_miner.sh"
echo "Removing any preivous execution instances to avoid overloading of machine"
docker rm -f webminer &> /dev/null
docker rm -f webminer_wallet_poller &> /dev/null

docker run --name webminer -d -v $WALLET_PATH:/data sheoran/webcash:latest bash -c "/usr/bin/webminer --acceptterms"
docker run --name webminer_wallet_poller -d -v $WALLET_PATH:/data sheoran/webcash:latest bash -c "tail -F webcash.log | xargs -n 1 webcash insert"

echo "Details of service started (If blank or error message something is wrong)"
echo "webminer: $((docker top webminer > /dev/tty) 2>&1)"
echo "webminer_wallet_poller: $((docker top webminer_wallet_poller > /dev/tty) 2>&1)"

echo  "!! Before restaring, manually review logs, using: docker logs <webminer or webminer_wallet_poller> !!"
echo  "!! Your wallet at <$WALLET_PATH> is safe as its mounted and will survie between runs!!"
