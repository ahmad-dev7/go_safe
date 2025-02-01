// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/config/api_endpoints.dart';
import 'package:http/http.dart' as http;

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String email, String password) {
    emit(LoginStarted());
    //* API call to login
    try {
      http.post(
        Uri.parse(ApiEndpoints.login),
        headers: {
          'Content-Type': 'application/json',
        },
        body: {
          "email": "aali.dev7@gmail.com",
          "password": "aali",
        },
      );
    }
    //! catch error
    catch (e) {
      emit(
        LoginFailed(error: e.toString()),
      );
      print(e.toString());
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

class LoginCompleted extends LoginState {}
