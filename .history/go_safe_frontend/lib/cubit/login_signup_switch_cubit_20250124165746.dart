import 'package:flutter_bloc/flutter_bloc.dart';

class LoginSignupStateCubit extends Cubit<LoginSignupStateState> {
  LoginSignupStateCubit() : super(LoginState());

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

abstract class LoginSignupStateState {}

class LoginState extends LoginSignupStateState {}

class SignupState extends LoginSignupStateState {}
