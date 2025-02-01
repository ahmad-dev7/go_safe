import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
}

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupFailed extends SignupState {}

class SignupStarted extends SignupState {}

class SignupCompleted extends SignupState {}
