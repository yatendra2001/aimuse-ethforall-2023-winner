import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class OutlinedBox extends StatefulWidget {
  final String text;
  final Function() onPressed;
  final bool selected;

  const OutlinedBox({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.selected,
  }) : super(key: key);

  @override
  State<OutlinedBox> createState() => _OutlinedBoxState();
}

class _OutlinedBoxState extends State<OutlinedBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          border: Border.all(
            color: Color(0XFF4318FF),
          ),
        ),
        child: Material(
          color: widget.selected ? Color(0XFF4318FF) : null,
          borderRadius: BorderRadius.circular(30),
          child: InkWell(
            splashColor: Color(0XFF4318FF),
            hoverColor: Color(0XFF4318FF),
            highlightColor: Color(0XFF4318FF),
            borderRadius: BorderRadius.circular(30),
            onTap: widget.onPressed,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.9.h),
              margin: EdgeInsets.all(0),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.text,
                    style: GoogleFonts.dmSans(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: widget.selected ? Colors.white : Color(0XFF4318FF),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (widget.selected)
                    SizedBox(
                      width: 2.w,
                    ),
                  if (widget.selected)
                    Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 2.h,
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
