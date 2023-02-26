import 'package:ai_muse/config/custom_router.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'features/dashboard/screens/nav_bar.dart';

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
          initialRoute: BottomNavBarScreen.routename,
        );
      },
    );
  }
}
