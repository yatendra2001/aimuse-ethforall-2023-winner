/*
func FixedPointToString(amount uint64, decimalPlaces int) string {
	amountStr := strconv.Itoa(int(amount))
	if len(amountStr) < decimalPlaces {
		padding := strings.Repeat("0", decimalPlaces-len(amountStr))
		return fmt.Sprintf("0.%s%s", padding, amountStr)
	} else if len(amountStr) == decimalPlaces {
		return fmt.Sprintf("0.%s", amountStr)
	}
	return fmt.Sprintf("%s.%s", amountStr[:len(amountStr)-decimalPlaces], amountStr[len(amountStr)-decimalPlaces:])
}

func FormatUFix64(flow uint64) string {
	return FixedPointToString(flow, UFix64DecimalPlaces)
}
*/

import 'dart:ffi';
import 'package:fixnum/fixnum.dart';
import 'package:ai_muse/flow_chain/flow_dart_sdk/fcl/constants.dart';

String _fixedPointToString(Int64 amount, num decimalPlaces) {
  final amountString = amount.toRadixStringUnsigned(UFIX64_DECIMAL_PLACES);
  final length = amountString.length;

  if (length < decimalPlaces) {
    var padding = "0" * (decimalPlaces - length);
    return '0.$padding$amountString';
  } else if (length == decimalPlaces) {
    return '0.$amountString';
  }

  final intPart = amountString.substring(0, length - decimalPlaces);
  final decimalPart = amountString.substring(length - decimalPlaces);
  return "$intPart.$decimalPart";
}

String formatUFix64(Int64 amount) {
  return _fixedPointToString(amount, UFIX64_DECIMAL_PLACES);
}
