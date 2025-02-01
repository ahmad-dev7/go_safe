import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class SharingScreen extends StatefulWidget {
  const SharingScreen({super.key});

  @override
  State<SharingScreen> createState() => _SharingScreenState();
}

class _SharingScreenState extends State<SharingScreen> {
  @override
  Widget build(BuildContext context) {
    return "Sharing Screen".text.makeCentered();
  }
}
