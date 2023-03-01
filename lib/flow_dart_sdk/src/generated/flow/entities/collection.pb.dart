///
//  Generated code. Do not modify.
//  source: flow/entities/collection.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Collection extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Collection', package: const $pb.PackageName('flow.entities'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'id', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(2, 'transactionIds', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  Collection._() : super();
  factory Collection() => create();
  factory Collection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Collection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Collection clone() => Collection()..mergeFromMessage(this);
  Collection copyWith(void Function(Collection) updates) => super.copyWith((message) => updates(message as Collection));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Collection create() => Collection._();
  Collection createEmptyInstance() => create();
  static $pb.PbList<Collection> createRepeated() => $pb.PbList<Collection>();
  @$core.pragma('dart2js:noInline')
  static Collection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Collection>(create);
  static Collection _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get transactionIds => $_getList(1);
}

class CollectionGuarantee extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CollectionGuarantee', package: const $pb.PackageName('flow.entities'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'collectionId', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(2, 'signatures', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  CollectionGuarantee._() : super();
  factory CollectionGuarantee() => create();
  factory CollectionGuarantee.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CollectionGuarantee.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CollectionGuarantee clone() => CollectionGuarantee()..mergeFromMessage(this);
  CollectionGuarantee copyWith(void Function(CollectionGuarantee) updates) => super.copyWith((message) => updates(message as CollectionGuarantee));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CollectionGuarantee create() => CollectionGuarantee._();
  CollectionGuarantee createEmptyInstance() => create();
  static $pb.PbList<CollectionGuarantee> createRepeated() => $pb.PbList<CollectionGuarantee>();
  @$core.pragma('dart2js:noInline')
  static CollectionGuarantee getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CollectionGuarantee>(create);
  static CollectionGuarantee _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get collectionId => $_getN(0);
  @$pb.TagNumber(1)
  set collectionId($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCollectionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCollectionId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get signatures => $_getList(1);
}

