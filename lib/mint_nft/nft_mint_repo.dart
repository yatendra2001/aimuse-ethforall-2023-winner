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

Future<void> uploadImageToIPFS() async {
  final response = await http.get(Uri.parse(
      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png"));
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  var myFile = File('$appDocPath/yatendra.png');
  myFile.writeAsBytesSync(response.bodyBytes);
  // String traits =
  //     '[{"trait_type":"BgColor","value": "{artWork.backgroundIndex}"},{"trait_type":"FgColor","value": "{artWork.forgroundIndex}"},{"trait_type":"Radius","value": "{artWork.radiusIndex}"}]';
  // String nftJson =
  //     '{"name": "yatendra","description": "This is yatendra nft","attributes": $traits}';
  // myFile = File('$appDocPath/yatendra.json');
  // myFile.writeAsStringSync(nftJson);
  String apikey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkaWQ6ZXRocjoweDY2ODA3NEMzNUEyZjQwOUM0OEI5MTMwM0REM0Q2ZUU4MmZCZmM1NjgiLCJpc3MiOiJuZnQtc3RvcmFnZSIsImlhdCI6MTY3NjU1OTY2OTQwNCwibmFtZSI6IkFJIE11c2UifQ.55c8VbqKyMFWL5ghg2vaoMEoVAZXDJnVsBVNgJVL8Ys";
  String? image;
  String url = "https://api.nft.storage";
  developer.log("check 1");
  // String data = jsonEncode({
  //   "name": "Test Image",
  //   "image":
  //       "https://static.vecteezy.com/packs/media/vectors/term-bg-1-3d6355ab.jpg",
  //   "description": "Test Description",
  //   "traits":
  //       '[{"trait_type":"BgColor","value": "{artWork.backgroundIndex}"},{"trait_type":"FgColor","value": "{artWork.forgroundIndex}"},{"trait_type":"Radius","value": "{artWork.radiusIndex}"}]'
  // });

  var request = http.MultipartRequest('POST', Uri.parse(url));
  request.headers.addAll({
    'Authorization': "Bearer $apikey",
    'Content-Type': 'multipart/form-data'
  });

  request.files.add(await http.MultipartFile.fromPath(
      'file', '$appDocPath/yatendra.png',
      contentType: MediaType('image', 'png')));

  var myresponse = await request.send();
  var responseBody = await myresponse.stream.bytesToString();
  developer.log(responseBody);
  developer.log("check 2");
}

Future<void> mintNFT(
    {required String chain,
    required String NFT_Name,
    required String NFT_Description,
    required String mintingAddress}) async {
  String apikey = NFT_PORT_API;

  String? image;
  String url =
      "https://api.nftport.xyz/v0/mints/easy/files?chain=$chain&name=$NFT_Name&description=$NFT_Description&mint_to_address=$mintingAddress";
  developer.log("check 1");

  final response = await http.get(Uri.parse(
      "https://static.vecteezy.com/packs/media/vectors/term-bg-1-3d6355ab.jpg"));
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

Future<String?> generateImage({required String prompt}) async {
  String apikey = dall_e_api;
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
