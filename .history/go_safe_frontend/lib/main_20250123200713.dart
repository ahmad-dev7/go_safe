import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/cubit/login_singup_switch_cubit.dart';
import 'package:go_safe/screens/home_screen.dart';
import 'package:go_safe/screens/login_signup_screen.dart';
import 'package:go_safe/screens/splash_screen.dart';
import 'package:go_safe/theme/dark_theme_data.dart';
import 'package:go_safe/theme/light_theme_data.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginSignupSwitchCubit()),
      ],
      child: MaterialApp(
        title: 'Go Safe',
        theme: context.brightness == Brightness.dark ? DarkThemeData.themeData : LightThemeData.themeData,
        routes: <String, WidgetBuilder>{
          '/': (context) => const SplashScreen(),
          "LoginSignup": (context) => const LoginSignupScreen(),
          "home": (context) => const HomeScreen(),
        },
      ),
    );
  }
}
