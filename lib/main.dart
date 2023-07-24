import 'package:ai_muse/config/custom_router.dart';
import 'package:ai_muse/features/onboarding/screens/pageview.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main(List<String> args) {
  runApp(const MyApp());
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
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0x0ff4f7fe).withOpacity(1),
          ),
          onGenerateRoute: CustomRouter.onGenerateRoute,
          initialRoute: OnboardingPageview.routeName,
        );
      },
    );
  }
}
