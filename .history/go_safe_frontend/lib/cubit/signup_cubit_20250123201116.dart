import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
}

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupFailure extends SignupState {}

class SignupSuccess extends SignupState {}
