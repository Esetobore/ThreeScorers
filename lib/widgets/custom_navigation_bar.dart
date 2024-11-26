import 'package:flutter/material.dart';

import '../constants/asset_path.dart';

class CustomNavigationBar extends StatefulWidget {
  final int currentIndex;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        const NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Image.asset(AssetsPath.matches, height: 30, width: 50),
          icon: Image.asset(AssetsPath.matches, height: 30, width: 50),
          label: 'Matches',
        ),
        NavigationDestination(
          selectedIcon: Image.asset(AssetsPath.fantasy, height: 30, width: 50),
          icon: Image.asset(AssetsPath.fantasy, height: 30, width: 50),
          label: 'Fantasy',
        ),
        NavigationDestination(
          selectedIcon: Image.asset(AssetsPath.shop, height: 30, width: 50),
          icon: Image.asset(AssetsPath.shop, height: 30, width: 50),
          label: 'Shop',
        ),
        NavigationDestination(
          selectedIcon: Image.asset(AssetsPath.profile, height: 30, width: 50),
          icon: Image.asset(AssetsPath.profile, height: 30, width: 50),
          label: 'My Profile',
        ),
      ],
      selectedIndex: widget.currentIndex,
      onDestinationSelected: (int index) {
        setState(() {
          index;
        });
      },
    );
  }
}
