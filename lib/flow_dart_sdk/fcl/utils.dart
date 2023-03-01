import 'package:rlp/rlp.dart';
import 'package:convert/convert.dart';
import 'package:ai_muse/flow_dart_sdk/fcl/constants.dart';

T enumFromString<T>(List<T> values, String value) {
  return values.firstWhere(
    (v) => v.toString().split('.')[1] == value,
  );
}

String padLeft(int size, String value) {
  return value.padLeft(size * 2, "0");
}

String withZeroPrefix(String address) {
  if (address.startsWith(ZERO_PREFIX)) {
    return ZERO_PREFIX + padLeft(ADDRESS_BYTE_LENGTH, address.substring(2));
  }
  return ZERO_PREFIX + padLeft(ADDRESS_BYTE_LENGTH, address);
}

String sansZeroPrefix(String address) {
  if (address.startsWith(ZERO_PREFIX)) {
    return padLeft(ADDRESS_BYTE_LENGTH, address.substring(2));
  }
  return padLeft(ADDRESS_BYTE_LENGTH, address);
}
