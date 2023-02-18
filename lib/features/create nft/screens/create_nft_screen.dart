import 'dart:developer';

import 'package:ai_muse/common_widgets/custom_button.dart';
import 'package:ai_muse/features/authentication/widgets/custom_outlined_button.dart';
import 'package:ai_muse/features/create%20nft/models/color_scheme_model.dart';
import 'package:ai_muse/features/create%20nft/screens/generate_nft_screen.dart';
import 'package:ai_muse/features/create%20nft/widgets/outlined_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    "8-bit": "assets/images/art_style1.png",
    "Abstract": "assets/images/art_style2.png",
    "Fantasv": "assets/images/art_style3.png",
    "Water Color": "assets/images/art_style4.png",
    "Comic": "assets/images/art_style5.png",
    "Water Colour": "assets/images/art_style6.png",
  };

  List<String> finishingTouches = [
    "Highly detailed",
    "Wide portrait",
    "Orange",
    "Highly detailed",
    "Wide portrait ",
    "Highly detailed",
    "Wide portrait",
    "Orange",
    "Highly detailed",
    "Wide portrait ",
  ];

  List<CustomColorScheme> colorScheme = [
    CustomColorScheme("Gold", ["BE9C44"], false),
    CustomColorScheme("Abstract", ["D9D9D9"], false),
    CustomColorScheme("Fantasv", ["D9D9D9"], false),
    CustomColorScheme("Gradient", ["00FFF0", "0083FE"], true),
    CustomColorScheme("Cosmic", ["D9D9D9"], false),
    CustomColorScheme("Water Color", ["D9D9D9"], false),
  ];

  List<String> prompts = [
    "random",
    "monkey on bicycle",
    "monkey on bicycle",
    "monkey on bicycle",
    "monkey on bicycle",
    "monkey on bicycle",
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
                                margin: EdgeInsets.all(1.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color:
                                        selectedartstyle.contains(mapEntry.key)
                                            ? Color(0XFF4318FF)
                                            : Colors.transparent,
                                    width: 1.5,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Transform.scale(
                                      scale: 1.1,
                                      child: Image.asset(
                                        mapEntry.value,
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
                      height: 60.h,
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
                      height: 50.h,
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
      newPromp += selectedPrompt[i];
    }

    for (int i = 0; i < selectedartstyle.length; i++) {
      newPromp += selectedartstyle[i];
    }

    for (int i = 0; i < selectedartist.length; i++) {
      newPromp += selectedartist[i];
    }

    for (int i = 0; i < selectedColorScheme.length; i++) {
      if (selectedColorScheme[i].gradient == true) newPromp += "gradient : [";
      for (int j = 0; j < selectedColorScheme[i].colorCode.length; j++) {
        newPromp += selectedColorScheme[i].colorCode[j];
      }
      if (selectedColorScheme[i].gradient == true) newPromp += "]";
    }

    for (int i = 0; i < selectedfinishTouch.length; i++) {
      newPromp += selectedfinishTouch[i];
    }

    textLength = newPromp.length;
    promptController.text = newPromp;
    setState(() {});
  }

  void generate() {
    Navigator.of(context).pushNamed(GenerateNFTScreen.routeName);
  }
}
