import 'package:ai_muse/config/custom_router.dart';
import 'package:ai_muse/features/authentication/screens/link_wallet_screen.dart';
import 'package:ai_muse/features/create%20nft/screens/create_nft_screen.dart';
import 'package:ai_muse/features/create%20nft/screens/generate_nft_screen.dart';
import 'package:ai_muse/features/dashboard/screens/bottom_nav_screen.dart';
import 'package:ai_muse/features/dashboard/screens/dashobard_screen.dart';
import 'package:ai_muse/features/onboarding/screens/custom_onboarding_screen.dart';
import 'package:ai_muse/features/onboarding/screens/pageview.dart';
import 'package:ai_muse/features/onboarding/screens/welcome_screen.dart';
import 'package:ai_muse/features/pages.dart';
import 'package:ai_muse/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ai.muse',
          theme: ThemeData.light(),
          onGenerateRoute: CustomRouter.onGenerateRoute,
          initialRoute: OnboardingPageview.routeName,
        );
      },
    );
  }
}
