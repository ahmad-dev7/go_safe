import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());
}

class NavigationState {}

class NavigationInitial extends NavigationState {}
