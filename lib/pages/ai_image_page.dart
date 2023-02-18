import 'dart:convert';
import 'package:ai_muse/mint_nft/nft_mint_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AIImagePage extends StatefulWidget {
  const AIImagePage({super.key});

  @override
  State<AIImagePage> createState() => _AIImagePageState();
}

class _AIImagePageState extends State<AIImagePage> {
  TextEditingController inputText = TextEditingController(
      text:
          "monkey on bicycle, Water Color artstyle, by Pablo Picasso, by Leonardo Da Vinci, Gold, Wide portrait.");
  String apikey = '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';
  String url = 'https://api.openai.com/v1/images/generations';
  String? image;
  Future<void> getAIImage() async {
    if (inputText.text.isNotEmpty) {
      var data = {
        "prompt": inputText.text,
        "n": 1,
        "size": "512x512",
      };

      var res = await http.post(Uri.parse(url),
          headers: {
            "Authorization": "Bearer ${apikey}",
            "Content-Type": "application/json"
          },
          body: jsonEncode(data));

      var jsonResponse = jsonDecode(res.body);
      print(jsonResponse);

      image = jsonResponse['data'][0]['url'];
      setState(() {});
    } else {
      print("Enter something");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Open AI DALL.E"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            image != null
                ? Image.network(image!, width: 256, height: 265)
                : Container(
                    child: Text("Please Enter Text To Generate AI image"),
                  ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: inputText,
                decoration: InputDecoration(
                    hintText: "Enter Text to Generate AI Image",
                    filled: true,
                    fillColor: Colors.blue.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      await getAIImage();
                    },
                    child: Text("Generate AI Image")),
                ElevatedButton(
                    onPressed: () async {
                      // await storeFileInDirectory(
                      //     url:
                      //         "https://static.vecteezy.com/packs/media/vectors/term-bg-1-3d6355ab.jpg",
                      //     title: "Test Image");
                      await uploadImageToIPFS();
                    },
                    child: Text("Mint NFT")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
