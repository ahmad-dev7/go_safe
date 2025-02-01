import 'package:flutter/material.dart';
import 'package:go_safe/services/shared_preferences_services.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SharedPreferencesServices.getName()!.text.makeCentered(),
    );
  }
}
