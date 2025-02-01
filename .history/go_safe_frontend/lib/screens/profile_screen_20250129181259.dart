import 'package:flutter/material.dart';
import 'package:go_safe/services/shared_preferences_services.dart';
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        "Profile Screen".text.makeCentered(),
        const HeightBox(20),
        ElevatedButton(
          onPressed: () => SharedPreferencesServices.logout(context),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: "Logout".text.white.make(),
        )
      ],
    );
  }
}
