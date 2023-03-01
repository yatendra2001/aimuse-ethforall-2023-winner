///
//  Generated code. Do not modify.
//  source: flow/entities/block_seal.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BlockSeal extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BlockSeal', package: const $pb.PackageName('flow.entities'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'blockId', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'executionReceiptId', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(3, 'executionReceiptSignatures', $pb.PbFieldType.PY)
    ..p<$core.List<$core.int>>(4, 'resultApprovalSignatures', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  BlockSeal._() : super();
  factory BlockSeal() => create();
  factory BlockSeal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockSeal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BlockSeal clone() => BlockSeal()..mergeFromMessage(this);
  BlockSeal copyWith(void Function(BlockSeal) updates) => super.copyWith((message) => updates(message as BlockSeal));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BlockSeal create() => BlockSeal._();
  BlockSeal createEmptyInstance() => create();
  static $pb.PbList<BlockSeal> createRepeated() => $pb.PbList<BlockSeal>();
  @$core.pragma('dart2js:noInline')
  static BlockSeal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockSeal>(create);
  static BlockSeal _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get blockId => $_getN(0);
  @$pb.TagNumber(1)
  set blockId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlockId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlockId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get executionReceiptId => $_getN(1);
  @$pb.TagNumber(2)
  set executionReceiptId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExecutionReceiptId() => $_has(1);
  @$pb.TagNumber(2)
  void clearExecutionReceiptId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.List<$core.int>> get executionReceiptSignatures => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.List<$core.int>> get resultApprovalSignatures => $_getList(3);
}

