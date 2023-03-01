///
//  Generated code. Do not modify.
//  source: flow/entities/transaction.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class TransactionStatus extends $pb.ProtobufEnum {
  static const TransactionStatus UNKNOWN = TransactionStatus._(0, 'UNKNOWN');
  static const TransactionStatus PENDING = TransactionStatus._(1, 'PENDING');
  static const TransactionStatus FINALIZED = TransactionStatus._(2, 'FINALIZED');
  static const TransactionStatus EXECUTED = TransactionStatus._(3, 'EXECUTED');
  static const TransactionStatus SEALED = TransactionStatus._(4, 'SEALED');
  static const TransactionStatus EXPIRED = TransactionStatus._(5, 'EXPIRED');

  static const $core.List<TransactionStatus> values = <TransactionStatus> [
    UNKNOWN,
    PENDING,
    FINALIZED,
    EXECUTED,
    SEALED,
    EXPIRED,
  ];

  static final $core.Map<$core.int, TransactionStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TransactionStatus valueOf($core.int value) => _byValue[value];

  const TransactionStatus._($core.int v, $core.String n) : super(v, n);
}

