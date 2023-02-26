import 'package:ai_muse/features/onboarding/screens/custom_onboarding_screen.dart';
import 'package:ai_muse/features/onboarding/screens/stay_informed.dart';
import 'package:ai_muse/features/onboarding/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class OnboardingPageview extends StatefulWidget {
  static const routeName = '/OnboardingPageview';
  const OnboardingPageview({Key? key}) : super(key: key);

  static Route route() {
    return PageRouteBuilder(
      settings: const RouteSettings(name: routeName),
      transitionDuration: const Duration(seconds: 0),
      pageBuilder: (context, _, __) => OnboardingPageview(),
    );
  }

  @override
  State<OnboardingPageview> createState() => _OnboardingPageviewState();
}

class _OnboardingPageviewState extends State<OnboardingPageview> {
  int _page = 0;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: _page != 0
            ? IconButton(
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.linear,
                  );
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ),
              )
            : null,
      ),
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          _pageController.nextPage(
            duration: Duration(milliseconds: 450),
            curve: Curves.linear,
          );
        },
        child: PageView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          onPageChanged: _onPageViewChange,
          children: _buildPages(),
        ),
      ),
    );
  }

  List<Widget> _buildPages() {
    return [
      WelcomeScreen(
        pageController: _pageController,
      ),
      CustomScreen(
        pageNumber: 1,
        pageController: _pageController,
        title: "Get inspired by our unique NFT Prompts ",
        text:
            "Giving you the jumpstart you need to create unique, one-of-a-kind NFTs that stand out in the crowd.",
      ),
      CustomScreen(
        pageNumber: 2,
        pageController: _pageController,
        title: "Instantly transform your ideas to creative NFTs",
        text:
            "The ultimate tool for creating unique and personalized NFTs. With our easy-to-use prompts, you can create stunning NFTs in just a few simple steps.",
      ),
      StayInformedScreen(
        pageNumber: 3,
        pageController: _pageController,
        title: "Stay informed",
        text:
            "Stay up to date with exclusive NFT drops, giveaways, and more by following our socials.",
      ),
    ];
  }

  _onPageViewChange(int value) {
    setState(() {
      _page = value;
    });
  }
}
