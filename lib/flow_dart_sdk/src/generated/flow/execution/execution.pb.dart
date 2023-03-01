///
//  Generated code. Do not modify.
//  source: flow/execution/execution.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../entities/account.pb.dart' as $9;
import '../entities/event.pb.dart' as $8;

class PingRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PingRequest', package: const $pb.PackageName('flow.execution'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  PingRequest._() : super();
  factory PingRequest() => create();
  factory PingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PingRequest clone() => PingRequest()..mergeFromMessage(this);
  PingRequest copyWith(void Function(PingRequest) updates) => super.copyWith((message) => updates(message as PingRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PingRequest create() => PingRequest._();
  PingRequest createEmptyInstance() => create();
  static $pb.PbList<PingRequest> createRepeated() => $pb.PbList<PingRequest>();
  @$core.pragma('dart2js:noInline')
  static PingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PingRequest>(create);
  static PingRequest _defaultInstance;
}

class PingResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PingResponse', package: const $pb.PackageName('flow.execution'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  PingResponse._() : super();
  factory PingResponse() => create();
  factory PingResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PingResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PingResponse clone() => PingResponse()..mergeFromMessage(this);
  PingResponse copyWith(void Function(PingResponse) updates) => super.copyWith((message) => updates(message as PingResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PingResponse create() => PingResponse._();
  PingResponse createEmptyInstance() => create();
  static $pb.PbList<PingResponse> createRepeated() => $pb.PbList<PingResponse>();
  @$core.pragma('dart2js:noInline')
  static PingResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PingResponse>(create);
  static PingResponse _defaultInstance;
}

class GetAccountAtBlockIDRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetAccountAtBlockIDRequest', package: const $pb.PackageName('flow.execution'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'blockId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'address', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  GetAccountAtBlockIDRequest._() : super();
  factory GetAccountAtBlockIDRequest() => create();
  factory GetAccountAtBlockIDRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAccountAtBlockIDRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetAccountAtBlockIDRequest clone() => GetAccountAtBlockIDRequest()..mergeFromMessage(this);
  GetAccountAtBlockIDRequest copyWith(void Function(GetAccountAtBlockIDRequest) updates) => super.copyWith((message) => updates(message as GetAccountAtBlockIDRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetAccountAtBlockIDRequest create() => GetAccountAtBlockIDRequest._();
  GetAccountAtBlockIDRequest createEmptyInstance() => create();
  static $pb.PbList<GetAccountAtBlockIDRequest> createRepeated() => $pb.PbList<GetAccountAtBlockIDRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAccountAtBlockIDRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAccountAtBlockIDRequest>(create);
  static GetAccountAtBlockIDRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get blockId => $_getN(0);
  @$pb.TagNumber(1)
  set blockId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlockId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlockId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get address => $_getN(1);
  @$pb.TagNumber(2)
  set address($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => clearField(2);
}

class GetAccountAtBlockIDResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetAccountAtBlockIDResponse', package: const $pb.PackageName('flow.execution'), createEmptyInstance: create)
    ..aOM<$9.Account>(1, 'account', subBuilder: $9.Account.create)
    ..hasRequiredFields = false
  ;

  GetAccountAtBlockIDResponse._() : super();
  factory GetAccountAtBlockIDResponse() => create();
  factory GetAccountAtBlockIDResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAccountAtBlockIDResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetAccountAtBlockIDResponse clone() => GetAccountAtBlockIDResponse()..mergeFromMessage(this);
  GetAccountAtBlockIDResponse copyWith(void Function(GetAccountAtBlockIDResponse) updates) => super.copyWith((message) => updates(message as GetAccountAtBlockIDResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetAccountAtBlockIDResponse create() => GetAccountAtBlockIDResponse._();
  GetAccountAtBlockIDResponse createEmptyInstance() => create();
  static $pb.PbList<GetAccountAtBlockIDResponse> createRepeated() => $pb.PbList<GetAccountAtBlockIDResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAccountAtBlockIDResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAccountAtBlockIDResponse>(create);
  static GetAccountAtBlockIDResponse _defaultInstance;

  @$pb.TagNumber(1)
  $9.Account get account => $_getN(0);
  @$pb.TagNumber(1)
  set account($9.Account v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);
  @$pb.TagNumber(1)
  $9.Account ensureAccount() => $_ensure(0);
}

class ExecuteScriptAtBlockIDRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ExecuteScriptAtBlockIDRequest', package: const $pb.PackageName('flow.execution'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'blockId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'script', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(3, 'arguments', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  ExecuteScriptAtBlockIDRequest._() : super();
  factory ExecuteScriptAtBlockIDRequest() => create();
  factory ExecuteScriptAtBlockIDRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExecuteScriptAtBlockIDRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ExecuteScriptAtBlockIDRequest clone() => ExecuteScriptAtBlockIDRequest()..mergeFromMessage(this);
  ExecuteScriptAtBlockIDRequest copyWith(void Function(ExecuteScriptAtBlockIDRequest) updates) => super.copyWith((message) => updates(message as ExecuteScriptAtBlockIDRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExecuteScriptAtBlockIDRequest create() => ExecuteScriptAtBlockIDRequest._();
  ExecuteScriptAtBlockIDRequest createEmptyInstance() => create();
  static $pb.PbList<ExecuteScriptAtBlockIDRequest> createRepeated() => $pb.PbList<ExecuteScriptAtBlockIDRequest>();
  @$core.pragma('dart2js:noInline')
  static ExecuteScriptAtBlockIDRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExecuteScriptAtBlockIDRequest>(create);
  static ExecuteScriptAtBlockIDRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get blockId => $_getN(0);
  @$pb.TagNumber(1)
  set blockId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlockId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlockId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get script => $_getN(1);
  @$pb.TagNumber(2)
  set script($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasScript() => $_has(1);
  @$pb.TagNumber(2)
  void clearScript() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.List<$core.int>> get arguments => $_getList(2);
}

class ExecuteScriptAtBlockIDResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ExecuteScriptAtBlockIDResponse', package: const $pb.PackageName('flow.execution'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  ExecuteScriptAtBlockIDResponse._() : super();
  factory ExecuteScriptAtBlockIDResponse() => create();
  factory ExecuteScriptAtBlockIDResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExecuteScriptAtBlockIDResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ExecuteScriptAtBlockIDResponse clone() => ExecuteScriptAtBlockIDResponse()..mergeFromMessage(this);
  ExecuteScriptAtBlockIDResponse copyWith(void Function(ExecuteScriptAtBlockIDResponse) updates) => super.copyWith((message) => updates(message as ExecuteScriptAtBlockIDResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExecuteScriptAtBlockIDResponse create() => ExecuteScriptAtBlockIDResponse._();
  ExecuteScriptAtBlockIDResponse createEmptyInstance() => create();
  static $pb.PbList<ExecuteScriptAtBlockIDResponse> createRepeated() => $pb.PbList<ExecuteScriptAtBlockIDResponse>();
  @$core.pragma('dart2js:noInline')
  static ExecuteScriptAtBlockIDResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExecuteScriptAtBlockIDResponse>(create);
  static ExecuteScriptAtBlockIDResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class GetEventsForBlockIDsResponse_Result extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetEventsForBlockIDsResponse.Result', package: const $pb.PackageName('flow.execution'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'blockId', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(2, 'blockHeight', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..pc<$8.Event>(3, 'events', $pb.PbFieldType.PM, subBuilder: $8.Event.create)
    ..hasRequiredFields = false
  ;

  GetEventsForBlockIDsResponse_Result._() : super();
  factory GetEventsForBlockIDsResponse_Result() => create();
  factory GetEventsForBlockIDsResponse_Result.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetEventsForBlockIDsResponse_Result.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetEventsForBlockIDsResponse_Result clone() => GetEventsForBlockIDsResponse_Result()..mergeFromMessage(this);
  GetEventsForBlockIDsResponse_Result copyWith(void Function(GetEventsForBlockIDsResponse_Result) updates) => super.copyWith((message) => updates(message as GetEventsForBlockIDsResponse_Result));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetEventsForBlockIDsResponse_Result create() => GetEventsForBlockIDsResponse_Result._();
  GetEventsForBlockIDsResponse_Result createEmptyInstance() => create();
  static $pb.PbList<GetEventsForBlockIDsResponse_Result> createRepeated() => $pb.PbList<GetEventsForBlockIDsResponse_Result>();
  @$core.pragma('dart2js:noInline')
  static GetEventsForBlockIDsResponse_Result getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetEventsForBlockIDsResponse_Result>(create);
  static GetEventsForBlockIDsResponse_Result _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get blockId => $_getN(0);
  @$pb.TagNumber(1)
  set blockId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlockId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlockId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get blockHeight => $_getI64(1);
  @$pb.TagNumber(2)
  set blockHeight($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlockHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlockHeight() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$8.Event> get events => $_getList(2);
}

class GetEventsForBlockIDsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetEventsForBlockIDsResponse', package: const $pb.PackageName('flow.execution'), createEmptyInstance: create)
    ..pc<GetEventsForBlockIDsResponse_Result>(1, 'results', $pb.PbFieldType.PM, subBuilder: GetEventsForBlockIDsResponse_Result.create)
    ..hasRequiredFields = false
  ;

  GetEventsForBlockIDsResponse._() : super();
  factory GetEventsForBlockIDsResponse() => create();
  factory GetEventsForBlockIDsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetEventsForBlockIDsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetEventsForBlockIDsResponse clone() => GetEventsForBlockIDsResponse()..mergeFromMessage(this);
  GetEventsForBlockIDsResponse copyWith(void Function(GetEventsForBlockIDsResponse) updates) => super.copyWith((message) => updates(message as GetEventsForBlockIDsResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetEventsForBlockIDsResponse create() => GetEventsForBlockIDsResponse._();
  GetEventsForBlockIDsResponse createEmptyInstance() => create();
  static $pb.PbList<GetEventsForBlockIDsResponse> createRepeated() => $pb.PbList<GetEventsForBlockIDsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetEventsForBlockIDsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetEventsForBlockIDsResponse>(create);
  static GetEventsForBlockIDsResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<GetEventsForBlockIDsResponse_Result> get results => $_getList(0);
}

class GetEventsForBlockIDsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetEventsForBlockIDsRequest', package: const $pb.PackageName('flow.execution'), createEmptyInstance: create)
    ..aOS(1, 'type')
    ..p<$core.List<$core.int>>(2, 'blockIds', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  GetEventsForBlockIDsRequest._() : super();
  factory GetEventsForBlockIDsRequest() => create();
  factory GetEventsForBlockIDsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetEventsForBlockIDsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetEventsForBlockIDsRequest clone() => GetEventsForBlockIDsRequest()..mergeFromMessage(this);
  GetEventsForBlockIDsRequest copyWith(void Function(GetEventsForBlockIDsRequest) updates) => super.copyWith((message) => updates(message as GetEventsForBlockIDsRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetEventsForBlockIDsRequest create() => GetEventsForBlockIDsRequest._();
  GetEventsForBlockIDsRequest createEmptyInstance() => create();
  static $pb.PbList<GetEventsForBlockIDsRequest> createRepeated() => $pb.PbList<GetEventsForBlockIDsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetEventsForBlockIDsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetEventsForBlockIDsRequest>(create);
  static GetEventsForBlockIDsRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get blockIds => $_getList(1);
}

class GetTransactionResultRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetTransactionResultRequest', package: const $pb.PackageName('flow.execution'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'blockId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'transactionId', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  GetTransactionResultRequest._() : super();
  factory GetTransactionResultRequest() => create();
  factory GetTransactionResultRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTransactionResultRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetTransactionResultRequest clone() => GetTransactionResultRequest()..mergeFromMessage(this);
  GetTransactionResultRequest copyWith(void Function(GetTransactionResultRequest) updates) => super.copyWith((message) => updates(message as GetTransactionResultRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTransactionResultRequest create() => GetTransactionResultRequest._();
  GetTransactionResultRequest createEmptyInstance() => create();
  static $pb.PbList<GetTransactionResultRequest> createRepeated() => $pb.PbList<GetTransactionResultRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTransactionResultRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTransactionResultRequest>(create);
  static GetTransactionResultRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get blockId => $_getN(0);
  @$pb.TagNumber(1)
  set blockId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlockId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlockId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get transactionId => $_getN(1);
  @$pb.TagNumber(2)
  set transactionId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTransactionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransactionId() => clearField(2);
}

class GetTransactionResultResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetTransactionResultResponse', package: const $pb.PackageName('flow.execution'), createEmptyInstance: create)
    ..a<$core.int>(1, 'statusCode', $pb.PbFieldType.OU3)
    ..aOS(2, 'errorMessage')
    ..pc<$8.Event>(3, 'events', $pb.PbFieldType.PM, subBuilder: $8.Event.create)
    ..hasRequiredFields = false
  ;

  GetTransactionResultResponse._() : super();
  factory GetTransactionResultResponse() => create();
  factory GetTransactionResultResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTransactionResultResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetTransactionResultResponse clone() => GetTransactionResultResponse()..mergeFromMessage(this);
  GetTransactionResultResponse copyWith(void Function(GetTransactionResultResponse) updates) => super.copyWith((message) => updates(message as GetTransactionResultResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTransactionResultResponse create() => GetTransactionResultResponse._();
  GetTransactionResultResponse createEmptyInstance() => create();
  static $pb.PbList<GetTransactionResultResponse> createRepeated() => $pb.PbList<GetTransactionResultResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTransactionResultResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTransactionResultResponse>(create);
  static GetTransactionResultResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get statusCode => $_getIZ(0);
  @$pb.TagNumber(1)
  set statusCode($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatusCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatusCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get errorMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorMessage($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasErrorMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$8.Event> get events => $_getList(2);
}

