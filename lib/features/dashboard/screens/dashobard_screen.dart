import 'package:ai_muse/common_widgets/gradient_text.dart';
import 'package:ai_muse/features/create%20nft/screens/create_nft_screen.dart';
import 'package:ai_muse/features/dashboard/widgets/inspired_image_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class DashBoardScreen extends StatefulWidget {
  static const routename = '/dashboard';
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0XFF4318FF).withOpacity(0.05),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        GradientText(
                          "µ",
                          gradient: LinearGradient(
                            colors: [Color(0XFFB721FF), Color(0XFF21D4FD)],
                          ),
                          style: GoogleFonts.itim(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
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
                Spacer(),
                Container(
                  padding: EdgeInsets.all(3.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0XFF4318FF).withOpacity(0.05),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/mode_icon.svg",
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0XFF4318FF).withOpacity(0.05),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Icon(Icons.account_balance_wallet),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          "9.168 ETH",
                          style: GoogleFonts.lexend(
                              fontSize: 12.sp, fontWeight: FontWeight.w600),
                        )
                      ],
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
            InspiredImageBox(
              imgName: "db_img1",
              text:
                  'Stay up to date with exclusive NFT drops, giveaways, and more by following our socials.',
            ),
            InspiredImageBox(
              imgName: "db_img2",
              text:
                  'Stay up to date with exclusive NFT drops, giveaways, and more by following our socials.',
            ),
            InspiredImageBox(
              imgName: "db_img3",
              text:
                  'Stay up to date with exclusive NFT drops, giveaways, and more by following our socials.',
            ),
            InspiredImageBox(
              imgName: "db_img4",
              text:
                  'Stay up to date with exclusive NFT drops, giveaways, and more by following our socials.',
            ),
          ],
        ),
      ),
    );
  }

  Widget generateBox() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => const CreateNFTScreen(),
        ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
        height: 22.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              Color(0XFFB721FF).withOpacity(0.5),
              Color(0XFF21D4FD).withOpacity(0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0XFF4318FF).withOpacity(0.2),
              offset: Offset(0, 4),
              blurRadius: 6,
              spreadRadius: 4,
            )
          ],
        ),
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
                  "Generate",
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Create NFT lol",
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
    );
  }
}
