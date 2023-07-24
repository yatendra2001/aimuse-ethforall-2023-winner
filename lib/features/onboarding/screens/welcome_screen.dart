import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildAnimation(),
              SizedBox(height: 3.h),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Text(
                            "Welcome to\nai.muse!",
                            style: GoogleFonts.lexend().copyWith(
                                fontWeight: FontWeight.w700, fontSize: 28.sp),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            "Designed to transform your\nimagination into NFT Art with AI\nAssistance.",
                            style: GoogleFonts.lexend().copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                              color: const Color(0XFF8F9BBA),
                              height: 1.5,
                              letterSpacing: 1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          CustomDotIndicator(
                            curPageIndex: 0,
                            onTap: (page) {
                              widget.pageController.jumpToPage(page.round());
                            },
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          CustomButton(
                            text: "Continue",
                            onPressed: () {
                              widget.pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear,
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAnimation() {
    return Expanded(
      flex: 2,
      child: LottieBuilder.asset(
        "assets/animations/welcome_screen.json",
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
