///
//  Generated code. Do not modify.
//  source: flow/entities/account.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Account$json = const {
  '1': 'Account',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 12, '10': 'address'},
    const {'1': 'balance', '3': 2, '4': 1, '5': 4, '10': 'balance'},
    const {'1': 'code', '3': 3, '4': 1, '5': 12, '10': 'code'},
    const {'1': 'keys', '3': 4, '4': 3, '5': 11, '6': '.flow.entities.AccountKey', '10': 'keys'},
    const {'1': 'contracts', '3': 5, '4': 3, '5': 11, '6': '.flow.entities.Account.ContractsEntry', '10': 'contracts'},
  ],
  '3': const [Account_ContractsEntry$json],
};

const Account_ContractsEntry$json = const {
  '1': 'ContractsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': const {'7': true},
};

const AccountKey$json = const {
  '1': 'AccountKey',
  '2': const [
    const {'1': 'index', '3': 1, '4': 1, '5': 13, '10': 'index'},
    const {'1': 'public_key', '3': 2, '4': 1, '5': 12, '10': 'publicKey'},
    const {'1': 'sign_algo', '3': 3, '4': 1, '5': 13, '10': 'signAlgo'},
    const {'1': 'hash_algo', '3': 4, '4': 1, '5': 13, '10': 'hashAlgo'},
    const {'1': 'weight', '3': 5, '4': 1, '5': 13, '10': 'weight'},
    const {'1': 'sequence_number', '3': 6, '4': 1, '5': 13, '10': 'sequenceNumber'},
    const {'1': 'revoked', '3': 7, '4': 1, '5': 8, '10': 'revoked'},
  ],
};

