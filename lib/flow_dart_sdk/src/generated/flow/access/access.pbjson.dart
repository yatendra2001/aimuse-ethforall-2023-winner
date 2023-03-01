///
//  Generated code. Do not modify.
//  source: flow/access/access.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const PingRequest$json = const {
  '1': 'PingRequest',
};

const PingResponse$json = const {
  '1': 'PingResponse',
};

const GetLatestBlockHeaderRequest$json = const {
  '1': 'GetLatestBlockHeaderRequest',
  '2': const [
    const {'1': 'is_sealed', '3': 1, '4': 1, '5': 8, '10': 'isSealed'},
  ],
};

const GetBlockHeaderByIDRequest$json = const {
  '1': 'GetBlockHeaderByIDRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
  ],
};

const GetBlockHeaderByHeightRequest$json = const {
  '1': 'GetBlockHeaderByHeightRequest',
  '2': const [
    const {'1': 'height', '3': 1, '4': 1, '5': 4, '10': 'height'},
  ],
};

const BlockHeaderResponse$json = const {
  '1': 'BlockHeaderResponse',
  '2': const [
    const {'1': 'block', '3': 1, '4': 1, '5': 11, '6': '.flow.entities.BlockHeader', '10': 'block'},
  ],
};

const GetLatestBlockRequest$json = const {
  '1': 'GetLatestBlockRequest',
  '2': const [
    const {'1': 'is_sealed', '3': 1, '4': 1, '5': 8, '10': 'isSealed'},
  ],
};

const GetBlockByIDRequest$json = const {
  '1': 'GetBlockByIDRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
  ],
};

const GetBlockByHeightRequest$json = const {
  '1': 'GetBlockByHeightRequest',
  '2': const [
    const {'1': 'height', '3': 1, '4': 1, '5': 4, '10': 'height'},
  ],
};

const BlockResponse$json = const {
  '1': 'BlockResponse',
  '2': const [
    const {'1': 'block', '3': 1, '4': 1, '5': 11, '6': '.flow.entities.Block', '10': 'block'},
  ],
};

const GetCollectionByIDRequest$json = const {
  '1': 'GetCollectionByIDRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
  ],
};

const CollectionResponse$json = const {
  '1': 'CollectionResponse',
  '2': const [
    const {'1': 'collection', '3': 1, '4': 1, '5': 11, '6': '.flow.entities.Collection', '10': 'collection'},
  ],
};

const SendTransactionRequest$json = const {
  '1': 'SendTransactionRequest',
  '2': const [
    const {'1': 'transaction', '3': 1, '4': 1, '5': 11, '6': '.flow.entities.Transaction', '10': 'transaction'},
  ],
};

const SendTransactionResponse$json = const {
  '1': 'SendTransactionResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
  ],
};

const GetTransactionRequest$json = const {
  '1': 'GetTransactionRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
  ],
};

const TransactionResponse$json = const {
  '1': 'TransactionResponse',
  '2': const [
    const {'1': 'transaction', '3': 1, '4': 1, '5': 11, '6': '.flow.entities.Transaction', '10': 'transaction'},
  ],
};

const TransactionResultResponse$json = const {
  '1': 'TransactionResultResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.flow.entities.TransactionStatus', '10': 'status'},
    const {'1': 'status_code', '3': 2, '4': 1, '5': 13, '10': 'statusCode'},
    const {'1': 'error_message', '3': 3, '4': 1, '5': 9, '10': 'errorMessage'},
    const {'1': 'events', '3': 4, '4': 3, '5': 11, '6': '.flow.entities.Event', '10': 'events'},
  ],
};

const GetAccountRequest$json = const {
  '1': 'GetAccountRequest',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 12, '10': 'address'},
  ],
};

const GetAccountResponse$json = const {
  '1': 'GetAccountResponse',
  '2': const [
    const {'1': 'account', '3': 1, '4': 1, '5': 11, '6': '.flow.entities.Account', '10': 'account'},
  ],
};

const GetAccountAtLatestBlockRequest$json = const {
  '1': 'GetAccountAtLatestBlockRequest',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 12, '10': 'address'},
  ],
};

const AccountResponse$json = const {
  '1': 'AccountResponse',
  '2': const [
    const {'1': 'account', '3': 1, '4': 1, '5': 11, '6': '.flow.entities.Account', '10': 'account'},
  ],
};

const GetAccountAtBlockHeightRequest$json = const {
  '1': 'GetAccountAtBlockHeightRequest',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 12, '10': 'address'},
    const {'1': 'block_height', '3': 2, '4': 1, '5': 4, '10': 'blockHeight'},
  ],
};

const ExecuteScriptAtLatestBlockRequest$json = const {
  '1': 'ExecuteScriptAtLatestBlockRequest',
  '2': const [
    const {'1': 'script', '3': 1, '4': 1, '5': 12, '10': 'script'},
    const {'1': 'arguments', '3': 2, '4': 3, '5': 12, '10': 'arguments'},
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

const ExecuteScriptAtBlockHeightRequest$json = const {
  '1': 'ExecuteScriptAtBlockHeightRequest',
  '2': const [
    const {'1': 'block_height', '3': 1, '4': 1, '5': 4, '10': 'blockHeight'},
    const {'1': 'script', '3': 2, '4': 1, '5': 12, '10': 'script'},
    const {'1': 'arguments', '3': 3, '4': 3, '5': 12, '10': 'arguments'},
  ],
};

const ExecuteScriptResponse$json = const {
  '1': 'ExecuteScriptResponse',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 12, '10': 'value'},
  ],
};

const GetEventsForHeightRangeRequest$json = const {
  '1': 'GetEventsForHeightRangeRequest',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'start_height', '3': 2, '4': 1, '5': 4, '10': 'startHeight'},
    const {'1': 'end_height', '3': 3, '4': 1, '5': 4, '10': 'endHeight'},
  ],
};

const GetEventsForBlockIDsRequest$json = const {
  '1': 'GetEventsForBlockIDsRequest',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'block_ids', '3': 2, '4': 3, '5': 12, '10': 'blockIds'},
  ],
};

const EventsResponse$json = const {
  '1': 'EventsResponse',
  '2': const [
    const {'1': 'results', '3': 1, '4': 3, '5': 11, '6': '.access.EventsResponse.Result', '10': 'results'},
  ],
  '3': const [EventsResponse_Result$json],
};

const EventsResponse_Result$json = const {
  '1': 'Result',
  '2': const [
    const {'1': 'block_id', '3': 1, '4': 1, '5': 12, '10': 'blockId'},
    const {'1': 'block_height', '3': 2, '4': 1, '5': 4, '10': 'blockHeight'},
    const {'1': 'events', '3': 3, '4': 3, '5': 11, '6': '.flow.entities.Event', '10': 'events'},
    const {'1': 'block_timestamp', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'blockTimestamp'},
  ],
};

const GetNetworkParametersRequest$json = const {
  '1': 'GetNetworkParametersRequest',
};

const GetNetworkParametersResponse$json = const {
  '1': 'GetNetworkParametersResponse',
  '2': const [
    const {'1': 'chain_id', '3': 1, '4': 1, '5': 9, '10': 'chainId'},
  ],
};

