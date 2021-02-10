package main

import (
	"github.com/hyperledger/fabric-chaincode-go/shim"
	"github.com/hyperledger/fabric-protos-go/peer"
)

type cc struct{}

func (c cc) Init(stub shim.ChaincodeStubInterface) peer.Response { return shim.Success(nil) }
func (c cc) Invoke(stub shim.ChaincodeStubInterface) peer.Response {
	
	return shim.Success(nil)
}
func main() {
	shim.Start(cc{})
}
