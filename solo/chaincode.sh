#/bin/bash
# TMP=/tmp
TMP=/tmp
ORDERER=localhost:7050
CHANNEL_NAME=devchannel

set -e

function getname(){
    NAME=$1
    VERSION=$2
    echo "$NAME"_"$VERSION"
}

function getpkgID(){
    NAME=$1
    VERSION=$2
    echo $(peer lifecycle chaincode queryinstalled | sed -n "/${NAME}_${VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}")
}

function pkg(){
    NAME=$1
    VERSION=$2
    peer lifecycle chaincode package $TMP/"$NAME"_"$VERSION".tar.gz -p "github.com/Zzocker/voting-lab/chaincode/$NAME" --label $(getname $NAME $VERSION)
}

function install(){
    NAME=$1
    VERSION=$2
    peer lifecycle chaincode install $TMP/"$NAME"_"$VERSION".tar.gz
}

function approveForMyOrg(){
    NAME=$1
    VERSION=$2
    peer lifecycle chaincode approveformyorg -C $CHANNEL_NAME \
    -n $NAME --package-id $(getpkgID $NAME $VERSION) \
    --sequence $VERSION -v $VERSION -o $ORDERER
}

function commit(){
    NAME=$1
    VERSION=$2
    # echo $NAME
    peer lifecycle chaincode commit -C $CHANNEL_NAME -n $NAME -v $VERSION --sequence $VERSION -o $ORDERER
}



case $1 in
    "install")
        NAME=$2
        pkg $NAME 1
        install $NAME 1
        approveForMyOrg $NAME 1
        commit $NAME 1
    ;;
    "update")
        NAME=$2
        VERSION=$3
        pkg $NAME $VERSION
        install $NAME $VERSION
        approveForMyOrg $NAME $VERSION
        commit $NAME $VERSION
    ;;
    *)
        echo "Chaincode bash script has only"
        echo "install"
        echo "update"
        echo "===================================================="
        echo "===================================================="
        echo "install <chaincodeName>"
        echo "install called only once"
        echo "===================================================="
        echo "===================================================="
        echo "update <chaincodeName> <version>"
        echo "update called once install is called"
    ;;
esac