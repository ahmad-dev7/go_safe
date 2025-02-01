import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  static late SharedPreferences sharedPreferences;

  /// To initialize the instances of sharedPreferences
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Store usr info, and mark [isLoggedIn] to true
  static Future<void> storeUserData(
      {required String email,
      required String phoneNumber,
      required String name,
      required dynamic profilePicture}) async {
    await sharedPreferences.setBool('isLoggedIn', true);
    await sharedPreferences.setString('email', email);
    await sharedPreferences.setString('phoneNumber', phoneNumber);
    await sharedPreferences.setString('name', name);
  }

  /// Store profile picture
  static Future<void> storeProfilePicture(String url) async => await sharedPreferences.setString("profilePicture", url);

  /// Get user email
  static String? getEmail() => sharedPreferences.getString("email");

  /// Get user phoneNumber
  static String? getPhoneNumber() => sharedPreferences.getString("phoneNumber");

  /// Get user name
  static String? getName() => sharedPreferences.getString("name");

  /// To check if user is loggedIn
  static bool isUserLoggedIn() => sharedPreferences.getBool('isLoggedIn') ?? false;

  /// To logout user, clear local storage
  static void logout() {
    sharedPreferences.clear();
  }
}
