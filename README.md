# webcash-docker

Ready to use docker image packaged with

1. https://github.com/kanzure/webcash
2. https://github.com/maaku/webminer

## Quick start of mining and storing of tokens

1. `./start_miner.sh`, It will create folder where wallet data be will be kept `webcash_wallet_data`
2. Validate images are running, should be similar to screenshot ![](docs/images/demo.png)
3. Wallet operations
   1.  `./cash.sh --help`

## Build and push image locally if you have perm

        docker build -t sheoran/webcash:latest .
        docker push sheoran/webcash:latest


## WebCash resources
1. [Webcash quick-start Guide](https://docs.google.com/document/d/1tbVtxnoCVgvoh29o5_-jeEOoGS64gOIiVNHQOQcxXa4/edit)
2. [Webcash slides](https://webcash.org/webcash-slides.pdf)
