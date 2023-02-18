import 'package:ai_muse/features/authentication/screens/link_wallet_screen.dart';
import 'package:ai_muse/features/create%20nft/screens/create_nft_screen.dart';
import 'package:ai_muse/features/dashboard/screens/bottom_nav_screen.dart';
import 'package:ai_muse/features/dashboard/screens/dashobard_screen.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: const RouteSettings(name: '/'),
          builder: (_) => const Scaffold(),
        );
      case CreateNFTScreen.routeName:
        return MaterialPageRoute(
          settings: const RouteSettings(name: CreateNFTScreen.routeName),
          builder: (_) => const CreateNFTScreen(),
        );
      case LinkWalletScreen.routename:
        return MaterialPageRoute(
          settings: const RouteSettings(name: LinkWalletScreen.routename),
          builder: (_) => const LinkWalletScreen(),
        );
      case BottomNavBarScreen.routename:
        return MaterialPageRoute(
          settings: const RouteSettings(name: BottomNavBarScreen.routename),
          builder: (_) => const BottomNavBarScreen(),
        );
      case DashBoardScreen.routename:
        return MaterialPageRoute(
          settings: const RouteSettings(name: DashBoardScreen.routename),
          builder: (_) => const DashBoardScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
