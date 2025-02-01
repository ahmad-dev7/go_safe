import 'package:flutter_bloc/flutter_bloc.dart';

class LoginSignupSwitchCubit extends Cubit<LoginSignupSwitchState> {
  LoginSignupSwitchCubit() : super(LoginSwitch());

  void updateState() => toggler();

  toggler() {
    //* If it is already in login state emit signup state
    if (state is LoginSwitch) {
      emit(SignupSwitch());
    }
    // If it is not in login state  meaning it is in signup state and so emit login state
    else {
      emit(LoginSwitch());
    }
  }
}

abstract class LoginSignupSwitchState {}

class LoginSwitch extends LoginSignupSwitchState {}

class SignupSwitch extends LoginSignupSwitchState {}
