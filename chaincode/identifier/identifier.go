package main

// DID Action
// https://www.w3.org/TR/did-use-cases/#actions

// DID Document property
// https://www.w3.org/TR/did-core/#did-document-properties

// identifier is use for identification
// identification can be direct or indirect
// direct : are controlled by a person
// indirect : are controlled by other direct/indirect identifier
// eg :
// identification of a person in virtual world via public key can be consider as direct identification
// virtual voter-id can be identified by person's direct identifier
type identifier struct {
	// ID follows a patter
	// id:<identification_type>:<>
	ID string `json:"id"`
}
