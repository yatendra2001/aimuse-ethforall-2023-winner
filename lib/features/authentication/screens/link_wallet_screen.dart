import 'package:ai_muse/features/authentication/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class LinkWalletScreen extends StatefulWidget {
  static const routename = '/link-wallet-screen';
  const LinkWalletScreen({super.key});

  @override
  State<LinkWalletScreen> createState() => _LinkWalletScreenState();
}

class _LinkWalletScreenState extends State<LinkWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: customModalBottomSheet(),
    );
  }

  customModalBottomSheet() {
    return DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.15,
        builder: (context, ScrollController scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 30.w,
                        height: 1.h,
                        decoration: BoxDecoration(
                          color: Color(0XFFE0E5F2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Icon(
                    Icons.account_balance_wallet_rounded,
                    color: Color(0XFF707EAE),
                    size: 5.h,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Link a crypto-wallet",
                    style: GoogleFonts.lexend()
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 18.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Your crypto wallet securely stores your digital goods and cryptocurrencies.Connect to one of our wallet providers or create a new one.",
                    style: GoogleFonts.lexend().copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: Color(0XFF8F9BBA),
                      height: 1.5,
                      letterSpacing: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomOutlineButton(text: "Meta Mask", onPressed: () {}),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomOutlineButton(text: "Trust Wallet", onPressed: () {}),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomOutlineButton(text: "Trust Wallet", onPressed: () {}),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomOutlineButton(text: "Meta Mask", onPressed: () {}),
                  SizedBox(
                    height: 2.h,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      fixedSize: Size(60.w, 7.5.h),
                      backgroundColor: Color(0XFF4318FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.link,
                          color: Colors.white,
                        ),
                        Text(
                          "Enter ethereum address",
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
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "New to wallets?",
                          style: GoogleFonts.lexend().copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: Color(0XFF8F9BBA),
                          ),
                        ),
                        TextSpan(
                          text: " Learn more",
                          style: GoogleFonts.lexend().copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: Color(0XFFB9A2FF),
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
            ),
          );
        });
  }
}
