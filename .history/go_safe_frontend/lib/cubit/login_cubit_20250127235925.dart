import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String email, String password) {
    emit(LoginStarted());
  }
}

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginFailed extends LoginState {}

class LoginStarted extends LoginState {}

class LoginCompleted extends LoginState {}
