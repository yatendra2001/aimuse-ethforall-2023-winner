import 'dart:convert';
import 'dart:typed_data';
import 'package:convert/convert.dart';
import 'package:ai_muse/flow_dart_sdk/fcl/types.dart';
import 'package:ai_muse/flow_dart_sdk/src/cadenceUtils.dart';
import 'package:rlp/rlp.dart';
import 'package:pointycastle/pointycastle.dart';

void main() {
  /*
  final input = [123, 34, 116, 121, 112, 101, 34, 58, 34, 83, 116, 114, 105, 110, 103, 34, 44, 34, 118, 97, 108, 117, 101, 34, 58, 34, 102, 111, 111, 34, 125, 10];
  print(Rlp.encode(input));
  print("\n");
  final input2 = [224, 123, 34, 116, 121, 112, 101, 34, 58, 34, 83, 116, 114, 105, 110, 103, 34, 44, 34, 118, 97, 108, 117, 101, 34, 58, 34, 102, 111, 111, 34, 125, 10];
  print(Rlp.encode(input2));

   */

  final twoArgReference =
      "f8b1b07472616e73616374696f6e207b2065786563757465207b206c6f67282248656c6c6f2c20576f726c64212229207d207df83ea07b2274797065223a22537472696e67222c2276616c7565223a22666f6f227d0a9c7b2274797065223a22496e74222c2276616c7565223a223432227d0aa0f0e4c2f76c58916ec258f246851bea091d14d4247a2fc3e18694461b1816e13b2a880000000000000001040a880000000000000001c9880000000000000001";
  final list = [
    CadenceValue(value: "foo", type: CadenceType.String),
    CadenceValue(value: 42, type: CadenceType.Int)
  ].map((t) => t.toJsonString()).toList();
  print(list);
  print(Rlp.encode(list));

  print(hex.decode(twoArgReference));

  /*
  final arguments = [
    CadenceValue(value: "foo", type: CadenceType.String)
  ];
  final args = prepareArguments(arguments);


  print(args);

  print(utf8.decode([123,34, 116, 121, 112, 101, 34, 58, 34, 83, 116, 114, 105, 110, 103, 34, 44, 34, 118, 97, 108, 117, 101, 34, 58, 34, 102, 111, 111, 34, 125, 10,]));


  final code = '''transaction { execute { log("Hello, World!") } }''';
  final fullAddress = "0x"+"01".padLeft(16, '0');
  final address = Address(fullAddress);
  print(address);

  print("test");
  final testAddress = hex.encode(hex.decode("01".padLeft(16,"0")));
  print(Address(testAddress));

  final refBlock = Address(
      "0x"+"f0e4c2f76c58916ec258f246851bea091d14d4247a2fc3e18694461b1816e13b"
          .padLeft(64, '0'));

  final computeLimit = 42;
  final keyIndex = 4;
  final seqNum = 10;

  final payload = [
    code,
    [],
    refBlock,
    computeLimit,
    address,
    keyIndex,
    seqNum,
    address,
    [address]
  ];

  print(payload);

  print(hex.encode(Rlp.encode(code)));

  final rlpEncoded = Rlp.encode(payload);
  final result = hex.encode(rlpEncoded);
  final ref = "f872b07472616e73616374696f6e207b2065786563757465207b206c6f67282248656c6c6f2c20576f726c64212229207d207dc0a0f0e4c2f76c58916ec258f246851bea091d14d4247a2fc3e18694461b1816e13b2a880000000000000001040a880000000000000001c9880000000000000001";
  print(result);
  print(ref);
  print(result == ref);

  final payloadSignature = new Digest('SHA-3/256').process(Uint8List.fromList(rlpEncoded));
  print(payloadSignature);

  */
}
