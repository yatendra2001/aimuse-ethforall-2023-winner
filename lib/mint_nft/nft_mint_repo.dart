import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:ai_muse/keys.dart';

Future<String> hashImage(File file) async {
  var imageBytes = file.readAsBytesSync().toString();
  var bytes = utf8.encode(imageBytes); // data being hashed
  String digest = sha256.convert(bytes).toString();
  print("This is image Digest :  $digest");
  return digest;
}

Future<Uint8List> loadImage(String path) async {
  // Load the image data from a file
  ByteData data = await rootBundle.load(path);
  return data.buffer.asUint8List();
}

Future<File> _fileFromImageUrl(String url) async {
  final response = await http.get(Uri.parse(url));

  final documentDirectory = await getApplicationDocumentsDirectory();

  final file = File(join(documentDirectory.path, 'imagetest.png'));

  file.writeAsBytesSync(response.bodyBytes);

  return file;
}

Future<String> storeFileInDirectory(
    {required String url, required String title}) async {
  final response = await http.get(Uri.parse(url));
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  var myFile = File('$appDocPath/$title.png');
  myFile.writeAsBytesSync(response.bodyBytes);
  String traits =
      '[{"trait_type":"BgColor","value": "{artWork.backgroundIndex}"},{"trait_type":"FgColor","value": "{artWork.forgroundIndex}"},{"trait_type":"Radius","value": "{artWork.radiusIndex}"}]';
  String nftJson =
      '{"name": "{artWork.title}","description": "This is circle number i","image": "ipfs://IMAGES_CID/$title.png","attributes": $traits}';
  myFile = File('$appDocPath/$title.json');
  myFile.writeAsStringSync(nftJson);
  await Future.delayed(const Duration(milliseconds: 1000));
  return '$appDocPath/$title.png';
}

Future<String> uploadImageToIPFS(
    {required String imageUrl,
    required String nftName,
    required String description}) async {
  developer.log(imageUrl);

  // Storing Image From URL to Directory
  final response = await http.get(Uri.parse(imageUrl));
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  var myFile = File('$appDocPath/$nftName.png');
  myFile.writeAsBytesSync(response.bodyBytes);

  // Uploading image to IPFS
  String url = "https://api.nft.storage/upload";
  developer.log("check 1");

  var request = http.MultipartRequest('POST', Uri.parse(url));
  request.headers.addAll({
    'Authorization': "Bearer $NFT_STORAGE_API",
    'Content-Type': 'multipart/form-data',
  });

  request.files.add(await http.MultipartFile.fromPath(
      'file', '$appDocPath/$nftName.png',
      contentType: MediaType('image', 'png')));

  var myresponse = await request.send();
  var responseBody = await myresponse.stream.bytesToString();
  final data = jsonDecode(responseBody);
  developer.log(responseBody);

  developer.log("check 2");

  // Storing image url in a json inside
  String cid = data["value"]["cid"];

  String traits =
      '[{"trait_type":"BgColor","value": "{artWork.backgroundIndex}"},{"trait_type":"FgColor","value": "{artWork.forgroundIndex}"},{"trait_type":"Radius","value": "{artWork.radiusIndex}"}]';

  Map<String, String> nftJson = {
    "name": nftName,
    "description": description,
    "image": 'ipfs://$cid/$nftName.png',
    "traits": traits
  };

  myFile = File('$appDocPath/$nftName.json');
  myFile.writeAsStringSync(jsonEncode(nftJson));

  // Uploading json to IPFS
  var jsonRequest = http.MultipartRequest('POST', Uri.parse(url));
  jsonRequest.headers.addAll({
    'Authorization': "Bearer $NFT_STORAGE_API",
    'Content-Type': 'application/json',
  });

  jsonRequest.files.add(await http.MultipartFile.fromPath(
      'file', '$appDocPath/$nftName.json',
      contentType: MediaType('application', 'json')));

  var jsonResponse = await jsonRequest.send();
  var jsonResponseBody = await jsonResponse.stream.bytesToString();
  final jsonData = jsonDecode(jsonResponseBody);
  developer.log(jsonResponseBody);

  // Storing image url in a json inside
  cid = jsonData["value"]["cid"];
  developer.log("check 3");

  return 'ipfs://$cid/$nftName.json';
}

Future<void> mintNFT(
    {required String chain,
    required String NFT_Name,
    required String NFT_Description,
    required String mintingAddress,
    required String imageURL}) async {
  String apikey = NFT_PORT_API;

  String url =
      "https://api.nftport.xyz/v0/mints/easy/files?chain=$chain&name=$NFT_Name&description=$NFT_Description&mint_to_address=$mintingAddress";
  developer.log("check 1");

  final response = await http.get(Uri.parse(imageURL));
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  var myFile = File('$appDocPath/$NFT_Name.png');
  myFile.writeAsBytesSync(response.bodyBytes);

  var request = http.MultipartRequest('POST', Uri.parse(url));
  request.headers
      .addAll({'Authorization': apikey, 'Content-Type': 'multipart/form-data'});

  request.files.add(await http.MultipartFile.fromPath(
      'file', '$appDocPath/$NFT_Name.png',
      contentType: MediaType('image', 'png')));

  var myresponse = await request.send();
  var responseBody = await myresponse.stream.bytesToString();
  print(responseBody);
  developer.log("check 2");
}

Future<String?> generateImageFromAI({required String prompt}) async {
  String apikey = DALL_E_API;
  String url = 'https://api.openai.com/v1/images/generations';
  if (prompt.isNotEmpty) {
    var data = {
      "prompt": prompt,
      "n": 1,
      "size": "512x512",
    };
    var res = await http.post(Uri.parse(url),
        headers: {
          "Authorization": "Bearer $apikey",
          "Content-Type": "application/json"
        },
        body: jsonEncode(data));

    var jsonResponse = jsonDecode(res.body);
    String? image = jsonResponse['data'][0]['url'];
    return image;
  } else {
    return "Enter Something";
  }
}
