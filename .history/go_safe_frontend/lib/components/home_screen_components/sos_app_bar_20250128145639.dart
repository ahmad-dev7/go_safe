import 'package:flutter/material.dart';

class SOSAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SOSAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
