import 'dart:collection';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

import 'package:ai_muse/common_widgets/custom_button.dart';
import 'package:ai_muse/common_widgets/custom_outlined_button.dart';
import 'package:ai_muse/features/dashboard/screens/dashobard_screen.dart';
import 'package:ai_muse/utils/session_helper.dart';
import 'package:web3auth_flutter/enums.dart';
import 'package:web3auth_flutter/input.dart';
import 'package:web3auth_flutter/output.dart';
import 'package:web3auth_flutter/web3auth_flutter.dart';
import 'package:solana_web3/solana_web3.dart' as web3;

class LinkWalletScreen extends StatefulWidget {
  final Function() afterConnect;
  static const routename = '/link-wallet-screen';

  const LinkWalletScreen({
    Key? key,
    required this.afterConnect,
  }) : super(key: key);

  @override
  State<LinkWalletScreen> createState() => _LinkWalletScreenState();
}

class _LinkWalletScreenState extends State<LinkWalletScreen> {
  String _result = '';
  bool logoutVisible = false;

  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    HashMap themeMap = HashMap<String, String>();
    themeMap['primary'] = "#229954";

    Uri redirectUrl;
    if (Platform.isAndroid) {
      redirectUrl = Uri.parse('aimuse://com.example.ai_muse/auth');
    } else if (Platform.isIOS) {
      redirectUrl =
          Uri.parse('com.web3auth.flutter.web3authFlutterExample://openlogin');
    } else {
      throw UnKnownException('Unknown platform');
    }

