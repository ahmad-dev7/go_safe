import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String email, String password) {
    emit(LoginLoading());
  }
}

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginFailure extends LoginState {}

class LoginStarted extends LoginState {}

class LoginCompleted extends LoginState {}
