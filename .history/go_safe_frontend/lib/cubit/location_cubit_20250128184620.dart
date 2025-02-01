import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial()) {
    _requestLocationPermission();
  }

  void _requestLocationPermission() async {
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
      userLocation = LatLng(position.latitude, position.longitude);
    } catch (e) {
      emit(LocationRequestError());
    }
  }
}

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationRequesting extends LocationState {}

class LocationGranted extends LocationState {}

class LocationDenied extends LocationState {}

class LocationDeniedForever extends LocationState {}

class LocationRequestError extends LocationState {}
