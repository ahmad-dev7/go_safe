import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/routes/routes.dart';
import 'package:go_safe/services/shared_preferences_services.dart';
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
              Future.delayed(duration).then((value) {
                if (SharedPreferencesServices.isUserLoggedIn()) {
                  Navigator.pushReplacementNamed(context, Routes.home);
                } else {
                  Navigator.pushReplacementNamed(context, Routes.loginSignup);
                }
              });
            },
          ),
          FadeInDown(
            duration: 300.milliseconds,
            delay: 100.milliseconds,
            child: "Go Safe".text.bold.size(30).makeCentered(),
          ),
        ],
      ),
    );
  }
}
