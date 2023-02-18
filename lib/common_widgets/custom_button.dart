import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatefulWidget {
  final Function() onPressed;
  final String text;
  final bool showIcon;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.showIcon = true,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool onclicked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onPressed();
        onclicked = !onclicked;
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox.shrink(),
            Text(
              widget.text,
              style: GoogleFonts.dmSans().copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 10.sp,
                  color: Colors.white),
            ),
            widget.showIcon
                ? Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  )
                : SizedBox.shrink(),
          ],
        ),
        height: 6.h,
        width: 40.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Color(0XFF4318FF).withOpacity(0.6),
          boxShadow: [
            onclicked == false
                ? BoxShadow(
                    color: Color(0XFF4318FF).withOpacity(0.4), blurRadius: 20)
                : BoxShadow(color: Colors.white30),
          ],
        ),
      ),
    );
  }
}
