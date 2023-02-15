import 'package:ai_muse/features/authentication/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CreateNFTScreen extends StatefulWidget {
  const CreateNFTScreen({super.key});

  @override
  State<CreateNFTScreen> createState() => _CreateNFTScreenState();
}

class _CreateNFTScreenState extends State<CreateNFTScreen> {
  TextEditingController textEditingController = TextEditingController();
  int textLength = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leadingWidth: 0,
                  leading: InkWell(
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: 2.5.h,
                    ),
                    onTap: () {},
                  ),
                  title: Text(
                    "Create an NFT",
                    style: GoogleFonts.lexend(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    Text(
                      "Enter a prompt",
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "${textLength}/200",
                      style: GoogleFonts.lexend(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF8F9BBA),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                  decoration: BoxDecoration(
                    color: Color(0XFF8F9BBA).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: textEditingController,
                    onChanged: (val) {
                      textLength = val.length;
                      setState(() {});
                    },
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "What will your NFT be about? ",
                      hintStyle: GoogleFonts.dmSans(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                    ),
                    style: GoogleFonts.dmSans(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLength: 200,
                    maxLines: 10,
                    minLines: 5,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Type anything you want in detail, sky is the limit! ",
                  style: GoogleFonts.dmSans(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF8F9BBA),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 4.5.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 1.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 0.9.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                            color: Color(0XFF4318FF),
                          ),
                        ),
                        child: Text(
                          "Random Prompt!",
                          style: GoogleFonts.dmSans(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0XFF4318FF),
                          ),
                        ),
                      );
                    },
                    itemCount: 10,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "Select an art-style",
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
