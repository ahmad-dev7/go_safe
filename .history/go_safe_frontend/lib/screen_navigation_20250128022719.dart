import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenNavigation extends StatefulWidget {
  const ScreenNavigation({super.key});

  @override
  State<ScreenNavigation> createState() => _ScreenNavigationState();
}

class _ScreenNavigationState extends State<ScreenNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const IndexedStack(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          ...List.generate(
            bottomNavigationBarItems.length,
            (index) => bottomNavigationBarItems[index]!,
          ),
        ],
      ),
    );
  }
}

Map<int, BottomNavigationBarItem> bottomNavigationBarItems = {
  0: const BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.home),
    label: 'Home',
  ),
  1: const BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.share),
    label: "Sharing",
  ),
  1: const BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.person),
    label: "Profile",
  ),
};
