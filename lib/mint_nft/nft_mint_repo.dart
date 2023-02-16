import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'dart:developer' as developer;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

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

Future<void> storeFileInDirectory(
    {required String url, required String title}) async {
  final response = await http.get(Uri.parse(url));
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  var myFile = File('$appDocPath/$title.png');
  myFile.writeAsBytesSync(response.bodyBytes);
  String traits =
      '[{"trait_type":"BgColor","value": "{artWork.backgroundIndex}"},{"trait_type":"FgColor","value": "{artWork.forgroundIndex}"},{"trait_type":"Radius","value": "{artWork.radiusIndex}"}]';
  String nftJson =
      '{"name": "{artWork.title}","description": "This is circle number i","image": "ipfs://IMAGES_CID/{artWork.title}.png","attributes": $traits}';
  myFile = File('$appDocPath/$title.json');
  myFile.writeAsStringSync(nftJson);
  await Future.delayed(const Duration(milliseconds: 1000));
}

Future<void> mintImageToIPFS() async {
  String apikey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkaWQ6ZXRocjoweDY2ODA3NEMzNUEyZjQwOUM0OEI5MTMwM0REM0Q2ZUU4MmZCZmM1NjgiLCJpc3MiOiJuZnQtc3RvcmFnZSIsImlhdCI6MTY3NjU1OTY2OTQwNCwibmFtZSI6IkFJIE11c2UifQ.55c8VbqKyMFWL5ghg2vaoMEoVAZXDJnVsBVNgJVL8Ys";
  String? image;
  String url = "https://api.nft.storage";
  developer.log("check 1");
  String data = jsonEncode({
    "image":
        "https://static.vecteezy.com/packs/media/vectors/term-bg-1-3d6355ab.jpg",
    "name": "Test Image",
    "description": "Test Description",
    "traits":
        '[{"trait_type":"BgColor","value": "{artWork.backgroundIndex}"},{"trait_type":"FgColor","value": "{artWork.forgroundIndex}"},{"trait_type":"Radius","value": "{artWork.radiusIndex}"}]'
  });

  http.Response res = await http.post(Uri.parse(url),
      headers: {
        "Authorization": "Bearer $apikey",
        "Content-Type": "application/json"
      },
      body: data);
  developer.log("check 2");
  String _data = res.body.toString();
  var jsonResponse = jsonDecode(_data);
  developer.log("check 3");
  print(jsonResponse.toString());

  image = jsonResponse['image'];
  print(image);
}
