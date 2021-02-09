#/bin/bash

REPO_HOME=$(git rev-parse --show-toplevel)
TMP_PIP=/tmp/solo
CHANNEL_NAME=devchannel

function crypto(){
    if [ -d "$REPO_HOME/solo/crypto-config" ];then
        rm -r $REPO_HOME/solo/crypto-config
    fi
    cryptogen generate --config crypto-config.yaml 1>& $TMP_PIP
} 

function artifacts(){
    if [ -d "$REPO_HOME/solo/artifacts" ];then
        rm -r $REPO_HOME/solo/artifacts
    fi
    mkdir $REPO_HOME/solo/artifacts
    configtxgen -outputBlock artifacts/genesis.block -profile Genesis -channelID genesischannel 
    configtxgen -outputCreateChannelTx artifacts/channel.tx -profile DevChannel -channelID $CHANNEL_NAME 
}

function start(){
    docker-compose up -d
}

case  $1 in
    "preq")
        crypto
    ;;
    "artifacts")
        artifacts
    ;;
    "start")
        crypto
        sleep 1
        artifacts
        docker-compose up -d
    ;;
    "clean")
        docker rm -f orderer devpeer cli
        docker volume rm solo_peer_volume solo_orderer_volume
        docker rm -f $(docker ps -f "name=dev-*" -aq)
    ;;
    *)
        echo "nothing to call"
    ;;
esac