import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
}

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginFailure extends LoginState {}

class LoginSuccess extends LoginState {}
