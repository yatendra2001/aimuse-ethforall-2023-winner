import 'dart:developer' as developer;

import 'package:ai_muse/common_widgets/custom_button.dart';
import 'package:ai_muse/features/authentication/widgets/custom_outlined_button.dart';
import 'package:ai_muse/features/create%20nft/models/color_scheme_model.dart';
import 'package:ai_muse/features/create%20nft/screens/generate_nft_screen.dart';
import 'package:ai_muse/features/create%20nft/widgets/outlined_box.dart';
import 'package:ai_muse/mint_nft/nft_mint_repo.dart';
import 'package:ai_muse/features/loading/loading_page.dart';
import 'package:ai_muse/utils/session_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

class CreateNFTScreen extends StatefulWidget {
  static const routeName = '/createNFTScreen';
  const CreateNFTScreen({super.key});

  @override
  State<CreateNFTScreen> createState() => _CreateNFTScreenState();
}

class _CreateNFTScreenState extends State<CreateNFTScreen> {
  TextEditingController promptController = TextEditingController();
  List<String> selectedartstyle = [];
  List<String> selectedartist = [];
  List<String> selectedPrompt = [];
  List<CustomColorScheme> selectedColorScheme = [];
  List<String> selectedcolors = [];
  List<String> selectedfinishTouch = [];
  int textLength = 0;

  Map<String, String> artStyle = {
    "Pixelated": "assets/images/artstyle_img_1.jpg",
    "Digital Art": "assets/images/artstyle_img_2.jpg",
    "Art Nouveau": "assets/images/artstyle_img_3.jpg",
    "Avant-garde": "assets/images/artstyle_img_4.jpg",
    "Baroque": "assets/images/artstyle_img_5.jpg",
    "CoBrA": "assets/images/artstyle_img_6.jpg",
    "Color Field Painting": "assets/images/artstyle_img_7.jpg",
    "Conceptual art": "assets/images/artstyle_img_8.jpg",
    "Constructivism": "assets/images/artstyle_img_9.jpeg",
    "Cubism": "assets/images/artstyle_img_10.jpg",
  };

  List<String> finishingTouches = [
    "Unity Engine",
    "Flat light",
    "Unreal Engine",
    "Broad light",
    "CryEngine",
    "Backlight",
    "Blender Engine",
    "Rim light",
    "Maya Engine",
    "CGSociety Top Rated",
    "Butterfly light",
    "Devianart Top Rated",
  ];

  List<CustomColorScheme> colorScheme = [
    CustomColorScheme("Red", ["FF0000"], false),
    CustomColorScheme("Pink & Purple", ["E1BEE7", "CE93D8"], true),
    CustomColorScheme("Blue", ["0000FF"], false),
    CustomColorScheme("Orange Gradient", ["FFCC80", "FFB74D"], true),
    CustomColorScheme("Green", ["00FF00"], false),
    CustomColorScheme("Blue Gradient", ["B2EBF2", "00BCD4"], true),
    CustomColorScheme("Yellow", ["FFFF00"], false),
    CustomColorScheme("Green Gradient", ["C8E6C9", "81C784"], true),
    CustomColorScheme("Purple", ["800080"], false),
    CustomColorScheme("Yellow Gradient", ["FFF59D", "FBC02D"], true),
    CustomColorScheme("Orange", ["FFA500"], false),
    CustomColorScheme("Light Orange Gradient", ["FFAB91", "FF8A65"], true),
    CustomColorScheme("Pink", ["FFC0CB"], false),
    CustomColorScheme("Blue & Light Blue", ["90CAF9", "2196F3"], true),
    CustomColorScheme("Brown", ["A52A2A"], false),
    CustomColorScheme("Red & Yellow", ["FFEB3B", "F44336"], true),
    CustomColorScheme("Gray", ["808080"], false),
    CustomColorScheme("Purple & Pink", ["D1C4E9", "9C27B0"], true),
    CustomColorScheme("Black", ["000000"], false),
    CustomColorScheme("Pink & Red", ["FFCDD2", "E91E63"], true)
  ];

  List<String> prompts = [
    "A turtle wearing a top hat and monocle",
    "A dog driving a car",
    "A squirrel water skiing",
    "A snail running a marathon",
    "A penguin playing basketball",
    "A cat knitting a sweater",
    "A fish playing a musical instrument",
    "A bear riding a unicycle",
    "A frog riding a skateboard",
    "A hamster flying a plane",
    "A koala using a computer",
    "A horse playing video games",
    "A parrot doing a magic trick",
    "A raccoon cooking in the kitchen",
    "A kangaroo playing the guitar",
    "A monkey riding a bicycle"
  ];

