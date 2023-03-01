///
//  Generated code. Do not modify.
//  source: flow/entities/transaction.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const TransactionStatus$json = const {
  '1': 'TransactionStatus',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'PENDING', '2': 1},
    const {'1': 'FINALIZED', '2': 2},
    const {'1': 'EXECUTED', '2': 3},
    const {'1': 'SEALED', '2': 4},
    const {'1': 'EXPIRED', '2': 5},
  ],
};

const Transaction$json = const {
  '1': 'Transaction',
  '2': const [
    const {'1': 'script', '3': 1, '4': 1, '5': 12, '10': 'script'},
    const {'1': 'arguments', '3': 2, '4': 3, '5': 12, '10': 'arguments'},
    const {'1': 'reference_block_id', '3': 3, '4': 1, '5': 12, '10': 'referenceBlockId'},
    const {'1': 'gas_limit', '3': 4, '4': 1, '5': 4, '10': 'gasLimit'},
    const {'1': 'proposal_key', '3': 5, '4': 1, '5': 11, '6': '.flow.entities.Transaction.ProposalKey', '10': 'proposalKey'},
    const {'1': 'payer', '3': 6, '4': 1, '5': 12, '10': 'payer'},
    const {'1': 'authorizers', '3': 7, '4': 3, '5': 12, '10': 'authorizers'},
    const {'1': 'payload_signatures', '3': 8, '4': 3, '5': 11, '6': '.flow.entities.Transaction.Signature', '10': 'payloadSignatures'},
    const {'1': 'envelope_signatures', '3': 9, '4': 3, '5': 11, '6': '.flow.entities.Transaction.Signature', '10': 'envelopeSignatures'},
  ],
  '3': const [Transaction_ProposalKey$json, Transaction_Signature$json],
};

const Transaction_ProposalKey$json = const {
  '1': 'ProposalKey',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 12, '10': 'address'},
    const {'1': 'key_id', '3': 2, '4': 1, '5': 13, '10': 'keyId'},
    const {'1': 'sequence_number', '3': 3, '4': 1, '5': 4, '10': 'sequenceNumber'},
  ],
};

const Transaction_Signature$json = const {
  '1': 'Signature',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 12, '10': 'address'},
    const {'1': 'key_id', '3': 2, '4': 1, '5': 13, '10': 'keyId'},
    const {'1': 'signature', '3': 3, '4': 1, '5': 12, '10': 'signature'},
  ],
};

