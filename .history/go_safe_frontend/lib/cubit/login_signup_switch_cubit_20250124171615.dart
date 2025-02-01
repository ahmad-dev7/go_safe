import 'package:flutter_bloc/flutter_bloc.dart';

/// Login and signup fields are shown on the same page.
/// The user can choose to either login or signup.
/// For signup some extra input fields are made visible
/// whereas for login those extra input fields are hidden
///* This cubit is used to toggle between these two states and show/hide input fields

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
