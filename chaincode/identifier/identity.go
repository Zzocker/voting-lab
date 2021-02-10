package main

import (
	"encoding/json"
	"fmt"

	"github.com/hyperledger/fabric-chaincode-go/shim"
)

// seed main starting of network
// once network is started EC seed its DID
// DID will have
// website :
// identifier : EC
// CreateOn :
//

type identityStatusTypes uint8

const (
	nonverifiedIdentityStatusTypes identityStatusTypes = iota
	verifiedIdentityStatusTypes
	// seedIdentityStatus can be used only once for EC
	seedIdentityStatusTypes
)

type identity struct {
	// ID of this identity
	VID string

	Status identityStatusTypes
	// current hash of the did for
	// Hash       []byte
}

func newIdentity(stub shim.ChaincodeStubInterface) error {
	args := stub.GetArgs()
	if len(args) != 1 {
		return fmt.Errorf("invalid number of argument")
	}
	vid := string(args[0])
	if vid == "" {
		return fmt.Errorf("empty voter id")
	}
	raw, err := stub.GetState(vid)
	if err == nil && raw != nil {
		return fmt.Errorf("voter id already exists")
	} else if err != nil {
		return err
	}

	id := identity{VID: vid}
	raw, _ = json.Marshal(id)
	return stub.PutState(vid, raw)
}
