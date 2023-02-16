import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';

class MintNFTPage extends StatefulWidget {
  MintNFTPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MintNFTPageState createState() => _MintNFTPageState();
}

enum Mode { none, shownfts, mint }

class _MintNFTPageState extends State<MintNFTPage> {
  final CONTRACT_NAME = dotenv.env['CONTRACT_NAME'];
  final CONTRACT_ADDRESS = dotenv.env['CONTRACT_ADDRESS'];
  Mode mode = Mode.none; // or shownfts or mint
  http.Client httpClient = http.Client();
  late Web3Client polygonClient;
  int tokenCounter = -1;
  String tokenSymbol = '';
  Uint8List? mintedImage;
  int mintedCircleNo = 0;

  @override
  void initState() {
    final ALCHEMY_KEY = dotenv.env['ALCHEMY_KEY_PROD'];
    super.initState();
    httpClient = http.Client();
    polygonClient = Web3Client(ALCHEMY_KEY!, httpClient);
    print(polygonClient);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CONTRACT_NAME!),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('\n Contract address:'),
          Text(CONTRACT_ADDRESS!),
          FutureBuilder<String>(
            future: getTokenSymbol(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('\nToken symbol: ${snapshot.data!}');
              } else {
                return Text('\nToken symbol: wait...');
              }
            },
          ),
          FutureBuilder<int>(
            future: gettokenCounter(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                tokenCounter = snapshot.data!;
                return Text('\nNumber of tokens: $tokenCounter');
              } else {
                return Text('\nNumber of tokens: wait...');
              }
            },
          ),
          if (mode == Mode.mint)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ElevatedButton(
                child: Text('Mint!'),
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  mintStream().listen((dynamic event) {
                    setState(() {
                      mintedImage = event;
                      tokenCounter++;
                    });
                  });
                },
              ),
            ),
          Expanded(
              child: mode == Mode.shownfts
                  ? showNFTs(tokenCounter)
                  : showLatestMint())
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) async {
          if (index == 0) {
            mode = Mode.shownfts;
            setState(() {});
          } else if (index == 1) {
            mode = Mode.mint;
            FocusScope.of(context).unfocus();
            mintedImage = null;
            setState(() {});
          }
        },
        currentIndex: mode.index > 0 ? mode.index - 1 : 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.refresh), label: 'Show NFTs'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'Mint'),
        ],
      ),
    );
  }

  Widget showNFTs(int tokenCounter) {
    return ListView.builder(
        itemCount: tokenCounter,
        itemBuilder: (_, int index) {
          return FutureBuilder<Map>(
            future: getImageFromToken(index),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.memory(
                        snapshot.data!["png"],
                        width: 50,
                        height: 100,
                      ),
                      Text(
                          '  Token number ${index}\n  Image name {artwork.title}')
                    ],
                  ),
                );
              } else {
                return Text('\n\n\n   Retrieving image from IPFS ...\n\n\n');
              }
            },
          );
        });
  }

  Widget showLatestMint() {
    if (mintedImage == null)
      return Container();
    else
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.memory(
            mintedImage!,
            width: 50,
            height: 100,
          ),
          Text('  Minted Circle$mintedCircleNo.\n  Token number $tokenCounter')
        ],
      );
  }

  Future<DeployedContract> getContract() async {
    final CONTRACT_NAME = dotenv.env['CONTRACT_NAME'];
    final CONTRACT_ADDRESS = dotenv.env['CONTRACT_ADDRESS'];
    String abi = await rootBundle.loadString("assets/abi.json"); //TODO update
    DeployedContract contract = DeployedContract(
      ContractAbi.fromJson(abi, CONTRACT_NAME!),
      EthereumAddress.fromHex(CONTRACT_ADDRESS!),
    );
    return contract;
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    DeployedContract contract = await getContract();
    ContractFunction function = contract.function(functionName);
    List<dynamic> result = await polygonClient.call(
        contract: contract, function: function, params: args);
    return result;
  }

  Stream<dynamic> mintStream() async* {
    final WALLET_PRIVATE_KEY = dotenv.env['WALLET_PRIVATE_KEY'];
    final JSON_CID = dotenv.env['JSON_CID'];
    EthPrivateKey credential = EthPrivateKey.fromHex(WALLET_PRIVATE_KEY!);
    DeployedContract contract = await getContract();
    ContractFunction function = contract.function('mint');

    String url = r'ipfs://' + JSON_CID! + r'/' + 'test_image.json';
    print('url to mint $url');
    var results = await Future.wait([
      getImageFromJson(url),
      polygonClient.sendTransaction(
        credential,
        Transaction.callContract(
          contract: contract,
          function: function,
          parameters: [url],
        ),
        fetchChainIdFromNetworkId: true,
        chainId: null,
      ),
      Future.delayed(const Duration(seconds: 2))
    ]);
    yield results[0];
  }

  Future<String> getTokenSymbol() async {
    if (tokenSymbol != '')
      return tokenSymbol;
    else {
      List<dynamic> result = await query('symbol', []);
      return result[0].toString();
    }
  }

  Future<int> gettokenCounter() async {
    if (tokenCounter >= 0)
      return tokenCounter;
    else {
      List<dynamic> result = await query('tokenCounter', []);
      return int.parse(result[0].toString());
    }
  }

  Future<Map> getImageFromToken(int token) async {
    List<dynamic> result = await query('tokenURI', [BigInt.from(token)]);
    String json = result[0]; //TODO change name, json is really an URL, not json
    Uint8List png = await getImageFromJson(json);
    return {"png": png, "json": json};
  }

  Future<Uint8List> getImageFromJson(String json) async {
    final JSON_CID = dotenv.env['JSON_CID'];
    final IMAGES_CID = dotenv.env['IMAGES_CID'];
    String url = json
        .toString()
        .replaceFirst(r'ipfs://', r'https://ipfs.io/ipfs/')
        .replaceFirst(JSON_CID!, IMAGES_CID!)
        .replaceFirst('.json', '.png');
    var resp = await httpClient.get(Uri.parse(url));
    // TODO Add error checking - if(resp.statusCode!= 200) etc
    return Uint8List.fromList(resp.body.codeUnits);
  }
}
