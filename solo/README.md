## Solo Playground

Network with solo orderer and a devpeer

### Start Network
```
./network.sh start
```
### clean up
```
./network.sh clean
```

### Channel operation
Firstly set environnement variable to point org1's admin
```
source env/org
```
#### Create Channel
```
./channel.sh create
```
#### Join Channel
```
./channel.sh join
```

### Chaincode operation
`./chaincode.sh`
#### Install
Install need to called only once for a chaincode
```
./chaincode.sh <pkg_name>
```

pkg_name : is relative to *chiancode* directory of repo root

#### Update
```
./chaincode.sh <pkg_name> <version>
```
pkg_name : is relative to *chiancode* directory of repo root

