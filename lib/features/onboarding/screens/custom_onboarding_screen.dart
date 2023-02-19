import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import 'package:ai_muse/common_widgets/custom_button.dart';

import '../widgets/dot_indicator.dart';

class CustomScreen extends StatefulWidget {
  final PageController pageController;
  static const routename = '/custom-screeen';

  final double pageNumber;
  final String title;
  final String text;

  const CustomScreen({
    Key? key,
    required this.pageController,
    required this.pageNumber,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildAnimation(),
                SizedBox(height: 3.h),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.lexend().copyWith(
                            fontWeight: FontWeight.w700, fontSize: 24.sp),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        widget.text,
                        style: GoogleFonts.lexend().copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 11.sp,
                          color: Color(0XFF8F9BBA),
                          height: 1.5,
                          letterSpacing: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      CustomDotIndicator(
                        curPageIndex: widget.pageNumber,
                        onTap: (page) {
                          widget.pageController.jumpToPage(page.round());
                        },
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      CustomButton(
                        text: "Continue",
                        onPressed: () {
                          widget.pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAnimation() {
    return Expanded(
      flex: 2,
      child: LottieBuilder.asset(
        widget.pageNumber == 1.0
            ? "assets/animations/nft_prompt.json"
            : widget.pageNumber == 2.0
                ? "assets/animations/instantly_transform.json"
                : "",
      ),
    );
  }
}
