///
//  Generated code. Do not modify.
//  source: flow/entities/account.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class Account extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Account', package: const $pb.PackageName('flow.entities'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'address', $pb.PbFieldType.OY)
    ..a<$fixnum.Int64>(2, 'balance', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(3, 'code', $pb.PbFieldType.OY)
    ..pc<AccountKey>(4, 'keys', $pb.PbFieldType.PM, subBuilder: AccountKey.create)
    ..m<$core.String, $core.List<$core.int>>(5, 'contracts', entryClassName: 'Account.ContractsEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OY, packageName: const $pb.PackageName('flow.entities'))
    ..hasRequiredFields = false
  ;

  Account._() : super();
  factory Account() => create();
  factory Account.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Account.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Account clone() => Account()..mergeFromMessage(this);
  Account copyWith(void Function(Account) updates) => super.copyWith((message) => updates(message as Account));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Account create() => Account._();
  Account createEmptyInstance() => create();
  static $pb.PbList<Account> createRepeated() => $pb.PbList<Account>();
  @$core.pragma('dart2js:noInline')
  static Account getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Account>(create);
  static Account _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get address => $_getN(0);
  @$pb.TagNumber(1)
  set address($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get balance => $_getI64(1);
  @$pb.TagNumber(2)
  set balance($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBalance() => $_has(1);
  @$pb.TagNumber(2)
  void clearBalance() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get code => $_getN(2);
  @$pb.TagNumber(3)
  set code($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearCode() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<AccountKey> get keys => $_getList(3);

  @$pb.TagNumber(5)
  $core.Map<$core.String, $core.List<$core.int>> get contracts => $_getMap(4);
}

class AccountKey extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AccountKey', package: const $pb.PackageName('flow.entities'), createEmptyInstance: create)
    ..a<$core.int>(1, 'index', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(2, 'publicKey', $pb.PbFieldType.OY)
    ..a<$core.int>(3, 'signAlgo', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, 'hashAlgo', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, 'weight', $pb.PbFieldType.OU3)
    ..a<$core.int>(6, 'sequenceNumber', $pb.PbFieldType.OU3)
    ..aOB(7, 'revoked')
    ..hasRequiredFields = false
  ;

  AccountKey._() : super();
  factory AccountKey() => create();
  factory AccountKey.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountKey.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AccountKey clone() => AccountKey()..mergeFromMessage(this);
  AccountKey copyWith(void Function(AccountKey) updates) => super.copyWith((message) => updates(message as AccountKey));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AccountKey create() => AccountKey._();
  AccountKey createEmptyInstance() => create();
  static $pb.PbList<AccountKey> createRepeated() => $pb.PbList<AccountKey>();
  @$core.pragma('dart2js:noInline')
  static AccountKey getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountKey>(create);
  static AccountKey _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get index => $_getIZ(0);
  @$pb.TagNumber(1)
  set index($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndex() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get publicKey => $_getN(1);
  @$pb.TagNumber(2)
  set publicKey($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPublicKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublicKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get signAlgo => $_getIZ(2);
  @$pb.TagNumber(3)
  set signAlgo($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSignAlgo() => $_has(2);
  @$pb.TagNumber(3)
  void clearSignAlgo() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get hashAlgo => $_getIZ(3);
  @$pb.TagNumber(4)
  set hashAlgo($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHashAlgo() => $_has(3);
  @$pb.TagNumber(4)
  void clearHashAlgo() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get weight => $_getIZ(4);
  @$pb.TagNumber(5)
  set weight($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasWeight() => $_has(4);
  @$pb.TagNumber(5)
  void clearWeight() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get sequenceNumber => $_getIZ(5);
  @$pb.TagNumber(6)
  set sequenceNumber($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSequenceNumber() => $_has(5);
  @$pb.TagNumber(6)
  void clearSequenceNumber() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get revoked => $_getBF(6);
  @$pb.TagNumber(7)
  set revoked($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRevoked() => $_has(6);
  @$pb.TagNumber(7)
  void clearRevoked() => clearField(7);
}

