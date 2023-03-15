import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';
// import 'package:solana/encoder.dart';
// import 'package:solana/solana.dart';
import 'package:web3dart/web3dart.dart';

import 'package:ai_muse/common_widgets/custom_button.dart';
import 'package:ai_muse/common_widgets/custom_outlined_button.dart';
import 'package:ai_muse/common_widgets/inspired_image_box.dart';
import 'package:ai_muse/features/create%20nft/models/color_scheme_model.dart';
import 'package:ai_muse/features/create%20nft/screens/create_nft_screen.dart';
import 'package:ai_muse/features/create%20nft/widgets/outlined_box.dart';
import 'package:ai_muse/mint_nft/nft_mint_repo.dart';
import 'package:ai_muse/utils/session_helper.dart';

import '../../../../keys.dart';

class GenerateNFTScreen extends StatefulWidget {
  static const routeName = '/generate-nft-screen';

  final List<String> artStyle;
  final List<String> artists;
  final List<CustomColorScheme> colorScheme;
  final List<String> selectedColors;
  final List<String> selectedPrompts;
  final List<String> finishingTouches;

  const GenerateNFTScreen({
    Key? key,
    required this.artStyle,
    required this.artists,
    required this.colorScheme,
    required this.selectedColors,
    required this.selectedPrompts,
    required this.finishingTouches,
  }) : super(key: key);

  @override
  State<GenerateNFTScreen> createState() => _GenerateNFTScreenState();
}

class _GenerateNFTScreenState extends State<GenerateNFTScreen> {
  String prompt = "";
  String artStyle = "";
  String artists = "";
  String colorScheme = "";
  String colors = "";
  String finshingTouches = "";

  @override
  void initState() {
    generateImage();
    prompt = addToString(widget.selectedPrompts);
    artStyle = addToString(widget.artStyle);
    artists = addToString(widget.artists);
    colorScheme = addColorScheme(widget.colorScheme);
    colors = addToString(widget.selectedColors);
    finshingTouches = addToString(widget.finishingTouches);
    super.initState();
  }

  String addColorScheme(List<CustomColorScheme> ls) {
    String str = "";

    for (int i = 0; i < ls.length; i++) {
      if (ls[i].gradient) {
        str += "Gradient: [ ";

        for (int j = 0; j < ls[i].colorCode.length; j++) {
          str += ls[i].colorCode[j];
          if (j != ls[i].colorCode.length - 1) str += ", ";
        }
        str += " ]";
      } else {
        str += ls[i].colorCode[0];
      }
      if (i != ls.length - 1) str += ", ";
    }

    return str;
  }

  String addToString(List ls) {
    String str = "";

    for (int i = 0; i < ls.length; i++) {
      str += ls[i];
      if (i != ls.length - 1) str += ", ";
    }

    return str;
  }

  String? imageURL;
  bool isTestnet = true;
  String? nftName;
  bool _isMinting = false;
  String? currentStatus;
  bool _isMinted = false;

  final TextEditingController _nftNameController = TextEditingController();

  Future<void> generateImage() async {
    final url = await NFTMintRepo()
        .generateImageFromAI(prompt: SessionHelper.currentPrompt!);
    setState(() {
      imageURL = url;
    });
  }

