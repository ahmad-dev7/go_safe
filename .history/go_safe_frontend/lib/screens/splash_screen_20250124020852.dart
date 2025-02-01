import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            "assets/animations/splash_screen_animation.json",
            repeat: false,
            onLoaded: (composition) {
              var duration = composition.duration;
              Future.delayed(duration).then((value) => Navigator.pushReplacementNamed(context, "LoginSignup"));
            },
          ),
          FadeInDown(
            duration: 300.milliseconds,
            child: "Go Safe".text.bold.size(30).makeCentered(),
          ),
        ],
      ),
    );
  }
}
