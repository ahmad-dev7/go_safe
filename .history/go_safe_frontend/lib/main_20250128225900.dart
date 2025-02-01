import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/cubit/location_permission_cubit.dart';
import 'package:go_safe/cubit/login_cubit.dart';
import 'package:go_safe/cubit/login_signup_switch_cubit.dart';
import 'package:go_safe/cubit/search_destination_cubit.dart';
import 'package:go_safe/cubit/signup_cubit.dart';
import 'package:go_safe/cubit/voice_monitor_cubit.dart';
import 'package:go_safe/routes/routes.dart';
import 'package:go_safe/screen_navigation.dart';
import 'package:go_safe/screens/login_signup_screen.dart';
import 'package:go_safe/screens/splash_screen.dart';
import 'package:go_safe/services/shared_preferences_services.dart';
import 'package:go_safe/theme/dark_theme_data.dart';
import 'package:go_safe/theme/light_theme_data.dart';
import 'package:velocity_x/velocity_x.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => LoginSignupSwitchCubit()),
        BlocProvider(create: (ctx) => LoginCubit()),
        BlocProvider(create: (ctx) => SignupCubit()),
        BlocProvider(create: (ctx) => VoiceMonitorCubit()),
        BlocProvider(create: (ctx) => LocationPermissionCubit()),
        BlocProvider(create: (ctx) => SearchDestinationCubit()),
      ],
      child: MaterialApp(
        title: 'Go Safe',
        debugShowCheckedModeBanner: false,
        theme: context.brightness == Brightness.dark ? DarkThemeData.themeData : LightThemeData.themeData,
        routes: <String, WidgetBuilder>{
          Routes.initial: (context) => const SplashScreen(),
          Routes.loginSignup: (context) => const LoginSignupScreen(),
          Routes.screensNavigation: (context) => const ScreenNavigation(),
        },
      ),
    );
  }
}
