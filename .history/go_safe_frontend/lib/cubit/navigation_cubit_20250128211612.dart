import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());
}

class NavigationState {}

class NavigationInitial extends NavigationState {}

class NavigationDestinationPicked extends NavigationState {
  final LatLng destination;

  NavigationDestinationPicked({required this.destination});
}

class NavigationStarted extends NavigationState {}

class NavigationEnded extends NavigatorState {}

class NavigationInterrupted extends NavigatorState {}
