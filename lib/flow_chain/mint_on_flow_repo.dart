import 'dart:convert';
import 'dart:developer' as developer;

// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../keys.dart';

Future<void> getReferenceBlockId() async {
  // Set the query parameters
  final queryParameters = {
    'height': "sealed",
  };

  // Make a GET request to the Flow Access API endpoint to retrieve the block header
  final uri =
      Uri.https('rest-testnet.onflow.org', '/v1/blocks', queryParameters);
  debugPrint(uri.toString());
  final response = await http.get(uri);

  // Check if the request was successful
  if (response.statusCode == 200) {
    // Parse the response JSON to extract the reference block ID
    final jsonResponse = jsonDecode(response.body);
    developer.log(jsonResponse);
    developer.log(response.headers.toString());
  } else {
    debugPrint('Request failed with status: ${response.statusCode}.');
    debugPrint('Request failed with status: ${response.body}.');
  }
}

Future<List<Map<String, String>>> getImagesFromStorage() async {
  String url = "https://api.nft.storage/";
  debugPrint("check 1");

  var request = http.MultipartRequest('GET', Uri.parse(url));
  request.headers.addAll({
    'Authorization': "Bearer $NFT_STORAGE_API",
    'Content-Type': 'application/json',
  });

  var myresponse = await request.send();
  var responseBody = await myresponse.stream.bytesToString();
  final data = jsonDecode(responseBody)["value"];
  List<Map<String, String>> result = [];
  for (var element in data) {
    if (element["files"][0]["type"] == "application/json") {
      final Map<String, String> map = {
        "cid": element["cid"],
        "name": element["files"][0]["name"]
      };
      result.add(map);
    }
  }

  developer.log(result.toString());
  return result;
}

Future<void> submitTransaction() async {}

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

  debugPrint(response.statusCode.toString());
  debugPrint(response.body);
}
