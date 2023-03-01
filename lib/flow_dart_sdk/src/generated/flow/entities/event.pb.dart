///
//  Generated code. Do not modify.
//  source: flow/entities/event.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Event extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Event', package: const $pb.PackageName('flow.entities'), createEmptyInstance: create)
    ..aOS(1, 'type')
    ..a<$core.List<$core.int>>(2, 'transactionId', $pb.PbFieldType.OY)
    ..a<$core.int>(3, 'transactionIndex', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, 'eventIndex', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(5, 'payload', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Event._() : super();
  factory Event() => create();
  factory Event.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Event.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Event clone() => Event()..mergeFromMessage(this);
  Event copyWith(void Function(Event) updates) => super.copyWith((message) => updates(message as Event));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Event create() => Event._();
  Event createEmptyInstance() => create();
  static $pb.PbList<Event> createRepeated() => $pb.PbList<Event>();
  @$core.pragma('dart2js:noInline')
  static Event getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Event>(create);
  static Event _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get transactionId => $_getN(1);
  @$pb.TagNumber(2)
  set transactionId($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTransactionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransactionId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get transactionIndex => $_getIZ(2);
  @$pb.TagNumber(3)
  set transactionIndex($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTransactionIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransactionIndex() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get eventIndex => $_getIZ(3);
  @$pb.TagNumber(4)
  set eventIndex($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEventIndex() => $_has(3);
  @$pb.TagNumber(4)
  void clearEventIndex() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get payload => $_getN(4);
  @$pb.TagNumber(5)
  set payload($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPayload() => $_has(4);
  @$pb.TagNumber(5)
  void clearPayload() => clearField(5);
}

