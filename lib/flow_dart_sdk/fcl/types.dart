import 'dart:convert';
import 'package:ai_muse/flow_dart_sdk/fcl/utils.dart';

// TODO: Reformat to CadenceValue similar to Go

enum CadenceType {
  String,
  Int,
  Int8,
  UInt,
  UFix64,
}

class CadenceValue {
  final CadenceType type;
  dynamic value;

  CadenceValue({this.value, required this.type});

  /// TODO: ensure that value is properly reconstructed from JSON to specific
  /// format, because JSON-CDC encodes everything to strings - including numbers
  CadenceValue.fromJson(Map<String, dynamic> json)
      : type = enumFromString(CadenceType.values, json['type']),
        value = json['value'];

  Map<String, dynamic> toJson() =>
      {'type': type.toString().split('.').last, 'value': value.toString()};

  String toJsonString() {
    // TODO: Investigate if it will work without newline character
    // Go version of this covnersion includes new line character at the end
    // which results in a string different from one in Go tests
    final newLine = "\n";
    return json.encode(this.toJson()) + newLine;
    // return json.encode(this.toJson());
  }

  List<int> toMessage() {
    return utf8.encode(this.toJsonString());
  }
}

/// Representation of Cadence Int
class CadenceInt {
  final String type;
  final num value;

  CadenceInt(this.value, {this.type = "Int"});

  CadenceInt.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        value = json['value'];

  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
      };

  String toJsonString() {
    return json.encode(this.toJson());
  }

  List<int> toMessage() {
    return utf8.encode(this.toJsonString());
  }
}

/// Representation of Cadence String
class CadenceString {
  final String type;
  final String value;

  CadenceString(this.value, {this.type = "String"});

  CadenceString.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        value = json['value'];

  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
      };

  String toJsonString() {
    return json.encode(this.toJson());
  }

  List<int> toMessage() {
    return utf8.encode(this.toJsonString());
  }
}
