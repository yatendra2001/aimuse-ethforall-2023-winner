///
//  Generated code. Do not modify.
//  source: flow/entities/transaction.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'transaction.pbenum.dart';

class Transaction_ProposalKey extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Transaction.ProposalKey', package: const $pb.PackageName('flow.entities'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'address', $pb.PbFieldType.OY)
    ..a<$core.int>(2, 'keyId', $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(3, 'sequenceNumber', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  Transaction_ProposalKey._() : super();
  factory Transaction_ProposalKey() => create();
  factory Transaction_ProposalKey.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transaction_ProposalKey.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Transaction_ProposalKey clone() => Transaction_ProposalKey()..mergeFromMessage(this);
  Transaction_ProposalKey copyWith(void Function(Transaction_ProposalKey) updates) => super.copyWith((message) => updates(message as Transaction_ProposalKey));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Transaction_ProposalKey create() => Transaction_ProposalKey._();
  Transaction_ProposalKey createEmptyInstance() => create();
  static $pb.PbList<Transaction_ProposalKey> createRepeated() => $pb.PbList<Transaction_ProposalKey>();
  @$core.pragma('dart2js:noInline')
  static Transaction_ProposalKey getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transaction_ProposalKey>(create);
  static Transaction_ProposalKey _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get keyId => $_getIZ(1);
  @$pb.TagNumber(2)
  set keyId($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasKeyId() => $_has(1);
  @$pb.TagNumber(2)
  void clearKeyId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get sequenceNumber => $_getI64(2);
  @$pb.TagNumber(3)
  set sequenceNumber($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSequenceNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearSequenceNumber() => clearField(3);
}

class Transaction_Signature extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Transaction.Signature', package: const $pb.PackageName('flow.entities'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'address', $pb.PbFieldType.OY)
    ..a<$core.int>(2, 'keyId', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(3, 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Transaction_Signature._() : super();
  factory Transaction_Signature() => create();
  factory Transaction_Signature.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transaction_Signature.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Transaction_Signature clone() => Transaction_Signature()..mergeFromMessage(this);
  Transaction_Signature copyWith(void Function(Transaction_Signature) updates) => super.copyWith((message) => updates(message as Transaction_Signature));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Transaction_Signature create() => Transaction_Signature._();
  Transaction_Signature createEmptyInstance() => create();
  static $pb.PbList<Transaction_Signature> createRepeated() => $pb.PbList<Transaction_Signature>();
  @$core.pragma('dart2js:noInline')
  static Transaction_Signature getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transaction_Signature>(create);
  static Transaction_Signature _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get keyId => $_getIZ(1);
  @$pb.TagNumber(2)
  set keyId($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasKeyId() => $_has(1);
  @$pb.TagNumber(2)
  void clearKeyId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get signature => $_getN(2);
  @$pb.TagNumber(3)
  set signature($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSignature() => $_has(2);
  @$pb.TagNumber(3)
  void clearSignature() => clearField(3);
}

class Transaction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Transaction', package: const $pb.PackageName('flow.entities'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'script', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(2, 'arguments', $pb.PbFieldType.PY)
    ..a<$core.List<$core.int>>(3, 'referenceBlockId', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(4, 'gasLimit', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<Transaction_ProposalKey>(5, 'proposalKey', subBuilder: Transaction_ProposalKey.create)
    ..a<$core.List<$core.int>>(6, 'payer', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(7, 'authorizers', $pb.PbFieldType.PY)
    ..pc<Transaction_Signature>(8, 'payloadSignatures', $pb.PbFieldType.PM, subBuilder: Transaction_Signature.create)
    ..pc<Transaction_Signature>(9, 'envelopeSignatures', $pb.PbFieldType.PM, subBuilder: Transaction_Signature.create)
    ..hasRequiredFields = false
  ;

  Transaction._() : super();
  factory Transaction() => create();
  factory Transaction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transaction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Transaction clone() => Transaction()..mergeFromMessage(this);
  Transaction copyWith(void Function(Transaction) updates) => super.copyWith((message) => updates(message as Transaction));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Transaction create() => Transaction._();
  Transaction createEmptyInstance() => create();
  static $pb.PbList<Transaction> createRepeated() => $pb.PbList<Transaction>();
  @$core.pragma('dart2js:noInline')
  static Transaction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transaction>(create);
  static Transaction _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.List<$core.int> get referenceBlockId => $_getN(2);
  @$pb.TagNumber(3)
  set referenceBlockId($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasReferenceBlockId() => $_has(2);
  @$pb.TagNumber(3)
  void clearReferenceBlockId() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get gasLimit => $_getI64(3);
  @$pb.TagNumber(4)
  set gasLimit($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGasLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearGasLimit() => clearField(4);

  @$pb.TagNumber(5)
  Transaction_ProposalKey get proposalKey => $_getN(4);
  @$pb.TagNumber(5)
  set proposalKey(Transaction_ProposalKey v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasProposalKey() => $_has(4);
  @$pb.TagNumber(5)
  void clearProposalKey() => clearField(5);
  @$pb.TagNumber(5)
  Transaction_ProposalKey ensureProposalKey() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.List<$core.int> get payer => $_getN(5);
  @$pb.TagNumber(6)
  set payer($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPayer() => $_has(5);
  @$pb.TagNumber(6)
  void clearPayer() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.List<$core.int>> get authorizers => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<Transaction_Signature> get payloadSignatures => $_getList(7);

  @$pb.TagNumber(9)
  $core.List<Transaction_Signature> get envelopeSignatures => $_getList(8);
}

