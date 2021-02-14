## Identifer
Identifer chaincode is responsible for virtually map (identify) citizens , EC (election commission) onto the system<br>

## Citizens
1. Person will firstly seed their public key to get a seed-id
2. Using the id, person will visit EC's website. will fill a form containing (minimal)
    - seed-id
    - voter-id
    - other kind of verification (will be same as current)
3. Once verified EC will create voterID for that person pointing to seed id
```
type CitizenSeed struct{
    ID string // citizenSeed:<tx-id>
    PublicKeyBase58 string // base58 encoded public key
    About{
        CreatedOn int64
        Hash String // = hash(id+key+createdOn)
    }
}
```

```
type voterID struct{
    ID string // voterID:<tx-id>
    Number string // actual VoterID number
    SeedID string // pointing to seed ID
    About{
        Created int64 // when this virtual voter was created
        Hash string // 
    }
    State [Verified|Revoked] // can only be changed by EC public key holder
 
    Panchayat string // all election chaincode will use this,
}
```
## EC
1. Once network is up , EC will create 1st transaction (application level)
    - to seed their public key
    - with their website
    - will use a particular reserved id

```
type ec struct{
    ID = (reserved)
    PublicKeyBase58 string
    Website string
    About{
        Created int64
        Hash string
    }
}
```