import 'package:flutter_bloc/flutter_bloc.dart';

class LocationCubit extends Cubit<LocationState> {}

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationRequesting extends LocationState {}

class LocationGranted extends LocationState {}

class LocationDenied extends LocationState {}

class LocationDeniedForever extends LocationState {}
