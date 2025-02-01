import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/config/api_endpoints.dart';
import 'package:go_safe/model/user_model.dart';
import 'package:go_safe/services/shared_preferences_services.dart';
import 'package:http/http.dart' as http;

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  void signup({
    required String name,
    required String phoneNumber,
    required String email,
    required String password,
  }) async {
    //* API call to signup
    try {
      var response = await http.post(
        Uri.parse(ApiEndpoints.signup),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          {
            "name": name,
            "email": email,
            "password": password,
            "phoneNumber": phoneNumber,
          },
        ),
      );
      if (response.statusCode == 200) {
        //* Login successful
        var userData = UserModel.fromJson(jsonDecode(response.body)["user"]);
        SharedPreferencesServices.storeUserData(userData: userData);
        emit(SignupCompleted(userData: userData));
      } else {
        emit(
          SignupFailed(error: jsonDecode(response.body)["message"]),
        );
      }
    }
    //! catch error
    catch (e) {
      emit(
        SignupFailed(error: e.toString()),
      );
      debugPrint(e.toString());
    }
  }
}

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupFailed extends SignupState {
  final String error;

  SignupFailed({required this.error});
}

class SignupStarted extends SignupState {}

class SignupCompleted extends SignupState {
  final UserModel userData;
  SignupCompleted({required this.userData});
}
