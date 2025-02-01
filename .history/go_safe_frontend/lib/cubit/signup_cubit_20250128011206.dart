import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/model/user_model.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  void signup() {}
}

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupFailed extends SignupState {
  final String error;

  SignupFailed({required this.error});
}

class SignupStarted extends SignupState {}

class SignupCompleted extends SignupState {
  final UserModel userData;
  SignupCompleted({required this.userData});
}
