import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:ai_muse/mint_nft/base_nft_mint_repo.dart';
import 'package:ai_muse/utils/session_helper.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';

import '../../keys.dart';

class NFTMintRepo extends BaseNFTMintRepo {
  @override
  Future<String?> generateImageFromAI({required String prompt}) async {
    String errorMessage = "Something went wrong";

    try {
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
    } catch (err) {
      errorMessage = err.toString();
      developer.log(errorMessage);
    }
    throw (errorMessage);
  }

  @override
  Future<String> storeFileInDirectory(
      {required String url,
      required String title,
      required String description}) async {
    String errorMessage = "Something went wrong";
    try {
      final response = await http.get(Uri.parse(url));
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      var myFile = File('$appDocPath/$title.png');
      myFile.writeAsBytesSync(response.bodyBytes);
      String traits =
          '[{"trait_type":"BgColor","value": "{artWork.backgroundIndex}"},{"trait_type":"FgColor","value": "{artWork.forgroundIndex}"},{"trait_type":"Radius","value": "{artWork.radiusIndex}"}]';
      String nftJson =
          '{"name": $title,"description": $description,"image": "ipfs://IMAGES_CID/$title.png","attributes": $traits}';
      myFile = File('$appDocPath/$title.json');
      myFile.writeAsStringSync(nftJson);
      await Future.delayed(const Duration(milliseconds: 1000));
      return '$appDocPath/$title.png';
    } catch (err) {
      errorMessage = err.toString();
      developer.log(errorMessage);
    }
    throw (errorMessage);
  }

  @override
  Future<String> uploadImageToIPFS(
      {required String imageUrl,
      required String nftName,
      required String description,
      required Map<String, String> traitsDescription}) async {
    String errorMessage = "Something went wrong";

    try {
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
      List<dynamic> traits = [
        {"trait_type": "prompt", "value": "${traitsDescription["prompt"]}"},
        {"trait_type": "artstyle", "value": "${traitsDescription["artstyle"]}"},
        {"trait_type": "artist", "value": "${traitsDescription["artist"]}"},
        {"trait_type": "color", "value": "${traitsDescription["color"]}"},
        {
          "trait_type": "colorScheme",
          "value": "${traitsDescription["colorScheme"]}"
        },
        {
          "trait_type": "finshingTouches",
          "value": "${traitsDescription["finshingTouches"]}"
        },
      ];
      String traitsString = traits.toString();

      Map<String, String> nftJson = {
        "name": nftName,
        "description": description,
        "image": 'ipfs://$cid/$nftName.png',
        "traits": traitsString,
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
    } catch (err) {
      errorMessage = err.toString();
      developer.log(errorMessage);
    }
    throw (errorMessage);
  }

  @override
  Future<void> mintNFTUsingAPI(
      {required String chain,
      required String NFT_Name,
      required String NFT_Description,
      required String mintingAddress,
      required String imageURL}) async {
    String errorMessage = "Something went wrong";
    try {
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
      request.headers.addAll(
          {'Authorization': apikey, 'Content-Type': 'multipart/form-data'});

      request.files.add(await http.MultipartFile.fromPath(
          'file', '$appDocPath/$NFT_Name.png',
          contentType: MediaType('image', 'png')));

      var myresponse = await request.send();
      var responseBody = await myresponse.stream.bytesToString();
      print(responseBody);
      developer.log("check 2");
    } catch (err) {
      errorMessage = err.toString();
      developer.log(errorMessage);
    }
    throw (errorMessage);
  }

  @override
  Future<void> mintNFTOnSolana(
      {required String name,
      required String symbol,
      required String imageUrl}) async {
    final url = Uri.parse('https://api-eu1.tatum.io/v3/nft/mint/');
    final headers = {
      'x-api-key': TOTUM_API_TESTNET,
      'Content-Type': 'application/json',
    };
    final body = json.encode({
      'from': SessionHelper.walletAddress,
      'chain': 'SOL',
      'fromPrivateKey': SessionHelper.userPrivateKey,
      'to': SessionHelper.walletAddress,
      'metadata': {
        'name': name,
        'symbol': symbol,
        'sellerFeeBasisPoints': 0,
        'uri': imageUrl,
        'creators': [
          {
            'address': SessionHelper.walletAddress,
            'verified': true,
            'share': 100
          }
        ]
      }
    });
    final response = await http.post(url, headers: headers, body: body);
    print(response.body);
  }
}
