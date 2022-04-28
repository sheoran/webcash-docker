# webcash-docker

Ready to use docker image packaged with

1. https://github.com/kanzure/webcash
2. https://github.com/maaku/webminer

## Quick start of mining and storing of tokens without git clone
1. Start miner `curl -s https://raw.githubusercontent.com/sheoran/webcash-docker/master/start_miner.sh | bash -s --`
2. Wallet operations `curl -s https://raw.githubusercontent.com/sheoran/webcash-docker/master/cash.sh -o /tmp/cash.sh  && bash /tmp/cash.sh --help`

## Quick start of mining and storing of tokens once repo is cloned

1. `./start_miner.sh`, It will create folder where wallet data be will be kept `webcash_wallet_data`
2. Validate images are running, should be similar to screenshot ![](docs/images/demo.png)
3. Wallet operations
   1.  `./cash.sh --help`

## Build and push image locally if you have perm

        docker build -t sheoran/webcash:latest .
        docker push sheoran/webcash:latest


## WebCash resources
1. [Get 1k free webcash](https://webcashfaucet.org/)
2. [Webcash quick-start Guide](https://docs.google.com/document/d/1tbVtxnoCVgvoh29o5_-jeEOoGS64gOIiVNHQOQcxXa4/edit)
3. [Webcash slides](https://webcash.org/webcash-slides.pdf)
