import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustomOutlineButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: Size(60.w, 7.5.h),
        side: const BorderSide(color: Color(0XFF4318FF), width: 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.dmSans().copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 11.sp,
          color: const Color(0XFF4318FF),
        ),
      ),
    );
  }
}
