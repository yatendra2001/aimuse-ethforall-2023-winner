import 'dart:developer' as developer;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

import 'package:ai_muse/common_widgets/custom_button.dart';
import 'package:ai_muse/common_widgets/custom_outlined_button.dart';
import 'package:ai_muse/features/dashboard/screens/bottom_nav_screen.dart';
import 'package:ai_muse/features/dashboard/screens/dashobard_screen.dart';
import 'package:ai_muse/keys.dart';
import 'package:ai_muse/utils/session_helper.dart';

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

  var _session, _uri;

  loginUsingMetamask(BuildContext context) async {
    if (!connector.connected) {
      try {
        var session = await connector.createSession(onDisplayUri: (uri) async {
          _uri = uri;
          await launchUrlString(uri, mode: LaunchMode.externalApplication);
        });
        print(session.accounts[0]);
        print(session.chainId);
        setState(() {
          _session = session;
        });
      } catch (exp) {
        print(exp);
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
              print(_session.accounts[0]);
              print(_session.chainId);
            }));
    connector.on(
        'disconnect',
        (payload) => setState(() {
              _session = null;
            }));
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: Colors.white,
      ),
      width: double.infinity,
      duration: const Duration(milliseconds: 400),
      child: AnimatedCrossFade(
        firstChild: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 30.w,
                  height: 1.h,
                  decoration: BoxDecoration(
                    color: const Color(0XFFE0E5F2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            // Icon(
            //   Icons.account_balance_wallet_rounded,
            //   color: Color(0XFF707EAE),
            //   size: 5.h,
            // ),
            // SizedBox(
            //   height: 2.h,
            // ),
            // Text(
            //   "Link a crypto-wallet",
            //   style: GoogleFonts.lexend()
            //       .copyWith(fontWeight: FontWeight.w700, fontSize: 18.sp),
            //   textAlign: TextAlign.center,
            // ),
            // SizedBox(
            //   height: 2.h,
            // ),
            // Text(
            //   "Your crypto wallet securely stores your digital goods and cryptocurrencies.Connect to one of our wallet providers or create a new one.",
            //   style: GoogleFonts.lexend().copyWith(
            //     fontWeight: FontWeight.w600,
            //     fontSize: 12.sp,
            //     color: Color(0XFF8F9BBA),
            //     height: 1.5,
            //     letterSpacing: 1,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            // SizedBox(
            //   height: 3.h,
            // ),
            if (_session != null)
              CustomOutlineButton(
                  text: "Continue",
                  // walletLogo: "assets/images/metamask_logo.png",
                  onPressed: () {
                    String? networkName;
                    setState(() {
                      networkName = getNetworkName(_session.chainId);
                      developer.log(networkName!);
                    });
                    if (networkName == "Mantle Testnet") {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Successfully Logged In"),
                        backgroundColor: Colors.greenAccent,
                      ));
                      SessionHelper.walletAddress = _session.accounts[0];
                      Navigator.of(context)
                          .pushReplacementNamed(BottomNavBarScreen.routename);
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Wrong Network Selected"),
                              content: const Text(
                                  "Kindly Create a Mantle Testnet inside Metamask using following details:\n\n• Network Name: Mantle Testnet\n\n• New RPC URL: \nhttps://rpc.testnet.mantle.xyz\n\n• Chain ID: 5001\n\n• Currency Symbol: BIT\n\n•Block explorer URL(Optional): https://explorer.testnet.mantle.xyz"),
                              actions: [
                                CustomOutlineButton(
                                    text: "Okay",
                                    onPressed: () async {
                                      await connector.killSession();
                                      Navigator.of(context).pop();
                                    })
                              ],
                            );
                          });
                    }
                  }),
            if (_session == null)
              SizedBox(
                width: 60.w,
                height: 7.5.h,
                child: CustomOutlineButton(
                  text: "Metamask",
                  walletLogo: "assets/images/metamask_logo.png",
                  onPressed: () => loginUsingMetamask(context),
                ),
              ),
            if (_session == null)
              SizedBox(
                height: 3.h,
              ),
            if (_session == null)
              SizedBox(
                width: 60.w,
                height: 7.5.h,
                child: CustomOutlineButton(
                    text: "Rainbow",
                    walletLogo: "assets/images/rainbow_logo.png",
                    onPressed: () {}),
              ),

            if (_session == null)
              SizedBox(
                height: 3.h,
              ),
            if (_session == null)
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(60.w, 7.5.h),
                  backgroundColor: const Color(0xff8345E6),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                onPressed: () {
                  TextEditingController _walletAddressController =
                      TextEditingController(text: WALLET_OWNER);
                  SessionHelper.walletAddress = WALLET_OWNER;
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 30.h,
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
                              Divider(
                                  thickness: 4,
                                  indent: 30.w,
                                  endIndent: 30.w,
                                  color: Colors.black38),
                              SizedBox(
                                height: 4.h,
                              ),
                              SizedBox(
                                height: 10.h,
                                width: 100.w,
                                child: TextField(
                                  controller: _walletAddressController,
                                  decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0XFF4318FF))),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0XFF4318FF))),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFF4318FF),
                                      ),
                                    ),
                                    labelStyle:
                                        TextStyle(color: Color(0XFF4318FF)),
                                    hintStyle:
                                        TextStyle(color: Color(0XFF4318FF)),
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
                                          .pushReplacementNamed(
                                              BottomNavBarScreen.routename);
                                    }),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.link,
                      color: Colors.white,
                    ),
                    Text(
                      "Enter polygon address",
                      style: GoogleFonts.dmSans().copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            if (_session == null)
              SizedBox(
                height: 3.h,
              ),
            if (_session == null)
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  fixedSize: Size(60.w, 7.5.h),
                  backgroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
                onPressed: () {
                  TextEditingController _walletAddressController =
                      TextEditingController(text: WALLET_OWNER);
                  SessionHelper.walletAddress = WALLET_OWNER;
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 30.h,
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
                              Divider(
                                  thickness: 4,
                                  indent: 30.w,
                                  endIndent: 30.w,
                                  color: Colors.black38),
                              SizedBox(
                                height: 4.h,
                              ),
                              SizedBox(
                                height: 10.h,
                                width: 100.w,
                                child: TextField(
                                  controller: _walletAddressController,
                                  decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0XFF4318FF))),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0XFF4318FF))),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFF4318FF),
                                      ),
                                    ),
                                    labelStyle:
                                        TextStyle(color: Color(0XFF4318FF)),
                                    hintStyle:
                                        TextStyle(color: Color(0XFF4318FF)),
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
                                          .pushReplacementNamed(
                                              BottomNavBarScreen.routename);
                                    }),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.link,
                      color: Colors.white,
                    ),
                    Text(
                      "Enter mantle Address",
                      style: GoogleFonts.dmSans().copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: 3.h,
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  _showSecond = true;
                });
              },
              child: Text("Press Me"),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "New to wallets?",
                    style: GoogleFonts.lexend().copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: const Color(0XFF8F9BBA),
                    ),
                  ),
                  TextSpan(
                    text: " Learn more",
                    style: GoogleFonts.lexend().copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: const Color(0XFFB9A2FF),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
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
              SizedBox(
                height: 3.h,
              ),
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 20.h,
              ),
              SizedBox(
                height: 3.h,
              ),
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
}
