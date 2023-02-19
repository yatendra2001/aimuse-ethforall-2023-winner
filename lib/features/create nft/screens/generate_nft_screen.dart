import 'package:ai_muse/common_widgets/custom_button.dart';
import 'package:ai_muse/common_widgets/inspired_image_box.dart';
import 'package:ai_muse/features/authentication/widgets/custom_outlined_button.dart';
import 'package:ai_muse/features/create%20nft/screens/create_nft_screen.dart';
import 'package:ai_muse/features/create%20nft/widgets/outlined_box.dart';
import 'package:ai_muse/keys.dart';
import 'package:ai_muse/mint_nft/nft_mint_repo.dart';
import 'package:ai_muse/utils/session_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';

class GenerateNFTScreen extends StatefulWidget {
  static const routeName = '/generate-nft-screen';
  const GenerateNFTScreen({super.key});

  @override
  State<GenerateNFTScreen> createState() => _GenerateNFTScreenState();
}

class _GenerateNFTScreenState extends State<GenerateNFTScreen> {
  String? imageURL;
  bool isTestnet = true;
  String? nftName;
  bool _isMinting = false;
  String? currentStatus;
  bool _isMinted = false;

  final TextEditingController _nftNameController = TextEditingController();

  Future<void> generateImage() async {
    final url = await generateImageFromAI(prompt: SessionHelper.currentPrompt!);
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

  @override
  void initState() {
    super.initState();
    generateImage();
  }

  @override
  Widget build(BuildContext context) {
    return _isMinting
        ? Scaffold(
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
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text(
                      SessionHelper.currentPrompt!,
                      style: GoogleFonts.lexend(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF8F9BBA),
                        height: 1.75,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () async {
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
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    "Regenerate",
                                    style: GoogleFonts.lexend(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                      color: const Color(0XFF8F9BBA),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isTestnet = isTestnet ? false : true;
                                        SessionHelper.isTestnet = isTestnet;
                                        print(SessionHelper.isTestnet);
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(3.w),
                                      decoration: BoxDecoration(
                                        color: isTestnet
                                            ? Colors.black
                                            : Color(0xff8345E6),
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0XFF4318FF)
                                                .withOpacity(0.05),
                                            offset: Offset(0, 4),
                                            blurRadius: 4,
                                            spreadRadius: 0,
                                          )
                                        ],
                                      ),
                                      child: isTestnet
                                          ? SvgPicture.asset(
                                              "assets/icons/mantle_logo.svg",
                                              height: 5.h,
                                            )
                                          : Image.asset(
                                              "assets/images/polygon_logo.png",
                                              height: 5.h,
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Expanded(
                            flex: 4,
                            child: Transform.scale(
                              scale: 0.63.sp,
                              child: CustomOutlineButton(
                                text: "Cancel",
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ),
                          const Spacer(),
                          if (imageURL != null)
                            Expanded(
                              flex: 4,
                              child: CustomButton(
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
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0XFF4318FF))),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0XFF4318FF))),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0XFF4318FF),
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
                                      final url = await uploadImageToIPFS(
                                          imageUrl: imageURL!,
                                          nftName: nftName!,
                                          description:
                                              SessionHelper.currentPrompt!);
                                      setState(() {
                                        currentStatus = "Minting NFT...";
                                      });

                                      var result =
                                          await mintStream(jsonUrl: url);
                                      print(result);
                                      setState(() {
                                        _isMinting = false;
                                      });
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          actionsPadding: EdgeInsets.all(12.sp),
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
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                OutlinedButton(
                                                  style:
                                                      OutlinedButton.styleFrom(
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
                                                        .pushReplacementNamed(
                                                            CreateNFTScreen
                                                                .routeName);
                                                  },
                                                  child: Text(
                                                    "Done",
                                                    style: GoogleFonts.dmSans()
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13.sp,
                                                      color: const Color(
                                                          0XFF4318FF),
                                                    ),
                                                  ),
                                                ),
                                                if (SessionHelper.isTestnet ==
                                                    false)
                                                  InkWell(
                                                    onTap: () {
                                                      Share.share(
                                                          '👋Hey-Checkout my latest NFT for AI Muse Collection on OpeanSea. \nhttps://opensea.io/collection/ai-muse-collection',
                                                          subject: 'AI Muse!');
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
                                                      decoration: BoxDecoration(
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
                                        : "Mint this NFT",
                              ),
                            ),
                          if (imageURL != null) const Spacer(),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
