## Solo Playground

Network with solo orderer and a devpeer

### Start Network
```
./network start
```
### clean up
```
./network clean
```

### Channel operation
Firstly set environnement variable to point org1's admin
```
source env/org
```
#### Create Channel
```
./channel create
```
#### Join Channel
```
./channel join
```