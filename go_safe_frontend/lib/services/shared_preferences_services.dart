import 'package:flutter/material.dart';
import 'package:go_safe/model/user_model.dart';
import 'package:go_safe/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  /// It is initialized from main method
  static late SharedPreferences sharedPreferences;

  /// To initialize the instances of sharedPreferences
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Store usr info, and mark [isUserLoggedIn] to true. This method doesn't stores profile picture. Call [storeProfilePicture] for storing profilePicture
  static Future<void> storeUserData({required UserModel userData}) async {
    await sharedPreferences.setBool('isLoggedIn', true);
    await sharedPreferences.setString('email', userData.email!);
    await sharedPreferences.setString('phoneNumber', userData.phoneNumber!);
    await sharedPreferences.setString('name', userData.name!);
    await sharedPreferences.setString('id', userData.id!);
  }

  /// Store profile picture
  static Future<void> storeProfilePicture(String url) async => await sharedPreferences.setString("profilePicture", url);

  /// Get profile picture
  static String? getProfilePicture() => sharedPreferences.getString("profilePicture");

  /// Get user email
  static String? getEmail() => sharedPreferences.getString("email");

  /// Get user phoneNumber
  static String? getPhoneNumber() => sharedPreferences.getString("phoneNumber");

  /// Get user name
  static String? getName() => sharedPreferences.getString("name");

  /// To check if user is loggedIn
  static bool isUserLoggedIn() => sharedPreferences.getBool('isLoggedIn') ?? false;

  /// To logout user, clear local storage
  static void logout(BuildContext context) {
    sharedPreferences.clear();
    Navigator.of(context).pushReplacementNamed(Routes.loginSignup);
  }
}
