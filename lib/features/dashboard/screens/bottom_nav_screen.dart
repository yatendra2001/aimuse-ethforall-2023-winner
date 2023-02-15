import 'package:ai_muse/features/dashboard/screens/dashobard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: 10.h,
        width: 60.w,
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 5.w),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: Color(0XFF4318FF),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  SvgPicture.asset(
                    "assets/icons/generate_box_icon.svg",
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "Prompt",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Icon(Icons.face),
            Spacer(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: DashBoardScreen(),
      ),
    );
  }
}
