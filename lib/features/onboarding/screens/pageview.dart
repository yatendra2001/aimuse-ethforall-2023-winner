import 'package:ai_muse/features/authentication/screens/link_wallet_screen.dart';
import 'package:ai_muse/features/onboarding/screens/custom_onboarding_screen.dart';
import 'package:ai_muse/features/onboarding/screens/stay_informed.dart';
import 'package:ai_muse/features/onboarding/screens/welcome_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OnboardingPageview extends StatefulWidget {
  static const routeName = '/OnboardingPageview';
  OnboardingPageview({Key? key}) : super(key: key);

  static Route route() {
    return PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        transitionDuration: const Duration(seconds: 0),
        pageBuilder: (context, _, __) => OnboardingPageview());
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              _pageController.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
      ),
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          _pageController.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        },
        child: SafeArea(
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            onPageChanged: _onPageViewChange,
            children: _buildPages(),
          ),
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
            "Nullam ut augue mi. Vestibulum porta, libero condimentum euismod maximus, ligula purus pretium nibh.",
      ),
      CustomScreen(
        pageNumber: 2,
        pageController: _pageController,
        title: "Instantly transform your ideas to creative NFTs",
        text:
            "Nullam ut augue mi. Vestibulum porta, libero condimentum euismod maximus, ligula purus pretium nibh.",
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