  Map<String, String> arts = {
    "Leonardo Da Vinci": "assets/images/art_1.jpg",
    "Vincent Van Gogh": "assets/images/art_2.jpg",
    "Pablo Picasso": "assets/images/art_3.jpg",
    "Claude Monet": "assets/images/art_4.jpg",
    "Johannes Vermeer": "assets/images/art_5.jpeg",
    "Edvard Munch": "assets/images/art_6.jpg",
    "Salvador Dali": "assets/images/art_7.jpg",
    "Andy Warhol": "assets/images/art_8.jpg",
    "René François": "assets/images/art_9.jpg",
    "Henri Matisse": "assets/images/art_10.jpg",
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Enter a prompt",
                          style: GoogleFonts.lexend(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "$textLength/200",
                          style: GoogleFonts.lexend(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0XFF8F9BBA),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                      decoration: BoxDecoration(
                        color: const Color(0XFF8F9BBA).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: promptController,
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
                        color: const Color(0XFF8F9BBA),
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
                          return OutlinedBox(
                            text: prompts[index],
                            selected: selectedPrompt.contains(prompts[index]),
                            onPressed: () {
                              if (selectedPrompt.contains(prompts[index])) {
                                selectedPrompt.remove(prompts[index]);
                              } else {
                                selectedPrompt.add(prompts[index]);
                              }
                              getPrompt();
                            },
                          );
                        },
                        itemCount: prompts.length,
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
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                      height: 45.h,
                      width: double.infinity,
                      child: GridView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        children: artStyle.entries.map(
                          (MapEntry mapEntry) {
                            return GestureDetector(
                              onTap: () {
                                if (selectedartstyle.contains(mapEntry.key)) {
                                  selectedartstyle.remove(mapEntry.key);
                                } else {
                                  selectedartstyle.add(mapEntry.key);
                                }
                                getPrompt();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(1.h),
                                padding: EdgeInsets.all(1.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color:
                                        selectedartstyle.contains(mapEntry.key)
                                            ? Color(0XFF4318FF)
                                            : Color.fromRGBO(0, 0, 0, 0),
                                    width: 1.5,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Transform.scale(
                                          scaleX: 1.1,
                                          scaleY: 1.05,
                                          child: Image.asset(
                                            mapEntry.value,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      mapEntry.key,
                                      style: GoogleFonts.lexend(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.sp,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "Select an artist",
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                      height: 50.h,
                      width: double.infinity,
                      child: GridView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        children: arts.entries.map(
                          (mapEntry) {
                            return GestureDetector(
                              onTap: () {
                                if (selectedartist.contains(mapEntry.key)) {
                                  selectedartist.remove(mapEntry.key);
                                } else {
                                  selectedartist.add(mapEntry.key);
                                }
                                getPrompt();
                              },
                              child: Container(
                                margin: EdgeInsets.all(1.h),
                                padding: EdgeInsets.all(1.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: selectedartist.contains(mapEntry.key)
                                        ? Color(0XFF4318FF)
                                        : Color.fromRGBO(0, 0, 0, 0),
                                    width: 1.5,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Transform.scale(
                                          scaleX: 1.1,
                                          scaleY: 1.05,
                                          child: Image.asset(
                                            mapEntry.value,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      mapEntry.key,
                                      style: GoogleFonts.lexend(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "Select a colour scheme ",
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                      height: 30.h,
                      width: double.infinity,
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          CustomColorScheme cstScheme = colorScheme[index];
                          return GestureDetector(
                            onTap: () {
                              if (selectedColorScheme.contains(cstScheme)) {
                                selectedColorScheme.remove(cstScheme);
                              } else {
                                selectedColorScheme.add(cstScheme);
                              }
                              getPrompt();
                            },
                            child: Container(
                              margin: EdgeInsets.all(1.h),
                              padding: EdgeInsets.all(1.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: selectedColorScheme.contains(cstScheme)
                                      ? Color(0XFF4318FF)
                                      : Color.fromRGBO(0, 0, 0, 0),
                                  width: 1.5,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: cstScheme.gradient
                                            ? null
                                            : Color(int.parse(
                                                "0XFF${cstScheme.colorCode[0]}")),
                                        gradient: cstScheme.gradient
                                            ? LinearGradient(
                                                colors: cstScheme.colorCode
                                                    .map((color) {
                                                  return Color(
                                                    int.parse("0XFF$color"),
                                                  );
                                                }).toList(),
                                              )
                                            : null,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    cstScheme.colorName,
                                    style: GoogleFonts.lexend(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: colorScheme.length,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      "Finishing touches",
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      height: 16.h,
                      width: double.infinity,
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.45,
                        ),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 1.h,
                            ),
                            child: OutlinedBox(
                              selected: selectedfinishTouch
                                  .contains(finishingTouches[index]),
                              text: finishingTouches[index],
                              onPressed: () {
                                if (selectedfinishTouch
                                    .contains(finishingTouches[index])) {
                                  selectedfinishTouch
                                      .remove(finishingTouches[index]);
                                } else {
                                  selectedfinishTouch
                                      .add(finishingTouches[index]);
                                }
                                getPrompt();
                              },
                            ),
                          );
                        },
                        itemCount: finishingTouches.length,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Center(
                      child: CustomButton(
                        onPressed: generate,
                        text: "Generate",
                        showIcon: false,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void getPrompt() {
    String newPromp = "";
    for (int i = 0; i < selectedPrompt.length; i++) {
      newPromp += "${selectedPrompt[i]}, ";
    }

    for (int i = 0; i < selectedartstyle.length; i++) {
      newPromp += "${selectedartstyle[i]} artstyle, ";
    }

    for (int i = 0; i < selectedartist.length; i++) {
      newPromp += "by ${selectedartist[i]}, ";
    }

    for (int i = 0; i < selectedColorScheme.length; i++) {
      if (selectedColorScheme[i].gradient == true) {
        String color = "";
        for (int j = 0; j < selectedColorScheme[i].colorCode.length; j++) {
          color += selectedColorScheme[i].colorCode[j] + ", ";
        }
        newPromp += "gradient : [$color], ";
      } else {
        newPromp += "${selectedColorScheme[i].colorName}, ";
      }
    }

    for (int i = 0; i < selectedfinishTouch.length; i++) {
      newPromp += "${selectedfinishTouch[i]}, ";
    }

    textLength = newPromp.length;
    promptController.text = newPromp;
    promptController.text = promptController.text
        .replaceRange(promptController.text.length - 2, null, ".");
    setState(() {});
  }

  void generate() {
    if (promptController.text.isNotEmpty) {
      SessionHelper.currentPrompt = promptController.text;
      developer.log(SessionHelper.currentPrompt ?? "");
      Navigator.of(context).pushNamed(GenerateNFTScreen.routeName);
    } else {
      Fluttertoast.showToast(
          msg: "Empty prompt", backgroundColor: Colors.black45);
    }
  }
}

//  SizedBox(
//                   height: 4.h,
//                 ),
//                 Center(
//                   child: CustomButton(
//                     onPressed: () async {
//                       print(promptController.text);
//                       bool isLoading = true;
//                       String? image =
//                           "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg";
//                       // await generateImage(prompt: promptController.text);
//                       setState(() {
//                         isLoading = false;
//                       });
//                       showDialog(
//                           context: context,
//                           builder: (context) => AlertDialog(
//                                 title: isLoading
//                                     ? CircularProgressIndicator()
//                                     : image != null
//                                         ? Image.network(image)
//                                         : Container(
//                                             child: Text(
//                                                 "Please Enter Text To Generate AI image"),
//                                           ),
//                                 actions: [
//                                   CustomOutlineButton(
//                                       text: "Regenerate",
//                                       onPressed: () =>
//                                           Navigator.of(context).pop()),
//                                   SizedBox(height: 2.h),
//                                   CustomOutlineButton(
//                                       text: "Mint NFT",
//                                       onPressed: () async =>
//                                           await uploadImageToIPFS()
//                                       //  await mintNFT(
//                                       //     chain: "polygon",
//                                       //     NFT_Name: "Test",
//                                       //     NFT_Description: "This is my test NFT",
//                                       //     mintingAddress:
//                                       //         "0x27D2e0a212332f066f5D9fe7C6847Ad70069B0AF"),
//                                       ),
//                                 ],
//                               ));
//                     },
//                     text: "Generate",
//                     showIcon: false,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 4.h,
//                 ),
//               ],
//             ),
