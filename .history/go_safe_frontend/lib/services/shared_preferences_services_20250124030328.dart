import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  static late SharedPreferences sharedPreferences;

  /// To initialize the instances of sharedPreferences
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  /// To set user as loggedIn
  static Future<void> storeUserData(
      {required String email,
      required String phoneNumber,
      required String name,
      required dynamic profilePicture}) async {
    await sharedPreferences.setBool('isLoggedIn', true);
    await sharedPreferences.setString('email', email);
    await sharedPreferences.setString('phoneNumber', phoneNumber);
    await sharedPreferences.setString('name', name);
    await sharedPreferences.setString('profilePicture', profilePicture.toString());
  }

  /// To check if user is loggedIn
  static bool isUserLoggedIn() {
    return sharedPreferences.getBool('isLoggedIn') ?? false;
  }

  /// To logout user
  static void logout() {
    sharedPreferences.clear();
  }
}
