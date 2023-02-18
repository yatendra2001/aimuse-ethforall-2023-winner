import 'package:ai_muse/common_widgets/custom_button.dart';
import 'package:ai_muse/common_widgets/inspired_image_box.dart';
import 'package:ai_muse/features/create%20nft/widgets/outlined_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class GenerateNFTScreen extends StatefulWidget {
  static const routeName = '/generate-nft-screen';
  const GenerateNFTScreen({super.key});

  @override
  State<GenerateNFTScreen> createState() => _GenerateNFTScreenState();
}

class _GenerateNFTScreenState extends State<GenerateNFTScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 2.5.h,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Text(
                "Generate NFT",
                style: GoogleFonts.lexend(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  color: Colors.black,
                ),
              ),
            ),
            const InspiredImageBox(
              showbgColor: false,
              imgName: "db_img1",
              text:
                  'Highly detailed wide portrait young woman anime, by atey ghailan, by greg rutkowski, by greg tocchini, by james gilleard, by joe fenton, by kaethe butcher, gradient light blue, brown, blonde cream and white color scheme, grunge aesthetic, 8 k, optimistic',
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.refresh,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "Regernate",
                              style: GoogleFonts.lexend(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: const Color(0XFF8F9BBA),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 4,
                      child: OutlinedBox(
                        text: "Cancel",
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        selected: false,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 4,
                      child: CustomButton(
                        showIcon: false,
                        onPressed: () {},
                        text: "Generate",
                      ),
                    ),
                    const Spacer(),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
