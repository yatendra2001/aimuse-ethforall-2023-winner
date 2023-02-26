import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  static const routename = '/splash-screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "µ",
            style: GoogleFonts.itim(
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: 100.sp,
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            "ai.muse",
            style: GoogleFonts.lexend(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 24.sp,
            ),
          )
        ],
      ),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.0, 0.69, 0.74, 0.74, 1],
          colors: [
            Color(0xFF4318FF),
            Color(0xFF509CFE),
            Color(0xFF48A5FE),
            Color(0xFF48A5FE),
            Color(0xFF21D4FD),
          ],
        ),
      ),
    ));
  }
}
