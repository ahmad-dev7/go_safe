import 'package:flutter_bloc/flutter_bloc.dart';

class LoginSignupSwitchCubit extends Cubit<LoginSignupSwitchState> {
  LoginSignupSwitchCubit() : super(LoginState());

  void updateState() => _toggler();

  _toggler() {
    //* If it is already in login state emit signup state
    if (state is LoginState) {
      emit(SignupState());
    }
    // If it is not in login state  meaning it is in signup state and so emit login state
    else {
      emit(LoginState());
    }
  }
}

abstract class LoginSignupSwitchState {}

class LoginState extends LoginSignupSwitchState {}

class SignupState extends LoginSignupSwitchState {}
