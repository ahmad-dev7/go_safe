import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPermissionCubit extends Cubit<LocationState> {
  LocationPermissionCubit() : super(LocationInitial()) {
    requestLocationPermission();
  }

  void requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      emit(LocationDenied());
    } else if (permission == LocationPermission.deniedForever) {
      emit(LocationDeniedForever());
    } else {
      _getCurrentLocation();
      emit(LocationRequesting());
    }
  }

  void _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      debugPrint("Latitude: ${position.latitude}, Longitude: ${position.longitude}");
      emit(LocationGranted(LatLng(position.latitude, position.longitude)));
      debugPrint("Current state should be: $state");
    } catch (e) {
      emit(LocationRequestError(e.toString()));
    }
  }
}

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationRequesting extends LocationState {}

class LocationGranted extends LocationState {
  final LatLng userLocation;
  LocationGranted(this.userLocation);
}

class LocationDenied extends LocationState {}

class LocationDeniedForever extends LocationState {}

class LocationRequestError extends LocationState {
  final String error;

  LocationRequestError(this.error);
}
