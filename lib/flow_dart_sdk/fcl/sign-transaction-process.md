## Simple case - payer, proposer and authorizer is the same entity
We just need to sign the envelope:

Legend:
```go
type envelopeCanonicalForm struct {
	Payload           payloadCanonicalForm
	PayloadSignatures []transactionSignatureCanonicalForm
}

type transactionCanonicalForm struct {
	Payload            payloadCanonicalForm
	PayloadSignatures  []transactionSignatureCanonicalForm
	EnvelopeSignatures []transactionSignatureCanonicalForm
}
```

```go
func mustRLPEncode(v interface{}) []byte {
	b, err := rlpEncode(v)
	if err != nil {
		panic(err)
	}
	return b
}

func rlpEncode(v interface{}) ([]byte, error) {
	return rlp.EncodeToBytes(v)
}
```

- create signer (use crypto library)
- convert `Envelope` to `message` (byte array)
    - convert `Envelope` to `canonicalFormEnvelope`
    - rlp `canonicalFormEnvelope`
    - return result
      

Examples in Go here:
https://github.com/onflow/flow-go-sdk/blob/master/transaction_test.go#L584-L653

Examples in JS here:
https://github.com/onflow/flow-js-sdk/blob/52473243d6a61ef9c139a0612cedf32b17c55ea3/packages/sdk/src/encode/encode.test.js
https://github.com/onflow/flow-js-sdk/blob/52473243d6a61ef9c139a0612cedf32b17c55ea3/packages/sdk/src/encode/encode.js#L28

```javascript
const preparePayload = tx => {
  validatePayload(tx)

  return [
    scriptBuffer(tx.cadence),
    tx.arguments.map(argumentToString),
    blockBuffer(tx.refBlock),
    tx.computeLimit,
    addressBuffer(tx.proposalKey.address),
    tx.proposalKey.keyId,
    tx.proposalKey.sequenceNum,
    addressBuffer(tx.payer),
    tx.authorizers.map(addressBuffer),
  ]
}
```

```go
func (t *Transaction) payloadCanonicalForm() payloadCanonicalForm {
	authorizers := make([][]byte, len(t.Authorizers))
	for i, auth := range t.Authorizers {
		authorizers[i] = auth.Bytes()
	}

	return payloadCanonicalForm{
		Script:                    t.Script,
		Arguments:                 t.Arguments,
		ReferenceBlockID:          t.ReferenceBlockID[:],
		GasLimit:                  t.GasLimit,
		ProposalKeyAddress:        t.ProposalKey.Address.Bytes(),
		ProposalKeyIndex:          uint64(t.ProposalKey.KeyIndex),
		ProposalKeySequenceNumber: t.ProposalKey.SequenceNumber,
		Payer:                     t.Payer.Bytes(),
		Authorizers:               authorizers,
	}
}

type payloadCanonicalForm struct {
	Script                    []byte
	Arguments                 [][]byte
	ReferenceBlockID          []byte
	GasLimit                  uint64
	ProposalKeyAddress        []byte
	ProposalKeyIndex          uint64
	ProposalKeySequenceNumber uint64
	Payer                     []byte
	Authorizers               [][]byte
}

```