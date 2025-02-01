import 'package:flutter_bloc/flutter_bloc.dart';

class LoginSignupSwitchCubit extends Cubit<LoginSignupSwitchState> {
  LoginSignupSwitchCubit() : super(LoginSwitch());
}

abstract class LoginSignupSwitchState {}

class LoginSwitch extends LoginSignupSwitchState {}

class SignupSwitch extends LoginSignupSwitchState {}
