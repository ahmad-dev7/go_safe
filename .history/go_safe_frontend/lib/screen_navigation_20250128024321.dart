import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:go_safe/screens/home_screen.dart';
import 'package:go_safe/screens/profile_screen.dart';
import 'package:go_safe/screens/sharing_screen.dart';

class ScreenNavigation extends StatefulWidget {
  const ScreenNavigation({super.key});

  @override
  State<ScreenNavigation> createState() => _ScreenNavigationState();
}

class _ScreenNavigationState extends State<ScreenNavigation> {
  int activeNavigationIndex = 0;

  List<BottomNavigationBarItem> bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.share),
      label: "Sharing",
    ),
    const BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.person),
      label: "Profile",
    ),
  ];

  List<Widget> screens = [
    const HomeScreen(),
    const SharingScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: activeNavigationIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: (index) => setState(() => activeNavigationIndex = index),
        selectedItemColor: AppColors.accent(context),
        unselectedItemColor: AppColors.secondary(context),
        items: [
          ...List.generate(
            bottomNavigationBarItems.length,
            (index) => bottomNavigationBarItems[index],
          ),
        ],
      ),
    );
  }
}
