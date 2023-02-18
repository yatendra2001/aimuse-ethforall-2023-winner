import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'package:ai_muse/common_widgets/custom_button.dart';
import 'package:ai_muse/features/onboarding/widgets/dot_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  final PageController pageController;
  static const routename = '/welcome';
  const WelcomeScreen({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildAnimation(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome to\nai.muse!",
                  style: GoogleFonts.lexend()
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 28.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomDotIndicator(
                  curPageIndex: 0,
                  onTap: (page) {
                    widget.pageController
                        .jumpToPage(page.round());
                  },
                ),
                SizedBox(
                  height: 4.h,
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
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Designed to transform your\nimagination into NFT Art with AI\nAssistance.",
                  style: GoogleFonts.lexend().copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color: Color(0XFF8F9BBA),
                    height: 1.5,
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildAnimation() {
    return Expanded(
      child: Container(),
    );
  }
}
