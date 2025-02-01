import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/config/api_endpoints.dart';
import 'package:go_safe/model/user_model.dart';
import 'package:http/http.dart' as http;

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String email, String password) async {
    emit(LoginStarted());
    //* API call to login
    try {
      var response = await http.post(
        Uri.parse(ApiEndpoints.login),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "email": "aali.dev7@gmail.com",
          "password": "aali",
        }),
      );
      if (response.statusCode == 200) {
        //* Login successful
        emit(
          LoginCompleted(
            userData: UserModel.fromJson(
              jsonDecode(response.body)["user"],
            ),
          ),
        );
      } else {
        emit(
          LoginFailed(error: jsonDecode(response.body)["message"]),
        );
      }
    }
    //! catch error
    catch (e) {
      emit(
        LoginFailed(error: e.toString()),
      );
      debugPrint(e.toString());
    }
  }
}

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginFailed extends LoginState {
  final String error;

  LoginFailed({required this.error});
}

class LoginStarted extends LoginState {}

class LoginCompleted extends LoginState {
  final UserModel userData;

  LoginCompleted({required this.userData});
}