    await Web3AuthFlutter.init(
      Web3AuthOptions(
        clientId:
            'BKqCkFNPTafssD_yrufumwqJju6Y1phXCSHPRrvqpQgTAcKoMtxLBhDPyEJSKVT2PYDN7ELj-DPYEJ9IfE8gXDs',
        network: Network.testnet,
        redirectUrl: redirectUrl,
        whiteLabel:
            WhiteLabelData(dark: true, name: "AI Muse", theme: themeMap),
      ),
    );
  }

  bool _showSecond = false;
  var connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
          name: 'AI Muse',
          description: 'An app for converting pictures to NFT',
          url: 'https://walletconnect.org',
          icons: [
            'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
          ]));

  // ignore: prefer_typing_uninitialized_variables
  var _session;

  loginUsingMetamask(BuildContext context) async {
    if (!connector.connected) {
      try {
        var session = await connector.createSession(onDisplayUri: (uri) async {
          await launchUrlString(uri, mode: LaunchMode.externalApplication);
        });
        debugPrint(session.accounts[0]);
        debugPrint(session.chainId.toString());
        setState(() {
          _session = session;
        });
      } catch (exp) {
        debugPrint(exp.toString());
      }
    }
  }

  getNetworkName(chainId) {
    switch (chainId) {
      case 1:
        return 'Ethereum Mainnet';
      case 3:
        return 'Ropsten Testnet';
      case 4:
        return 'Rinkeby Testnet';
      case 5:
        return 'Goreli Testnet';
      case 42:
        return 'Kovan Testnet';
      case 137:
        return 'Polygon Mainnet';
      case 5001:
        return 'Mantle Testnet';
      case 80001:
        return 'Mumbai Testnet';
      default:
        return 'Unknown Chain';
    }
  }

  @override
  Widget build(BuildContext context) {
    connector.on(
        'connect',
        (session) => setState(
              () {
                _session = session;
              },
            ));
    connector.on(
        'session_update',
        (payload) => setState(() {
              _session = payload;
              debugPrint(_session.accounts[0]);
              debugPrint(_session.chainId);
            }));
    connector.on(
        'disconnect',
        (payload) => setState(() {
              _session = null;
            }));
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: Colors.white,
      ),
      width: double.infinity,
      duration: const Duration(milliseconds: 400),
      child: AnimatedCrossFade(
        firstChild: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  height: 1.h,
                  decoration: BoxDecoration(
                      color: const Color(0XFFE0E5F2),
                      borderRadius: BorderRadius.circular(40)),
                  width: 30.w,
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Icon(
                Icons.login,
                color: const Color(0XFF707EAE),
                size: 6.h,
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "Walletless login",
                style: GoogleFonts.lexend(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Choose a social login from below or sign in via email",
                style: GoogleFonts.lexend(
                  fontWeight: FontWeight.w500,
                  fontSize: 10.sp,
                  color: const Color(0XFF8F9BBA),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 3.h,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(50.w, 6.5.h),
                  side: const BorderSide(color: Color(0XFF4318FF), width: 1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                onPressed: _login(_withGoogle),
                child: Row(
                  children: [
                    const Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.google,
                            color: Color(0XFF4318FF),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Google",
                        style: GoogleFonts.dmSans().copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          color: const Color(0XFF4318FF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(50.w, 6.5.h),
                  side: const BorderSide(color: Color(0XFF4318FF), width: 1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                onPressed: _login(_withFacebook),
                child: Row(
                  children: [
                    const Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.facebook,
                            color: Color(0XFF4318FF),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Facebook",
                        style: GoogleFonts.dmSans().copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          color: const Color(0XFF4318FF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(50.w, 6.5.h),
                  side: const BorderSide(color: Color(0XFF4318FF), width: 1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                onPressed: _login(_withDiscord),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.discord,
                            color: Color(0XFF4318FF),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Discord",
                        style: GoogleFonts.dmSans().copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          color: const Color(0XFF4318FF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "or",
                style: GoogleFonts.lexend(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  color: const Color(0XFF8F9BBA),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 2.h,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(50.w, 6.5.h),
                  side: const BorderSide(color: Color(0XFF4318FF), width: 1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(40.0))),
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        decoration: const BoxDecoration(
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
                                    color: const Color(0XFFE0E5F2),
                                    borderRadius: BorderRadius.circular(40)),
                                width: 30.w,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Icon(
                              Icons.mail,
                              color: const Color(0XFF707EAE),
                              size: 6.h,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              "Email login",
                              style: GoogleFonts.lexend(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.sp,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4.w),
                              child: Text(
                                "Please enter your email address & proceed password-less",
                                style: GoogleFonts.lexend(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: const Color(0XFF8F9BBA),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              padding: EdgeInsets.symmetric(horizontal: 4.w),
                              decoration: BoxDecoration(
                                  color: const Color(0XFFF4F7FE),
                                  borderRadius: BorderRadius.circular(15)),
                              child: TextField(
                                controller: textEditingController,
                                decoration: InputDecoration(
                                  fillColor: const Color(0XFFF4F7FE),
                                  hintText: "Email",
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
                              height: 4.h,
                            ),
                            CustomButton(
                              onPressed: _login(_withEmailPasswordless),
                              text: "Verify",
                              showIcon: false,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.mail,
                            color: Color(0XFF4318FF),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Email",
                        style: GoogleFonts.dmSans().copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          color: const Color(0XFF4318FF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ),
        secondChild: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Congratulations 🎉",
                style: GoogleFonts.lexend(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Lottie.asset("assets/animations/confetti.json", height: 25.h),
              CustomButton(onPressed: widget.afterConnect, text: "Okay"),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
        crossFadeState:
            _showSecond ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 500),
      ),
    );
  }

  demo() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
        ),
        Visibility(
          visible: !logoutVisible,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Icon(
                Icons.flutter_dash,
                size: 80,
                color: Color(0xFF1389fd),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Web3Auth',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: Color(0xFF0364ff)),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Welcome to Web3Auth x Flutter Demo',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Login with',
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: _login(_withGoogle), child: const Text('Google')),
              ElevatedButton(
                  onPressed: _login(_withFacebook),
                  child: const Text('Facebook')),
              ElevatedButton(
                  onPressed: _login(_withEmailPasswordless),
                  child: const Text('Email Passwordless')),
              ElevatedButton(
                  onPressed: _login(_withDiscord),
                  child: const Text('Discord')),
            ],
          ),
        ),
        Visibility(
          // ignore: sort_child_properties_last
          child: Column(
            children: [
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.red[600] // This is what you need!
                        ),
                    onPressed: _logout(),
                    child: const Column(
                      children: [
                        Text('Logout'),
                      ],
                    )),
              ),
            ],
          ),
          visible: logoutVisible,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(_result),
        )
      ],
    ));
  }

  customModalBottomSheet() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Colors.white,
      ),
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 10.h,
            width: 100.w,
            child: const TextField(
              // controller: _walletAddressController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF4318FF))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFF4318FF))),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0XFF4318FF),
                  ),
                ),
                labelStyle: TextStyle(color: Color(0XFF4318FF)),
                hintStyle: TextStyle(color: Color(0XFF4318FF)),
                labelText: 'NFT Name',
              ),
            ),
          ),
          Transform.scale(
            scale: 0.7,
            child: CustomOutlineButton(
                text: "Done",
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(DashBoardScreen.routename);
                }),
          ),
        ],
      ),
    );
  }

  VoidCallback _login(Future<Web3AuthResponse> Function() method) {
    return () async {
      try {
        final Web3AuthResponse response = await method();
        setState(() {
          _result = response.toString();
          SessionHelper.userPrivateKey = response.privKey;
          logoutVisible = true;
          _showSecond = true;
          log(_result.toString());
        });
        // Create a connection to the devnet cluster.
        final cluster = web3.Cluster.devnet;
        final connection = web3.Connection(cluster);
        debugPrint('Connecting account 1 \n');
        final wallet1 = web3.Keypair.generateSync();
        final address1 = wallet1.publicKey;
        SessionHelper.walletAddress = address1.toString();
        SessionHelper.userPrivateKey = web3.base58Encode(wallet1.secretKey);
        // Credit the wallet that will be sending tokens.
        await connection.requestAirdropAndConfirmTransaction(
          address1,
          web3.solToLamports(2).toInt(),
        );
        log(SessionHelper.walletAddress!);
      } on UserCancelledException {
        debugPrint("User cancelled.");
      } on UnKnownException {
        debugPrint("Unknown exception occurred");
      }
    };
  }

  VoidCallback _logout() {
    return () async {
      try {
        await Web3AuthFlutter.logout();
        setState(() {
          _result = '';
          logoutVisible = false;
        });
      } on UserCancelledException {
        debugPrint("User cancelled.");
      } on UnKnownException {
        debugPrint("Unknown exception occurred");
      }
    };
  }

  Future<Web3AuthResponse> _withGoogle() {
    return Web3AuthFlutter.login(LoginParams(
      loginProvider: Provider.google,
      mfaLevel: MFALevel.NONE,
    ));
  }

  Future<Web3AuthResponse> _withFacebook() {
    return Web3AuthFlutter.login(LoginParams(loginProvider: Provider.facebook));
  }

  Future<Web3AuthResponse> _withEmailPasswordless() {
    return Web3AuthFlutter.login(LoginParams(
        loginProvider: Provider.email_passwordless,
        extraLoginOptions:
            ExtraLoginOptions(login_hint: textEditingController.text)));
  }

  Future<Web3AuthResponse> _withDiscord() {
    return Web3AuthFlutter.login(LoginParams(loginProvider: Provider.discord));
  }
}
