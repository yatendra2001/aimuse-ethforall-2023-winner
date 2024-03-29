import 'package:fluttertoast/fluttertoast.dart';
import 'package:ai_muse/common_widgets/gradient_text.dart';
import 'package:ai_muse/features/create%20nft/screens/create_nft_screen.dart';
import 'package:ai_muse/common_widgets/inspired_image_box.dart';
import 'package:ai_muse/utils/session_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher_string.dart';
// import 'package:solana/base58.dart';
// import 'package:solana/encoder.dart';
// import 'package:solana/solana.dart';

import '../../../keys.dart';

class DashBoardScreen extends StatefulWidget {
  static const routename = '/dashboard';
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  bool isTestnet = SessionHelper.isTestnet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0XFF4318FF).withOpacity(0.05),
                            offset: const Offset(0, 4),
                            blurRadius: 4,
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(1.w),
                        child: Row(
                          children: [
                            GradientText(
                              "µ",
                              gradient: const LinearGradient(
                                colors: [Color(0XFFB721FF), Color(0XFF21D4FD)],
                              ),
                              style: GoogleFonts.itim(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              "ai.muse",
                              style: GoogleFonts.lexend(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    // GestureDetector(
                    //   onTap: () {
                    //     setState(() {
                    //       isTestnet = isTestnet ? false : true;
                    //       SessionHelper.isTestnet = isTestnet;
                    //       print(SessionHelper.isTestnet);
                    //     });
                    //   },
                    //   child: Container(
                    //     padding: EdgeInsets.all(3.w),
                    //     decoration: BoxDecoration(
                    //       color: isTestnet ? Colors.black : Color(0xff8345E6),
                    //       shape: BoxShape.circle,
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Color(0XFF4318FF).withOpacity(0.05),
                    //           offset: Offset(0, 4),
                    //           blurRadius: 4,
                    //           spreadRadius: 0,
                    //         )
                    //       ],
                    //     ),
                    //     child: isTestnet
                    //         ? SvgPicture.asset(
                    //             "assets/icons/mantle_logo.svg",
                    //             height: 5.h,
                    //           )
                    //         : Image.asset(
                    //             "assets/images/polygon_logo.png",
                    //             height: 5.h,
                    //           ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: 4.w,
                    // ),
                    GestureDetector(
                      onTap: () async {
                        Fluttertoast.showToast(
                            msg: "Wallet address copied",
                            backgroundColor: Colors.black54);
                        Clipboard.setData(const ClipboardData(
                            text: SOLANA_WALLET_AI_MUSE_PUBLIC_KEY));
                        await launchUrlString(
                            "https://stripe-onramp.vercel.app/",
                            mode: LaunchMode.externalApplication);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0XFF4318FF).withOpacity(0.05),
                              offset: const Offset(0, 4),
                              blurRadius: 4,
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              const Icon(Icons.coffee_rounded),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                "Buy me a coffee",
                                style: GoogleFonts.lexend(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "Generate unique NFTs",
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ),
                generateBox(),
                Text(
                  "Get Inspired",
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                const InspiredImageBox(
                  border: true,
                  imgName: "db_img1",
                  text:
                      'A dog driving a car, Avant-garde artstyle, by Pablo Picasso, by Claude Monet, gradient : [B2EBF2, 00BCD4, ], Purple, Unreal Engine, Devianart Top Rated, CGSociety Top Rated.',
                ),
                const InspiredImageBox(
                  imgName: "db_img2",
                  text:
                      'Cubism artstyle, by Johannes Vermeer, Red, Blue, Green, Yellow, Flat light, CryEngine, CGSociety Top Rated.',
                ),
                const InspiredImageBox(
                  imgName: "db_img3",
                  text:
                      'A dog driving a car, Pixelated artstyle, by Vincent Van Gogh, by Johannes Vermeer, gradient : [FFF59D, FBC02D, ], Yellow, Devianart Top Rated, CGSociety Top Rated, Broad light, Maya Engine.',
                ),
                const InspiredImageBox(
                  imgName: "db_img4",
                  text:
                      'A dog driving a car, Pixelated artstyle, by Vincent Van Gogh, by Johannes Vermeer, gradient : [FFF59D, FBC02D, ], Yellow, Devianart Top Rated, CGSociety Top Rated, Broad light, Maya Engine.',
                ),
                const InspiredImageBox(
                  imgName: '',
                  text: '',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget generateBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
      height: 22.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            const Color(0XFF4318FF).withOpacity(0.4),
            const Color(0XFF21D4FD).withOpacity(0.5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0XFF4318FF).withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 6,
            spreadRadius: 4,
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          onTap: () async {
            Navigator.of(context).pushNamed(CreateNFTScreen.routeName);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 1.w,
              ),
              SvgPicture.asset("assets/icons/generate_box_icon.svg"),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create",
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "personalised\nunique NFT's",
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                    ),
                  )
                ],
              ),
              Image.asset("assets/images/generate_box_image.png")
            ],
          ),
        ),
      ),
    );
  }
}
