///
//  Generated code. Do not modify.
//  source: flow/execution/execution.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const PingRequest$json = const {
  '1': 'PingRequest',
};

const PingResponse$json = const {
  '1': 'PingResponse',
};

const GetAccountAtBlockIDRequest$json = const {
  '1': 'GetAccountAtBlockIDRequest',
  '2': const [
    const {'1': 'block_id', '3': 1, '4': 1, '5': 12, '10': 'blockId'},
    const {'1': 'address', '3': 2, '4': 1, '5': 12, '10': 'address'},
  ],
};

const GetAccountAtBlockIDResponse$json = const {
  '1': 'GetAccountAtBlockIDResponse',
  '2': const [
    const {'1': 'account', '3': 1, '4': 1, '5': 11, '6': '.flow.entities.Account', '10': 'account'},
  ],
};

const ExecuteScriptAtBlockIDRequest$json = const {
  '1': 'ExecuteScriptAtBlockIDRequest',
  '2': const [
    const {'1': 'block_id', '3': 1, '4': 1, '5': 12, '10': 'blockId'},
    const {'1': 'script', '3': 2, '4': 1, '5': 12, '10': 'script'},
    const {'1': 'arguments', '3': 3, '4': 3, '5': 12, '10': 'arguments'},
  ],
};

const ExecuteScriptAtBlockIDResponse$json = const {
  '1': 'ExecuteScriptAtBlockIDResponse',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 12, '10': 'value'},
  ],
};

const GetEventsForBlockIDsResponse$json = const {
  '1': 'GetEventsForBlockIDsResponse',
  '2': const [
    const {'1': 'results', '3': 1, '4': 3, '5': 11, '6': '.flow.execution.GetEventsForBlockIDsResponse.Result', '10': 'results'},
  ],
  '3': const [GetEventsForBlockIDsResponse_Result$json],
};

const GetEventsForBlockIDsResponse_Result$json = const {
  '1': 'Result',
  '2': const [
    const {'1': 'block_id', '3': 1, '4': 1, '5': 12, '10': 'blockId'},
    const {'1': 'block_height', '3': 2, '4': 1, '5': 4, '10': 'blockHeight'},
    const {'1': 'events', '3': 3, '4': 3, '5': 11, '6': '.flow.entities.Event', '10': 'events'},
  ],
};

const GetEventsForBlockIDsRequest$json = const {
  '1': 'GetEventsForBlockIDsRequest',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'block_ids', '3': 2, '4': 3, '5': 12, '10': 'blockIds'},
  ],
};

const GetTransactionResultRequest$json = const {
  '1': 'GetTransactionResultRequest',
  '2': const [
    const {'1': 'block_id', '3': 1, '4': 1, '5': 12, '10': 'blockId'},
    const {'1': 'transaction_id', '3': 2, '4': 1, '5': 12, '10': 'transactionId'},
  ],
};

const GetTransactionResultResponse$json = const {
  '1': 'GetTransactionResultResponse',
  '2': const [
    const {'1': 'status_code', '3': 1, '4': 1, '5': 13, '10': 'statusCode'},
    const {'1': 'error_message', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
    const {'1': 'events', '3': 3, '4': 3, '5': 11, '6': '.flow.entities.Event', '10': 'events'},
  ],
};

