import 'package:flutter/material.dart';

import 'uploadImageToIPFS.mocks.dart';
import 'dart:convert';
import 'dart:io';
import 'package:ai_muse/mint_nft/nft_mint_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

@GenerateMocks([http.Client, Directory, File])
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('uploadImageToIPFS', () {
    const imageUrl = 'https://example.com/image.png';
    const nftName = 'TestNFT';
    const description = 'Test NFT Description';
    const walletAddress = '0x1234567890abcdef';
    final traitsDescription = {
      "prompt": "Test Prompt",
      "artstyle": "Test Artstyle",
      "artist": "Test Artist",
      "color": "Test Color",
      "colorScheme": "Test ColorScheme",
      "finshingTouches": "Test FinishingTouches"
    };

    test('successfully uploads image and returns IPFS URL', () async {
      final client = MockClient();
      final directory = MockDirectory();
      final file = MockFile();

      when(client.get(Uri.parse(imageUrl)))
          .thenAnswer((_) async => http.Response.bytes([1, 2, 3], 200));
      when(getApplicationDocumentsDirectory())
          .thenAnswer((_) async => directory);
      when(directory.path).thenReturn('/test/path');
      when(File('/test/path/$nftName.png')).thenReturn(file);
      when(file.writeAsBytesSync(any)).thenReturn(null);
      when(client.send(any)).thenAnswer((_) async => http.StreamedResponse(
          Stream.value(utf8.encode(jsonEncode({
            "value": {"cid": "testCID"}
          }))),
          200));

      final repo = NFTMintRepo();
      final result = await repo.uploadImageToIPFS(
          imageUrl: imageUrl,
          nftName: nftName,
          description: description,
          walletAddress: walletAddress,
          traitsDescription: traitsDescription);

      expect(result, 'ipfs://testCID/$nftName.json');
    });

    test('throws an error when image download fails', () async {
      final client = MockClient();

      when(client.get(Uri.parse(imageUrl)))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      final repo = NFTMintRepo();
      expect(
          () => repo.uploadImageToIPFS(
              imageUrl: imageUrl,
              nftName: nftName,
              description: description,
              walletAddress: walletAddress,
              traitsDescription: traitsDescription),
          throwsA(isA<String>()));
    });

    test('throws an error when image upload fails', () async {
      final client = MockClient();
      final directory = MockDirectory();
      final file = MockFile();

      when(client.get(Uri.parse(imageUrl)))
          .thenAnswer((_) async => http.Response.bytes([1, 2, 3], 200));
      when(getApplicationDocumentsDirectory())
          .thenAnswer((_) async => directory);
      when(directory.path).thenReturn('/test/path');
      when(File('/test/path/$nftName.png')).thenReturn(file);
      when(file.writeAsBytesSync(any)).thenReturn(null);
      when(client.send(any)).thenAnswer((_) async => http.StreamedResponse(
          Stream.value(utf8.encode(jsonEncode({"error": "Upload failed"}))),
          400));

      final repo = NFTMintRepo();
      expect(
          () => repo.uploadImageToIPFS(
              imageUrl: imageUrl,
              nftName: nftName,
              description: description,
              walletAddress: walletAddress,
              traitsDescription: traitsDescription),
          throwsA(isA<String>()));
    });
  });
}
