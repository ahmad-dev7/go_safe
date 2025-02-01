import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        "Profile Screen".text.makeCentered(),
        const HeightBox(20),
        ElevatedButton(
          onPressed: () {},
          child: "Logout".text.makeCentered(),
        )
      ],
    );
  }
}
