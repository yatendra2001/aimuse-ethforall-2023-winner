import 'package:ai_muse/features/dashboard/screens/dashobard_screen.dart';
import 'package:ai_muse/features/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';

class BottomNavBarScreen extends StatefulWidget {
  static const routename = '/bottom-nav-bar';

  const BottomNavBarScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DashBoardScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 4.h),
        width: MediaQuery.of(context).size.width * 0.6,
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: const Color(0XFF4318FF).withOpacity(0.4), blurRadius: 40)
          ],
        ),
        child: GNav(
          rippleColor: Colors.grey[300]!,
          hoverColor: Colors.grey[100]!,
          gap: 8,
          activeColor: Colors.white,
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.5.h),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: const Color(0XFF4318FF),
          textStyle: GoogleFonts.lexend(
            fontSize: 10.sp,
            color: Colors.white,
          ),
          color: Colors.black,
          tabs: const [
            GButton(
              icon: LineIcons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.face,
              text: 'Profile',
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
