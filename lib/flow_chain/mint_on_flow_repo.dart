import 'dart:convert';

import 'package:http/http.dart' as http;

final baseUrl = 'https://access-testnet.onflow.org';
final http.Client httpClient = http.Client();

Future<String> getAccountAddress(String userId) async {
  final response = await httpClient.get(
    Uri.parse('$baseUrl/$userId/accounts'),
    headers: {
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final accounts = json.decode(response.body);
    return accounts[0]['address'];
  } else {
    throw Exception('Failed to get account address');
  }
}
