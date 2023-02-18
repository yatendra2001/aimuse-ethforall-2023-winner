import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class InspiredImageBox extends StatefulWidget {
  final String imgName;
  final String text;
  final bool showbgColor;
  const InspiredImageBox(
      {Key? key,
      required this.imgName,
      required this.text,
      this.showbgColor = true})
      : super(key: key);

  @override
  State<InspiredImageBox> createState() => _InspiredImageBoxState();
}

class _InspiredImageBoxState extends State<InspiredImageBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      margin: EdgeInsets.symmetric(vertical: 1.5.h),
      decoration: BoxDecoration(
        color: widget.showbgColor
            ? Colors.white
            : Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: widget.showbgColor
            ? [
                BoxShadow(
                  color: Color(0XFF4318FF).withOpacity(0.05),
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                )
              ]
            : null,
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Transform.scale(
            scaleX: 1.1,
            scaleY: 1.1,
            child: Image.asset(
              "assets/images/${widget.imgName}.png",
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              widget.text,
              style: GoogleFonts.lexend(
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                color: Color(0XFF8F9BBA),
                height: 1.75,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
