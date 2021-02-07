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