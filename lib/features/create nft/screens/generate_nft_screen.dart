import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:solana/encoder.dart';
import 'package:solana/solana.dart';
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
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Container(
                                              // height: 30.h,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.w),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(60),
                                                color: Colors.white,
                                              ),
                                              width: double.infinity,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 10.h,
                                                    width: 100.w,
                                                    child: TextField(
                                                      controller:
                                                          _nftNameController,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          nftName = value;
                                                        });
                                                      },
                                                      decoration:
                                                          const InputDecoration(
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Color(
                                                                        0XFF4318FF))),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Color(
                                                                        0XFF4318FF))),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0XFF4318FF),
                                                          ),
                                                        ),
                                                        labelStyle: TextStyle(
                                                            color: Color(
                                                                0XFF4318FF)),
                                                        hintStyle: TextStyle(
                                                            color: Color(
                                                                0XFF4318FF)),
                                                        labelText: 'NFT Name',
                                                      ),
                                                    ),
                                                  ),
                                                  Transform.scale(
                                                    scale: 0.7,
                                                    child: CustomOutlineButton(
                                                        text: "Done",
                                                        onPressed: () {
                                                          setState(() {
                                                            nftName =
                                                                _nftNameController
                                                                    .text;
                                                          });
                                                          print(nftName);
                                                          print(SessionHelper
                                                              .isTestnet);
                                                          Navigator.of(context)
                                                              .pop();
                                                        }),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
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
                                        log(url);
                                        var result = await NFTMintRepo()
                                            .mintNFTOnSolana(
                                                name: nftName!,
                                                symbol: "AMC",
                                                imageUrl: url);
                                        setState(() {
                                          _isMinting = false;
                                        });
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            actionsPadding:
                                                EdgeInsets.all(12.sp),
                                            titlePadding: EdgeInsets.all(12.sp),
                                            title: Center(
                                              child: Text(
                                                "Successfully Minted",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.lexend(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18.sp,
                                                    color: Color(0XFF4318FF)),
                                              ),
                                            ),
                                            content: Lottie.asset(
                                                "assets/animations/confetti.json",
                                                repeat: true,
                                                height: 40.h),
                                            actions: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  OutlinedButton(
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      fixedSize:
                                                          Size(30.w, 5.5.h),
                                                      side: const BorderSide(
                                                          color:
                                                              Color(0XFF4318FF),
                                                          width: 1),
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(30),
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      "Done",
                                                      style:
                                                          GoogleFonts.dmSans()
                                                              .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13.sp,
                                                        color: const Color(
                                                            0XFF4318FF),
                                                      ),
                                                    ),
                                                  ),
                                                  if (SessionHelper.isTestnet !=
                                                      false)
                                                    InkWell(
                                                      onTap: () {
                                                        Share.share(
                                                            '👋Hey-Checkout my latest NFT for AI Muse Collection on OpeanSea. \nhttps://opensea.io/collection/ai-muse-collection',
                                                            subject:
                                                                'AI Muse!');
                                                      },
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox.shrink(),
                                                            Text(
                                                              "Share",
                                                              style: GoogleFonts
                                                                      .dmSans()
                                                                  .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          13.sp,
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                          ],
                                                        ),
                                                        height: 5.5.h,
                                                        width: 30.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(25),
                                                          color:
                                                              Color(0XFF4318FF),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
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
}
