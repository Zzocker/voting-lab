package main

import (
	"fmt"
	"os"

	"github.com/hyperledger/fabric-chaincode-go/shim"
	pb "github.com/hyperledger/fabric-protos-go/peer"
)

// cc chaincode should implement shim.Chaincode
// just implement two method
// 1. Init(stub ChaincodeStubInterface) pb.Response
// 2. Invoke(stub ChaincodeStubInterface) pb.Response
type cc struct {
}

func (c *cc) Init(stub shim.ChaincodeStubInterface) pb.Response {
	fmt.Println("Init called")
	return shim.Success(nil)
}
func (c *cc) Invoke(stub shim.ChaincodeStubInterface) pb.Response {
	fmt.Println("Invoke called")
	return shim.Success(nil)
}

func main() {
	err := shim.Start(new(cc))
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}