  Future<dynamic> mintStream({required String jsonUrl}) async {
    http.Client httpClient = http.Client();
    late Web3Client chainClient;
    EthPrivateKey credential = EthPrivateKey.fromHex(WALLET_PRIVATE_KEY);
    DeployedContract? contract;
    ContractFunction? function;

    httpClient = http.Client();
    if (SessionHelper.isTestnet) {
      contract =
          await getContract(CONTRACT_ADDRESS: CONTRACT_ADDRESS_MANTLE_TESTNET);
      function = contract.function('mint');
      chainClient = Web3Client("https://rpc.testnet.mantle.xyz/", httpClient);
    } else {
      contract = await getContract(CONTRACT_ADDRESS: CONTRACT_ADDRESS);
      function = contract.function('mint');
      chainClient = Web3Client(ALCHEMY_KEY_PROD, httpClient);
    }
    print(chainClient);

    String url = jsonUrl;
    print('url to mint $url');
    var results = await Future.wait([
      chainClient.sendTransaction(
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
    return results[0];
  }

  Future<DeployedContract> getContract(
      {required String CONTRACT_ADDRESS}) async {
    String abi = await rootBundle.loadString("assets/abi.json");
    DeployedContract contract = DeployedContract(
      ContractAbi.fromJson(abi, CONTRACT_NAME),
      EthereumAddress.fromHex(CONTRACT_ADDRESS),
    );
    return contract;
  }

  bool showDetail = false;
  @override
  Widget build(BuildContext context) {
    return _isMinting
        ? Scaffold(
            backgroundColor: Colors.white,
            body:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SpinKitWanderingCubes(
                color: Color(0XFF4318FF),
                size: 35.sp,
              ),
              SizedBox(height: 5.h),
              Text(
                currentStatus ?? '',
                style: GoogleFonts.lexend(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  color: Colors.black,
                ),
              ),
            ]),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                        size: 2.5.h,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    title: Text(
                      "Generate NFT",
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  imageURL != null
                      ? InspiredImageBox(
                          showbgColor: false,
                          imgName: "db_img1",
                          isGeneratedScreen: true,
                          imageURL: imageURL!,
                          text: "",
                        )
                      : Center(
                          child: Container(
                            height: 40.h,
                            width: 80.w,
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                            margin: EdgeInsets.symmetric(vertical: 1.5.h),
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0XFF4318FF).withOpacity(0.05),
                                  offset: Offset(0, 4),
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Center(
                              child: SpinKitWanderingCubes(
                                color: Color(0XFF4318FF),
                                size: 35.sp,
                              ),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context)
                          .scaffoldBackgroundColor
                          .withOpacity(0.5),
                    ),
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    padding: EdgeInsets.all(4.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Given prompt",
                          style: GoogleFonts.lexend(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF47548C),
                            height: 1.75,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          prompt,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lexend(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0XFF8F9BBA)),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDetail = !showDetail;
                      setState(() {});
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        border: showDetail
                            ? Border.all(color: Color(0XFF4318FF), width: 1)
                            : null,
                        borderRadius: BorderRadius.circular(15),
                        color: showDetail == false
                            ? Theme.of(context)
                                .scaffoldBackgroundColor
                                .withOpacity(0.5)
                            : Colors.white,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "View details",
                                style: GoogleFonts.lexend(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: showDetail
                                      ? Color(0XFF4318FF)
                                      : Color(0XFF8F9BBA),
                                ),
                              ),
                              Spacer(),
                              Icon(
                                showDetail
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: showDetail
                                    ? Color(0XFF4318FF)
                                    : Color(0XFF8F9BBA),
                                size: 3.h,
                              )
                            ],
                          ),
                          showDetail
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    getTextRich("Art style", artStyle),
                                    getTextRich("Artist inspiration", artists),
                                    getTextRich("Colour scheme", colorScheme),
                                    getTextRich(
                                        "Finishing touches", finshingTouches),
                                  ],
                                )
                              : SizedBox.shrink()
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  fixedSize: Size(46.w, 6.5.h),
                                  side: const BorderSide(
                                      color: Color(0XFFE0E5F2), width: 1),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  setState(() {
                                    imageURL = null;
                                  });
                                  await generateImage();
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.refresh,
                                        color: Color(0XFF4318FF),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        "Regenerate",
                                        style: GoogleFonts.lexend(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                          color: Color(0XFF4318FF),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              if (imageURL != null)
                                CustomButton(
                                  showIcon: false,
                                  onPressed: () async {
                                    if (!_isMinted) {
                                      if (nftName == null || nftName!.isEmpty) {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(
                                                          40.0))),
                                          context: context,
                                          builder: (context) {
                                            return modalBottomSheet(
                                                title: "Name your NFT",
                                                description:
                                                    "Brand your newly generated NFT with a catchy name!",
                                                buttonName: "Done",
                                                textEditingController:
                                                    _nftNameController,
                                                icon: Icons.edit,
                                                onPressed: () {
                                                  nftName =
                                                      _nftNameController.text;
                                                  Navigator.pop(context);
                                                });
                                          },
                                        );
                                      }
                                      if (nftName != null &&
                                          nftName!.isNotEmpty) {
                                        setState(() {
                                          _isMinting = true;
                                          currentStatus =
                                              "Uploading Image to IPFS...";
                                        });
                                        final url = await NFTMintRepo()
                                            .uploadImageToIPFS(
                                                walletAddress: SessionHelper
                                                    .walletAddress!,
                                                imageUrl: imageURL!,
                                                nftName: nftName!,
                                                description: SessionHelper
                                                    .currentPrompt!,
                                                traitsDescription: {
                                              "prompt": prompt,
                                              "artstyle": artStyle,
                                              "artist": artists,
                                              "color": colors,
                                              "colorScheme": colorScheme,
                                              "finshingTouches": finshingTouches
                                            });
                                        setState(() {
                                          currentStatus = "Minting NFT...";
                                        });
                                        log("https://ipfs.io/ipfs/${url.split('/')[2]}/${url.split('/')[3]}");
                                        var result = await NFTMintRepo()
                                            .mintNFTOnSolana(
                                                name: nftName!,
                                                symbol: "AMC",
                                                imageUrl:
                                                    ("https://ipfs.io/ipfs/${url.split('/')[2]}/${url.split('/')[3]}"));
                                        setState(() {
                                          _isMinting = false;
                                        });
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(
                                                          40.0))),
                                          context: context,
                                          builder: (context) {
                                            return modalBottomSheet(
                                                title: "Success",
                                                description:
                                                    "Your ai muse collectible has been successfully minted!",
                                                buttonName: "Share creation",
                                                icon: Icons.check_circle,
                                                onPressed: () {
                                                  Share.share(
                                                      '👋Hey-Checkout my latest NFT for AI Muse Collection on OpeanSea. \nhttps://opensea.io/collection/ai-muse-collection',
                                                      subject: 'AI Muse!');
                                                });
                                          },
                                        );
                                      }
                                    }
                                  },
                                  text: _isMinted
                                      ? "Minted"
                                      : (nftName != null && nftName!.isNotEmpty)
                                          ? "Mint Now"
                                          : "Mint NFT",
                                ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  )
                ],
              ),
            ),
          );
  }

  Widget getTextRich(String str1, String str2) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text.rich(
          textAlign: TextAlign.left,
          TextSpan(
            text: "$str1: ",
            style: GoogleFonts.lexend(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: Color(0XFF47548C)),
            children: [
              TextSpan(
                text: str2,
                style: GoogleFonts.lexend(
                    height: 1.4,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF8F9BBA)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget modalBottomSheet(
      {required String title,
      required String description,
      required VoidCallback onPressed,
      required IconData icon,
      required String buttonName,
      TextEditingController? textEditingController}) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 2.h,
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              height: 1.h,
              decoration: BoxDecoration(
                  color: Color(0XFFE0E5F2),
                  borderRadius: BorderRadius.circular(40)),
              width: 30.w,
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Icon(
            icon,
            color: textEditingController == null
                ? Color(0XFF01B574)
                : Color(0XFF707EAE),
            size: 6.h,
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            title,
            style: GoogleFonts.lexend(
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4.w),
            child: Text(
              description,
              style: GoogleFonts.lexend(
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Color(0XFF8F9BBA),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          if (textEditingController != null)
            SizedBox(
              height: 2.h,
            ),
          if (textEditingController != null)
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                  color: Color(0XFFF4F7FE),
                  borderRadius: BorderRadius.circular(15)),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  fillColor: Color(0XFFF4F7FE),
                  hintText: "NFT Name",
                  border: InputBorder.none,
                  suffix: InkWell(
                    child: Icon(
                      Icons.close,
                      size: 14.sp,
                    ),
                    onTap: () {
                      textEditingController.clear();
                    },
                  ),
                ),
              ),
            ),
          SizedBox(
            height: 3.h,
          ),
          CustomButton(
            onPressed: onPressed,
            text: buttonName,
            showIcon: false,
          ),
          if (textEditingController == null) SizedBox(height: 1.h),
          if (textEditingController == null)
            CustomOutlineButton(
              text: "Buy us a Coffee",
              onPressed: () async {
                Fluttertoast.showToast(
                    msg: "Wallet address copied",
                    backgroundColor: Colors.black54);
                Clipboard.setData(const ClipboardData(
                    text: SOLANA_WALLET_AI_MUSE_PUBLIC_KEY));
                await launchUrlString("https://stripe-onramp.vercel.app/",
                    mode: LaunchMode.externalApplication);
              },
            ),
          SizedBox(
            height: 4.h,
          ),
        ],
      ),
    );
  }
}
