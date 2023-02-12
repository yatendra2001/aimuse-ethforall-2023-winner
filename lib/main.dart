import 'package:ai_muse/pages/pages.dart';
import 'package:ai_muse/utils/routes.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MyRoutes.aiImageRoute,
      routes: {
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.aiImageRoute: (context) => AIImagePage(),
      },
    );
  }
}
