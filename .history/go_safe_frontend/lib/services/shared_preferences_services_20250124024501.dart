import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  static SharedPreferences? sharedPreferences;

  /// To initialize the instances of sharedPreferences
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  /// To set user as loggedIn
  static Future<void> setUserLoggedIn(bool isLoggedIn) async {
    await sharedPreferences?.setBool('isLoggedIn', isLoggedIn);
  }

  /// To check if user is loggedIn
  static bool isUserLoggedIn() {
    return sharedPreferences?.getBool('isLoggedIn') ?? false;
  }

  /// To logout user
  static void logout() {
    sharedPreferences.clear();
  }
}
