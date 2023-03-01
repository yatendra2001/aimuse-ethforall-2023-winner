import 'dart:convert';
import 'dart:convert' show utf8, base64Url;
import 'dart:ffi';
import 'dart:typed_data';
import 'package:ai_muse/flow_dart_sdk/fcl/types.dart';
import 'package:convert/convert.dart';

import 'package:http/http.dart' as http;
import 'package:ai_muse/flow_dart_sdk/fcl/fcl.dart' as fcl;
import 'package:pointycastle/pointycastle.dart';
import 'package:rlp/rlp.dart';

Future<void> getReferenceBlockId() async {
  // Set the query parameters
  final queryParameters = {
    'height': "sealed", // or a specific block height, e.g. '100'
  };

  // Make a GET request to the Flow Access API endpoint to retrieve the block header
  final uri =
      Uri.https('rest-testnet.onflow.org', '/v1/blocks', queryParameters);
  print(uri);
  final response = await http.get(uri);

  // Check if the request was successful
  if (response.statusCode == 200) {
    // Parse the response JSON to extract the reference block ID
    final jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    print(response.headers.toString());
    final referenceBlockId = jsonResponse['header']['parentId'];
    final blockId = jsonResponse['header']['id'];
  } else {
    print('Request failed with status: ${response.statusCode}.');
    print('Request failed with status: ${response.body}.');
  }
}

Future<void> submitTransaction() async {
  await fcl.FlowClient().sendTransaction(
    "12345",
    arguments: [
      CadenceValue(type: CadenceType.String, value: "{'test':'test'}"),
    ],
  );
}

Future<void> sendTransactionDemo() async {
  final url = Uri.parse('https://rest-testnet.onflow.org/v1/transactions');

  final requestBody = {
    "script": base64.encode(utf8.encode('some Cadence script')),
    "arguments": [
      "",
    ],
    'reference_block_id':
        "b7dbe45a66e1f403e990e20e66f91575477c58b1d5fc6e9a939a55c18cdb11e3",
    'gas_limit': '10',
    'payer': '071c126ffcbe9a36',
    'proposal_key': {
      'address': '071c126ffcbe9a36',
      'key_index': '0',
      'sequence_number': '1',
    },
    'authorizers': ['071c126ffcbe9a36'],
    'payload_signatures': [
      {
        'address': '071c126ffcbe9a36',
        'key_index': '1',
        'signature':
            "9f0b9d6aee7c7c303861e2d28295be6f0b56fbc5857fa8c0c3e6d09509fc1f16"
      },
    ],
    'envelope_signatures': [
      {
        'address': '071c126ffcbe9a36',
        'key_index': '2',
        'signature':
            "36502534e0c8823c55913a5c2b96c0c800595c591561def336de1b16a38f6521",
      },
    ],
  };

  final response = await http.post(
    url,
    body: json.encode(requestBody),
    headers: {'Content-Type': 'application/json'},
  );

  print(response.statusCode);
  print(response.body);
}
