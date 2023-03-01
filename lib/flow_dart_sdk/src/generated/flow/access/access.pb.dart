///
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../timestamp.pb.dart' as $2;
import '../entities/account.pb.dart' as $9;
import '../entities/block.pb.dart' as $6;
import '../entities/block_header.pb.dart' as $5;
import '../entities/collection.pb.dart' as $3;
import '../entities/event.pb.dart' as $8;
import '../entities/transaction.pb.dart' as $7;
import '../entities/transaction.pbenum.dart' as $7;

class PingRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PingRequest', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PingResponse', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
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

class GetLatestBlockHeaderRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetLatestBlockHeaderRequest', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..aOB(1, 'isSealed')
    ..hasRequiredFields = false
  ;

  GetLatestBlockHeaderRequest._() : super();
  factory GetLatestBlockHeaderRequest() => create();
  factory GetLatestBlockHeaderRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLatestBlockHeaderRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetLatestBlockHeaderRequest clone() => GetLatestBlockHeaderRequest()..mergeFromMessage(this);
  GetLatestBlockHeaderRequest copyWith(void Function(GetLatestBlockHeaderRequest) updates) => super.copyWith((message) => updates(message as GetLatestBlockHeaderRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetLatestBlockHeaderRequest create() => GetLatestBlockHeaderRequest._();
  GetLatestBlockHeaderRequest createEmptyInstance() => create();
  static $pb.PbList<GetLatestBlockHeaderRequest> createRepeated() => $pb.PbList<GetLatestBlockHeaderRequest>();
  @$core.pragma('dart2js:noInline')
  static GetLatestBlockHeaderRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLatestBlockHeaderRequest>(create);
  static GetLatestBlockHeaderRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isSealed => $_getBF(0);
  @$pb.TagNumber(1)
  set isSealed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsSealed() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsSealed() => clearField(1);
}

class GetBlockHeaderByIDRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetBlockHeaderByIDRequest', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'id', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  GetBlockHeaderByIDRequest._() : super();
  factory GetBlockHeaderByIDRequest() => create();
  factory GetBlockHeaderByIDRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBlockHeaderByIDRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetBlockHeaderByIDRequest clone() => GetBlockHeaderByIDRequest()..mergeFromMessage(this);
  GetBlockHeaderByIDRequest copyWith(void Function(GetBlockHeaderByIDRequest) updates) => super.copyWith((message) => updates(message as GetBlockHeaderByIDRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBlockHeaderByIDRequest create() => GetBlockHeaderByIDRequest._();
  GetBlockHeaderByIDRequest createEmptyInstance() => create();
  static $pb.PbList<GetBlockHeaderByIDRequest> createRepeated() => $pb.PbList<GetBlockHeaderByIDRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBlockHeaderByIDRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBlockHeaderByIDRequest>(create);
  static GetBlockHeaderByIDRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetBlockHeaderByHeightRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetBlockHeaderByHeightRequest', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, 'height', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  GetBlockHeaderByHeightRequest._() : super();
  factory GetBlockHeaderByHeightRequest() => create();
  factory GetBlockHeaderByHeightRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBlockHeaderByHeightRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetBlockHeaderByHeightRequest clone() => GetBlockHeaderByHeightRequest()..mergeFromMessage(this);
  GetBlockHeaderByHeightRequest copyWith(void Function(GetBlockHeaderByHeightRequest) updates) => super.copyWith((message) => updates(message as GetBlockHeaderByHeightRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBlockHeaderByHeightRequest create() => GetBlockHeaderByHeightRequest._();
  GetBlockHeaderByHeightRequest createEmptyInstance() => create();
  static $pb.PbList<GetBlockHeaderByHeightRequest> createRepeated() => $pb.PbList<GetBlockHeaderByHeightRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBlockHeaderByHeightRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBlockHeaderByHeightRequest>(create);
  static GetBlockHeaderByHeightRequest _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get height => $_getI64(0);
  @$pb.TagNumber(1)
  set height($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeight() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeight() => clearField(1);
}

class BlockHeaderResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BlockHeaderResponse', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..aOM<$5.BlockHeader>(1, 'block', subBuilder: $5.BlockHeader.create)
    ..hasRequiredFields = false
  ;

  BlockHeaderResponse._() : super();
  factory BlockHeaderResponse() => create();
  factory BlockHeaderResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockHeaderResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BlockHeaderResponse clone() => BlockHeaderResponse()..mergeFromMessage(this);
  BlockHeaderResponse copyWith(void Function(BlockHeaderResponse) updates) => super.copyWith((message) => updates(message as BlockHeaderResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BlockHeaderResponse create() => BlockHeaderResponse._();
  BlockHeaderResponse createEmptyInstance() => create();
  static $pb.PbList<BlockHeaderResponse> createRepeated() => $pb.PbList<BlockHeaderResponse>();
  @$core.pragma('dart2js:noInline')
  static BlockHeaderResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockHeaderResponse>(create);
  static BlockHeaderResponse _defaultInstance;

  @$pb.TagNumber(1)
  $5.BlockHeader get block => $_getN(0);
  @$pb.TagNumber(1)
  set block($5.BlockHeader v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlock() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlock() => clearField(1);
  @$pb.TagNumber(1)
  $5.BlockHeader ensureBlock() => $_ensure(0);
}

class GetLatestBlockRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetLatestBlockRequest', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..aOB(1, 'isSealed')
    ..hasRequiredFields = false
  ;

  GetLatestBlockRequest._() : super();
  factory GetLatestBlockRequest() => create();
  factory GetLatestBlockRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLatestBlockRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetLatestBlockRequest clone() => GetLatestBlockRequest()..mergeFromMessage(this);
  GetLatestBlockRequest copyWith(void Function(GetLatestBlockRequest) updates) => super.copyWith((message) => updates(message as GetLatestBlockRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetLatestBlockRequest create() => GetLatestBlockRequest._();
  GetLatestBlockRequest createEmptyInstance() => create();
  static $pb.PbList<GetLatestBlockRequest> createRepeated() => $pb.PbList<GetLatestBlockRequest>();
  @$core.pragma('dart2js:noInline')
  static GetLatestBlockRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLatestBlockRequest>(create);
  static GetLatestBlockRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isSealed => $_getBF(0);
  @$pb.TagNumber(1)
  set isSealed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsSealed() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsSealed() => clearField(1);
}

class GetBlockByIDRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetBlockByIDRequest', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'id', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  GetBlockByIDRequest._() : super();
  factory GetBlockByIDRequest() => create();
  factory GetBlockByIDRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBlockByIDRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetBlockByIDRequest clone() => GetBlockByIDRequest()..mergeFromMessage(this);
  GetBlockByIDRequest copyWith(void Function(GetBlockByIDRequest) updates) => super.copyWith((message) => updates(message as GetBlockByIDRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBlockByIDRequest create() => GetBlockByIDRequest._();
  GetBlockByIDRequest createEmptyInstance() => create();
  static $pb.PbList<GetBlockByIDRequest> createRepeated() => $pb.PbList<GetBlockByIDRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBlockByIDRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBlockByIDRequest>(create);
  static GetBlockByIDRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetBlockByHeightRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetBlockByHeightRequest', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, 'height', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  GetBlockByHeightRequest._() : super();
  factory GetBlockByHeightRequest() => create();
  factory GetBlockByHeightRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBlockByHeightRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetBlockByHeightRequest clone() => GetBlockByHeightRequest()..mergeFromMessage(this);
  GetBlockByHeightRequest copyWith(void Function(GetBlockByHeightRequest) updates) => super.copyWith((message) => updates(message as GetBlockByHeightRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBlockByHeightRequest create() => GetBlockByHeightRequest._();
  GetBlockByHeightRequest createEmptyInstance() => create();
  static $pb.PbList<GetBlockByHeightRequest> createRepeated() => $pb.PbList<GetBlockByHeightRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBlockByHeightRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBlockByHeightRequest>(create);
  static GetBlockByHeightRequest _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get height => $_getI64(0);
  @$pb.TagNumber(1)
  set height($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeight() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeight() => clearField(1);
}

class BlockResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BlockResponse', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..aOM<$6.Block>(1, 'block', subBuilder: $6.Block.create)
    ..hasRequiredFields = false
  ;

  BlockResponse._() : super();
  factory BlockResponse() => create();
  factory BlockResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BlockResponse clone() => BlockResponse()..mergeFromMessage(this);
  BlockResponse copyWith(void Function(BlockResponse) updates) => super.copyWith((message) => updates(message as BlockResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BlockResponse create() => BlockResponse._();
  BlockResponse createEmptyInstance() => create();
  static $pb.PbList<BlockResponse> createRepeated() => $pb.PbList<BlockResponse>();
  @$core.pragma('dart2js:noInline')
  static BlockResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockResponse>(create);
  static BlockResponse _defaultInstance;

  @$pb.TagNumber(1)
  $6.Block get block => $_getN(0);
  @$pb.TagNumber(1)
  set block($6.Block v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlock() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlock() => clearField(1);
  @$pb.TagNumber(1)
  $6.Block ensureBlock() => $_ensure(0);
}

class GetCollectionByIDRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetCollectionByIDRequest', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'id', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  GetCollectionByIDRequest._() : super();
  factory GetCollectionByIDRequest() => create();
  factory GetCollectionByIDRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCollectionByIDRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetCollectionByIDRequest clone() => GetCollectionByIDRequest()..mergeFromMessage(this);
  GetCollectionByIDRequest copyWith(void Function(GetCollectionByIDRequest) updates) => super.copyWith((message) => updates(message as GetCollectionByIDRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetCollectionByIDRequest create() => GetCollectionByIDRequest._();
  GetCollectionByIDRequest createEmptyInstance() => create();
  static $pb.PbList<GetCollectionByIDRequest> createRepeated() => $pb.PbList<GetCollectionByIDRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCollectionByIDRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCollectionByIDRequest>(create);
  static GetCollectionByIDRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class CollectionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CollectionResponse', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..aOM<$3.Collection>(1, 'collection', subBuilder: $3.Collection.create)
    ..hasRequiredFields = false
  ;

  CollectionResponse._() : super();
  factory CollectionResponse() => create();
  factory CollectionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CollectionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CollectionResponse clone() => CollectionResponse()..mergeFromMessage(this);
  CollectionResponse copyWith(void Function(CollectionResponse) updates) => super.copyWith((message) => updates(message as CollectionResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CollectionResponse create() => CollectionResponse._();
  CollectionResponse createEmptyInstance() => create();
  static $pb.PbList<CollectionResponse> createRepeated() => $pb.PbList<CollectionResponse>();
  @$core.pragma('dart2js:noInline')
  static CollectionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CollectionResponse>(create);
  static CollectionResponse _defaultInstance;

  @$pb.TagNumber(1)
  $3.Collection get collection => $_getN(0);
  @$pb.TagNumber(1)
  set collection($3.Collection v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCollection() => $_has(0);
  @$pb.TagNumber(1)
  void clearCollection() => clearField(1);
  @$pb.TagNumber(1)
  $3.Collection ensureCollection() => $_ensure(0);
}

class SendTransactionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SendTransactionRequest', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..aOM<$7.Transaction>(1, 'transaction', subBuilder: $7.Transaction.create)
    ..hasRequiredFields = false
  ;

  SendTransactionRequest._() : super();
  factory SendTransactionRequest() => create();
  factory SendTransactionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendTransactionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SendTransactionRequest clone() => SendTransactionRequest()..mergeFromMessage(this);
  SendTransactionRequest copyWith(void Function(SendTransactionRequest) updates) => super.copyWith((message) => updates(message as SendTransactionRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendTransactionRequest create() => SendTransactionRequest._();
  SendTransactionRequest createEmptyInstance() => create();
  static $pb.PbList<SendTransactionRequest> createRepeated() => $pb.PbList<SendTransactionRequest>();
  @$core.pragma('dart2js:noInline')
  static SendTransactionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendTransactionRequest>(create);
  static SendTransactionRequest _defaultInstance;

  @$pb.TagNumber(1)
  $7.Transaction get transaction => $_getN(0);
  @$pb.TagNumber(1)
  set transaction($7.Transaction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransaction() => clearField(1);
  @$pb.TagNumber(1)
  $7.Transaction ensureTransaction() => $_ensure(0);
}

class SendTransactionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SendTransactionResponse', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'id', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  SendTransactionResponse._() : super();
  factory SendTransactionResponse() => create();
  factory SendTransactionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendTransactionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SendTransactionResponse clone() => SendTransactionResponse()..mergeFromMessage(this);
  SendTransactionResponse copyWith(void Function(SendTransactionResponse) updates) => super.copyWith((message) => updates(message as SendTransactionResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SendTransactionResponse create() => SendTransactionResponse._();
  SendTransactionResponse createEmptyInstance() => create();
  static $pb.PbList<SendTransactionResponse> createRepeated() => $pb.PbList<SendTransactionResponse>();
  @$core.pragma('dart2js:noInline')
  static SendTransactionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendTransactionResponse>(create);
  static SendTransactionResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class GetTransactionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetTransactionRequest', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'id', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  GetTransactionRequest._() : super();
  factory GetTransactionRequest() => create();
  factory GetTransactionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTransactionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetTransactionRequest clone() => GetTransactionRequest()..mergeFromMessage(this);
  GetTransactionRequest copyWith(void Function(GetTransactionRequest) updates) => super.copyWith((message) => updates(message as GetTransactionRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTransactionRequest create() => GetTransactionRequest._();
  GetTransactionRequest createEmptyInstance() => create();
  static $pb.PbList<GetTransactionRequest> createRepeated() => $pb.PbList<GetTransactionRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTransactionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTransactionRequest>(create);
  static GetTransactionRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class TransactionResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransactionResponse', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..aOM<$7.Transaction>(1, 'transaction', subBuilder: $7.Transaction.create)
    ..hasRequiredFields = false
  ;

  TransactionResponse._() : super();
  factory TransactionResponse() => create();
  factory TransactionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransactionResponse clone() => TransactionResponse()..mergeFromMessage(this);
  TransactionResponse copyWith(void Function(TransactionResponse) updates) => super.copyWith((message) => updates(message as TransactionResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionResponse create() => TransactionResponse._();
  TransactionResponse createEmptyInstance() => create();
  static $pb.PbList<TransactionResponse> createRepeated() => $pb.PbList<TransactionResponse>();
  @$core.pragma('dart2js:noInline')
  static TransactionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionResponse>(create);
  static TransactionResponse _defaultInstance;

  @$pb.TagNumber(1)
  $7.Transaction get transaction => $_getN(0);
  @$pb.TagNumber(1)
  set transaction($7.Transaction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransaction() => clearField(1);
  @$pb.TagNumber(1)
  $7.Transaction ensureTransaction() => $_ensure(0);
}

class TransactionResultResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TransactionResultResponse', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..e<$7.TransactionStatus>(1, 'status', $pb.PbFieldType.OE, defaultOrMaker: $7.TransactionStatus.UNKNOWN, valueOf: $7.TransactionStatus.valueOf, enumValues: $7.TransactionStatus.values)
    ..a<$core.int>(2, 'statusCode', $pb.PbFieldType.OU3)
    ..aOS(3, 'errorMessage')
    ..pc<$8.Event>(4, 'events', $pb.PbFieldType.PM, subBuilder: $8.Event.create)
    ..hasRequiredFields = false
  ;

  TransactionResultResponse._() : super();
  factory TransactionResultResponse() => create();
  factory TransactionResultResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionResultResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TransactionResultResponse clone() => TransactionResultResponse()..mergeFromMessage(this);
  TransactionResultResponse copyWith(void Function(TransactionResultResponse) updates) => super.copyWith((message) => updates(message as TransactionResultResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TransactionResultResponse create() => TransactionResultResponse._();
  TransactionResultResponse createEmptyInstance() => create();
  static $pb.PbList<TransactionResultResponse> createRepeated() => $pb.PbList<TransactionResultResponse>();
  @$core.pragma('dart2js:noInline')
  static TransactionResultResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionResultResponse>(create);
  static TransactionResultResponse _defaultInstance;

  @$pb.TagNumber(1)
  $7.TransactionStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status($7.TransactionStatus v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get statusCode => $_getIZ(1);
  @$pb.TagNumber(2)
  set statusCode($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatusCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatusCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get errorMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set errorMessage($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasErrorMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$8.Event> get events => $_getList(3);
}

class GetAccountRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetAccountRequest', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'address', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  GetAccountRequest._() : super();
  factory GetAccountRequest() => create();
  factory GetAccountRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAccountRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetAccountRequest clone() => GetAccountRequest()..mergeFromMessage(this);
  GetAccountRequest copyWith(void Function(GetAccountRequest) updates) => super.copyWith((message) => updates(message as GetAccountRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetAccountRequest create() => GetAccountRequest._();
  GetAccountRequest createEmptyInstance() => create();
  static $pb.PbList<GetAccountRequest> createRepeated() => $pb.PbList<GetAccountRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAccountRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAccountRequest>(create);
  static GetAccountRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
}

class GetAccountResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetAccountResponse', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..aOM<$9.Account>(1, 'account', subBuilder: $9.Account.create)
    ..hasRequiredFields = false
  ;

  GetAccountResponse._() : super();
  factory GetAccountResponse() => create();
  factory GetAccountResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAccountResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetAccountResponse clone() => GetAccountResponse()..mergeFromMessage(this);
  GetAccountResponse copyWith(void Function(GetAccountResponse) updates) => super.copyWith((message) => updates(message as GetAccountResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetAccountResponse create() => GetAccountResponse._();
  GetAccountResponse createEmptyInstance() => create();
  static $pb.PbList<GetAccountResponse> createRepeated() => $pb.PbList<GetAccountResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAccountResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAccountResponse>(create);
  static GetAccountResponse _defaultInstance;

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

class GetAccountAtLatestBlockRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetAccountAtLatestBlockRequest', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'address', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  GetAccountAtLatestBlockRequest._() : super();
  factory GetAccountAtLatestBlockRequest() => create();
  factory GetAccountAtLatestBlockRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAccountAtLatestBlockRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetAccountAtLatestBlockRequest clone() => GetAccountAtLatestBlockRequest()..mergeFromMessage(this);
  GetAccountAtLatestBlockRequest copyWith(void Function(GetAccountAtLatestBlockRequest) updates) => super.copyWith((message) => updates(message as GetAccountAtLatestBlockRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetAccountAtLatestBlockRequest create() => GetAccountAtLatestBlockRequest._();
  GetAccountAtLatestBlockRequest createEmptyInstance() => create();
  static $pb.PbList<GetAccountAtLatestBlockRequest> createRepeated() => $pb.PbList<GetAccountAtLatestBlockRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAccountAtLatestBlockRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAccountAtLatestBlockRequest>(create);
  static GetAccountAtLatestBlockRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
}

class AccountResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AccountResponse', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..aOM<$9.Account>(1, 'account', subBuilder: $9.Account.create)
    ..hasRequiredFields = false
  ;

  AccountResponse._() : super();
  factory AccountResponse() => create();
  factory AccountResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AccountResponse clone() => AccountResponse()..mergeFromMessage(this);
  AccountResponse copyWith(void Function(AccountResponse) updates) => super.copyWith((message) => updates(message as AccountResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountResponse create() => AccountResponse._();
  AccountResponse createEmptyInstance() => create();
  static $pb.PbList<AccountResponse> createRepeated() => $pb.PbList<AccountResponse>();
  @$core.pragma('dart2js:noInline')
  static AccountResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountResponse>(create);
  static AccountResponse _defaultInstance;

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

class GetAccountAtBlockHeightRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetAccountAtBlockHeightRequest', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'address', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(2, 'blockHeight', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  GetAccountAtBlockHeightRequest._() : super();
  factory GetAccountAtBlockHeightRequest() => create();
  factory GetAccountAtBlockHeightRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAccountAtBlockHeightRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetAccountAtBlockHeightRequest clone() => GetAccountAtBlockHeightRequest()..mergeFromMessage(this);
  GetAccountAtBlockHeightRequest copyWith(void Function(GetAccountAtBlockHeightRequest) updates) => super.copyWith((message) => updates(message as GetAccountAtBlockHeightRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetAccountAtBlockHeightRequest create() => GetAccountAtBlockHeightRequest._();
  GetAccountAtBlockHeightRequest createEmptyInstance() => create();
  static $pb.PbList<GetAccountAtBlockHeightRequest> createRepeated() => $pb.PbList<GetAccountAtBlockHeightRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAccountAtBlockHeightRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAccountAtBlockHeightRequest>(create);
  static GetAccountAtBlockHeightRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get blockHeight => $_getI64(1);
  @$pb.TagNumber(2)
  set blockHeight($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlockHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlockHeight() => clearField(2);
}

class ExecuteScriptAtLatestBlockRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ExecuteScriptAtLatestBlockRequest', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'script', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(2, 'arguments', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  ExecuteScriptAtLatestBlockRequest._() : super();
  factory ExecuteScriptAtLatestBlockRequest() => create();
  factory ExecuteScriptAtLatestBlockRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExecuteScriptAtLatestBlockRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ExecuteScriptAtLatestBlockRequest clone() => ExecuteScriptAtLatestBlockRequest()..mergeFromMessage(this);
  ExecuteScriptAtLatestBlockRequest copyWith(void Function(ExecuteScriptAtLatestBlockRequest) updates) => super.copyWith((message) => updates(message as ExecuteScriptAtLatestBlockRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExecuteScriptAtLatestBlockRequest create() => ExecuteScriptAtLatestBlockRequest._();
  ExecuteScriptAtLatestBlockRequest createEmptyInstance() => create();
  static $pb.PbList<ExecuteScriptAtLatestBlockRequest> createRepeated() => $pb.PbList<ExecuteScriptAtLatestBlockRequest>();
  @$core.pragma('dart2js:noInline')
  static ExecuteScriptAtLatestBlockRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExecuteScriptAtLatestBlockRequest>(create);
  static ExecuteScriptAtLatestBlockRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get script => $_getN(0);
  @$pb.TagNumber(1)
  set script($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasScript() => $_has(0);
  @$pb.TagNumber(1)
  void clearScript() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get arguments => $_getList(1);
}

class ExecuteScriptAtBlockIDRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ExecuteScriptAtBlockIDRequest', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
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

class ExecuteScriptAtBlockHeightRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ExecuteScriptAtBlockHeightRequest', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, 'blockHeight', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(2, 'script', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(3, 'arguments', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  ExecuteScriptAtBlockHeightRequest._() : super();
  factory ExecuteScriptAtBlockHeightRequest() => create();
  factory ExecuteScriptAtBlockHeightRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExecuteScriptAtBlockHeightRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ExecuteScriptAtBlockHeightRequest clone() => ExecuteScriptAtBlockHeightRequest()..mergeFromMessage(this);
  ExecuteScriptAtBlockHeightRequest copyWith(void Function(ExecuteScriptAtBlockHeightRequest) updates) => super.copyWith((message) => updates(message as ExecuteScriptAtBlockHeightRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExecuteScriptAtBlockHeightRequest create() => ExecuteScriptAtBlockHeightRequest._();
  ExecuteScriptAtBlockHeightRequest createEmptyInstance() => create();
  static $pb.PbList<ExecuteScriptAtBlockHeightRequest> createRepeated() => $pb.PbList<ExecuteScriptAtBlockHeightRequest>();
  @$core.pragma('dart2js:noInline')
  static ExecuteScriptAtBlockHeightRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExecuteScriptAtBlockHeightRequest>(create);
  static ExecuteScriptAtBlockHeightRequest _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get blockHeight => $_getI64(0);
  @$pb.TagNumber(1)
  set blockHeight($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlockHeight() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlockHeight() => clearField(1);

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

class ExecuteScriptResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ExecuteScriptResponse', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  ExecuteScriptResponse._() : super();
  factory ExecuteScriptResponse() => create();
  factory ExecuteScriptResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExecuteScriptResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ExecuteScriptResponse clone() => ExecuteScriptResponse()..mergeFromMessage(this);
  ExecuteScriptResponse copyWith(void Function(ExecuteScriptResponse) updates) => super.copyWith((message) => updates(message as ExecuteScriptResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ExecuteScriptResponse create() => ExecuteScriptResponse._();
  ExecuteScriptResponse createEmptyInstance() => create();
  static $pb.PbList<ExecuteScriptResponse> createRepeated() => $pb.PbList<ExecuteScriptResponse>();
  @$core.pragma('dart2js:noInline')
  static ExecuteScriptResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExecuteScriptResponse>(create);
  static ExecuteScriptResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get value => $_getN(0);
  @$pb.TagNumber(1)
  set value($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => clearField(1);
}

class GetEventsForHeightRangeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetEventsForHeightRangeRequest', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..aOS(1, 'type')
    ..a<$fixnum.Int64>(2, 'startHeight', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, 'endHeight', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  GetEventsForHeightRangeRequest._() : super();
  factory GetEventsForHeightRangeRequest() => create();
  factory GetEventsForHeightRangeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetEventsForHeightRangeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetEventsForHeightRangeRequest clone() => GetEventsForHeightRangeRequest()..mergeFromMessage(this);
  GetEventsForHeightRangeRequest copyWith(void Function(GetEventsForHeightRangeRequest) updates) => super.copyWith((message) => updates(message as GetEventsForHeightRangeRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetEventsForHeightRangeRequest create() => GetEventsForHeightRangeRequest._();
  GetEventsForHeightRangeRequest createEmptyInstance() => create();
  static $pb.PbList<GetEventsForHeightRangeRequest> createRepeated() => $pb.PbList<GetEventsForHeightRangeRequest>();
  @$core.pragma('dart2js:noInline')
  static GetEventsForHeightRangeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetEventsForHeightRangeRequest>(create);
  static GetEventsForHeightRangeRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get startHeight => $_getI64(1);
  @$pb.TagNumber(2)
  set startHeight($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStartHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartHeight() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get endHeight => $_getI64(2);
  @$pb.TagNumber(3)
  set endHeight($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEndHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndHeight() => clearField(3);
}

class GetEventsForBlockIDsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetEventsForBlockIDsRequest', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
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

class EventsResponse_Result extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('EventsResponse.Result', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'blockId', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(2, 'blockHeight', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..pc<$8.Event>(3, 'events', $pb.PbFieldType.PM, subBuilder: $8.Event.create)
    ..aOM<$2.Timestamp>(4, 'blockTimestamp', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  EventsResponse_Result._() : super();
  factory EventsResponse_Result() => create();
  factory EventsResponse_Result.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventsResponse_Result.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  EventsResponse_Result clone() => EventsResponse_Result()..mergeFromMessage(this);
  EventsResponse_Result copyWith(void Function(EventsResponse_Result) updates) => super.copyWith((message) => updates(message as EventsResponse_Result));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventsResponse_Result create() => EventsResponse_Result._();
  EventsResponse_Result createEmptyInstance() => create();
  static $pb.PbList<EventsResponse_Result> createRepeated() => $pb.PbList<EventsResponse_Result>();
  @$core.pragma('dart2js:noInline')
  static EventsResponse_Result getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventsResponse_Result>(create);
  static EventsResponse_Result _defaultInstance;

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

  @$pb.TagNumber(4)
  $2.Timestamp get blockTimestamp => $_getN(3);
  @$pb.TagNumber(4)
  set blockTimestamp($2.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasBlockTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearBlockTimestamp() => clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureBlockTimestamp() => $_ensure(3);
}

class EventsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('EventsResponse', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..pc<EventsResponse_Result>(1, 'results', $pb.PbFieldType.PM, subBuilder: EventsResponse_Result.create)
    ..hasRequiredFields = false
  ;

  EventsResponse._() : super();
  factory EventsResponse() => create();
  factory EventsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EventsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  EventsResponse clone() => EventsResponse()..mergeFromMessage(this);
  EventsResponse copyWith(void Function(EventsResponse) updates) => super.copyWith((message) => updates(message as EventsResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EventsResponse create() => EventsResponse._();
  EventsResponse createEmptyInstance() => create();
  static $pb.PbList<EventsResponse> createRepeated() => $pb.PbList<EventsResponse>();
  @$core.pragma('dart2js:noInline')
  static EventsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EventsResponse>(create);
  static EventsResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<EventsResponse_Result> get results => $_getList(0);
}

class GetNetworkParametersRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetNetworkParametersRequest', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  GetNetworkParametersRequest._() : super();
  factory GetNetworkParametersRequest() => create();
  factory GetNetworkParametersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNetworkParametersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetNetworkParametersRequest clone() => GetNetworkParametersRequest()..mergeFromMessage(this);
  GetNetworkParametersRequest copyWith(void Function(GetNetworkParametersRequest) updates) => super.copyWith((message) => updates(message as GetNetworkParametersRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetNetworkParametersRequest create() => GetNetworkParametersRequest._();
  GetNetworkParametersRequest createEmptyInstance() => create();
  static $pb.PbList<GetNetworkParametersRequest> createRepeated() => $pb.PbList<GetNetworkParametersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetNetworkParametersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNetworkParametersRequest>(create);
  static GetNetworkParametersRequest _defaultInstance;
}

class GetNetworkParametersResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetNetworkParametersResponse', package: const $pb.PackageName('flow.access'), createEmptyInstance: create)
    ..aOS(1, 'chainId')
    ..hasRequiredFields = false
  ;

  GetNetworkParametersResponse._() : super();
  factory GetNetworkParametersResponse() => create();
  factory GetNetworkParametersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNetworkParametersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetNetworkParametersResponse clone() => GetNetworkParametersResponse()..mergeFromMessage(this);
  GetNetworkParametersResponse copyWith(void Function(GetNetworkParametersResponse) updates) => super.copyWith((message) => updates(message as GetNetworkParametersResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetNetworkParametersResponse create() => GetNetworkParametersResponse._();
  GetNetworkParametersResponse createEmptyInstance() => create();
  static $pb.PbList<GetNetworkParametersResponse> createRepeated() => $pb.PbList<GetNetworkParametersResponse>();
  @$core.pragma('dart2js:noInline')
  static GetNetworkParametersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNetworkParametersResponse>(create);
  static GetNetworkParametersResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chainId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chainId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChainId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChainId() => clearField(1);
}

