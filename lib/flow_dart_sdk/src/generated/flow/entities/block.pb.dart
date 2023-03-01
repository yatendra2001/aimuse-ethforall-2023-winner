///
//  Generated code. Do not modify.
//  source: flow/entities/block.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../timestamp.pb.dart' as $2;
import 'collection.pb.dart' as $3;
import 'block_seal.pb.dart' as $4;

class Block extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Block', package: const $pb.PackageName('flow.entities'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'id', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'parentId', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(3, 'height', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$2.Timestamp>(4, 'timestamp', subBuilder: $2.Timestamp.create)
    ..pc<$3.CollectionGuarantee>(5, 'collectionGuarantees', $pb.PbFieldType.PM, subBuilder: $3.CollectionGuarantee.create)
    ..pc<$4.BlockSeal>(6, 'blockSeals', $pb.PbFieldType.PM, subBuilder: $4.BlockSeal.create)
    ..p<$core.List<$core.int>>(7, 'signatures', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  Block._() : super();
  factory Block() => create();
  factory Block.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Block.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Block clone() => Block()..mergeFromMessage(this);
  Block copyWith(void Function(Block) updates) => super.copyWith((message) => updates(message as Block));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Block create() => Block._();
  Block createEmptyInstance() => create();
  static $pb.PbList<Block> createRepeated() => $pb.PbList<Block>();
  @$core.pragma('dart2js:noInline')
  static Block getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Block>(create);
  static Block _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get parentId => $_getN(1);
  @$pb.TagNumber(2)
  set parentId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasParentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearParentId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get height => $_getI64(2);
  @$pb.TagNumber(3)
  set height($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeight() => clearField(3);

  @$pb.TagNumber(4)
  $2.Timestamp get timestamp => $_getN(3);
  @$pb.TagNumber(4)
  set timestamp($2.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimestamp() => clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureTimestamp() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.List<$3.CollectionGuarantee> get collectionGuarantees => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$4.BlockSeal> get blockSeals => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<$core.List<$core.int>> get signatures => $_getList(6);
}

