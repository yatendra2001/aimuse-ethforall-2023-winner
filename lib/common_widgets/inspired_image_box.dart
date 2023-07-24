import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class InspiredImageBox extends StatefulWidget {
  final String imgName;
  final String text;
  final bool showbgColor;
  final bool isGeneratedScreen;
  final String imageURL;
  final bool border;
  final bool isProfileInspireBox;

  const InspiredImageBox(
      {Key? key,
      required this.imgName,
      required this.text,
      this.showbgColor = true,
      this.isGeneratedScreen = false,
      this.border = false,
      this.imageURL = "",
      this.isProfileInspireBox = false})
      : super(key: key);

  @override
  State<InspiredImageBox> createState() => _InspiredImageBoxState();
}

class _InspiredImageBoxState extends State<InspiredImageBox> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: Colors.grey.shade200,
          width: 1.5,
          style: BorderStyle.solid,
        ),
      )),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        margin: const EdgeInsets.symmetric(vertical: 1),
        decoration: BoxDecoration(
          color: widget.showbgColor
              ? Colors.white
              : Theme.of(context).scaffoldBackgroundColor,
          borderRadius: widget.border
              ? const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )
              : null,
          // boxShadow: widget.showbgColor
          //     ? [
          //         BoxShadow(
          //           color: Color(0XFF4318FF).withOpacity(0.05),
          //           offset: Offset(0, 4),
          //           blurRadius: 4,
          //           spreadRadius: 0,
          //         )
          //       ]
          //     : null,
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            widget.imgName != ''
                ? Transform.scale(
                    scaleX: 1.1,
                    scaleY: 1.1,
                    child: widget.isGeneratedScreen
                        ? Image.network(
                            widget.imageURL,
                            scale: 1.6,
                          )
                        : Image.asset(
                            "assets/images/${widget.imgName}.png",
                          ),
                  )
                : const SizedBox.shrink(),
            SizedBox(height: 4.h),
            if (widget.imgName.isNotEmpty)
              Row(
                children: [
                  Expanded(flex: 3, child: Container()),
                  Text(
                    "Given Prompt",
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: const Color(0XFF47548C),
                    ),
                  ),
                  Expanded(flex: 2, child: Container()),
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.article_outlined,
                        color: const Color(0XFF47548C),
                        size: 3.h,
                      )),
                ],
              ),
            if (!widget.isGeneratedScreen)
              SizedBox(
                height: 1.h,
              ),
            if (!widget.isGeneratedScreen || widget.isProfileInspireBox)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  widget.text,
                  style: GoogleFonts.lexend(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0XFF8F9BBA),
                    height: 1.75,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
          ],
        ),
      ),
    );
  }
}
