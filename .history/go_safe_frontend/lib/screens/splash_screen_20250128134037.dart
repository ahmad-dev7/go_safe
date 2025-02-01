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
    SharedPreferencesServices.logout();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            "assets/animations/splash_screen_animation.json",
            repeat: false,
            onLoaded: (composition) {
              // Get the duration of animation
              var duration = composition.duration;

              // While the animation is playing check if user is loggedIn
              var isUserLoggedIn = SharedPreferencesServices.isUserLoggedIn();

              // if user is loggedIn, fetch required data from the server and store in data variable
              var data = "User is loggedIn, please fetch data: {From Splash Screen}";
              if (isUserLoggedIn) {
                //! Fetch required data from the server
              }

              // Delay for getting the animation played
              Future.delayed(duration).then((value) {
                // Once animation is played, navigate user to either home or loginSignup screen
                if (isUserLoggedIn) {
                  // Navigates to home screen if user is already loggedIn
                  //! Pass fetched data
                  debugPrint(data);
                  Navigator.pushReplacementNamed(context, Routes.screensNavigation);
                } else {
                  // Navigates to loginSignup screen when user is not loggedIn
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
