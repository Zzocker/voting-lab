#/bin/bash
REPO_HOME=$(git rev-parse --show-toplevel)

function create(){
    peer channel create -f $REPO_HOME/solo/artifacts/channel.tx -c devchannel -o localhost:7050 --outputBlock /tmp/devchannel.block
}

function join(){
    peer channel join -b /tmp/devchannel.block
}

case $1 in
    "join")
        join
    ;;
    "create")
        create
    ;;
    *)
    ;;
esac