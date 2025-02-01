import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  static SharedPreferences? sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> setUserLoggedIn(bool isLoggedIn) async {
    await sharedPreferences?.setBool('isLoggedIn', isLoggedIn);
  }

  static bool isUserLoggedIn() {
    return sharedPreferences?.getBool('isLoggedIn') ?? false;
  }
}
