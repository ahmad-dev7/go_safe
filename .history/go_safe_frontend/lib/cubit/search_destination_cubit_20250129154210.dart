import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_safe/config/api_endpoints.dart';
import 'package:go_safe/config/api_keys.dart';
import 'package:go_safe/cubit/location_permission_cubit.dart';
import 'package:go_safe/model/destination_search_predictions_model.dart';
import 'package:go_safe/model/picked_destination_model.dart';
import 'package:go_safe/model/routes_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class SearchDestinationCubit extends Cubit<SearchDestinationState> {
  SearchDestinationCubit() : super(SearchDestinationInitial());

  Future<void> searchPredictions(String query) async {
    emit(SearchDestinationsLoading());
    var url = "${GoogleMapEndpoints.placeUrl}input=$query&key=${ApiKeys.googleMaps}";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      var predictions = PredictionsResponse.fromJson(data);
      emit(SearchDestinationPredictionsLoaded(destinationPredictions: predictions));
    } else {
      emit(SearchDestinationFailed());
    }
  }

  Future<void> getPickedDestination(String placeId) async {
    emit(SearchDestinationsLoading());
    var url = "${GoogleMapEndpoints.placeLatLangUrl}$placeId&key=${ApiKeys.googleMaps}";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var destination = PickedDestinationModel.fromJson(jsonDecode(response.body));
      fetchPolylinePoints(destination.latLng);
      emit(SearchDestinationPicked(destination: destination));
    }
  }

  Future<void> fetchPolylinePoints(LatLng endLocation) async {
    var source = await Geolocator.getCurrentPosition();
    var origin = "origin=${source.latitude},${source.longitude}&";
    var destination = "destination=${endLocation.latitude},${endLocation.longitude}&";
    var url = GoogleMapEndpoints.directionUrl + origin + destination + GoogleMapEndpoints.directionUrlInfo;
    print("direction url is =>$url");
    final response = await http.get(Uri.parse(url));
  }

  /// when user drags the marker manually
  Future<void> updateDestination(LatLng updatedDestination) async {
    emit(
      SearchDestinationPicked(
        destination: PickedDestinationModel(latLng: updatedDestination),
      ),
    );
  }
}

abstract class SearchDestinationState {}

class SearchDestinationInitial extends SearchDestinationState {}

class SearchDestinationsLoading extends SearchDestinationState {}

class SearchDestinationPredictionsLoaded extends SearchDestinationState {
  PredictionsResponse destinationPredictions;
  SearchDestinationPredictionsLoaded({required this.destinationPredictions});
}

class SearchDestinationPicked extends SearchDestinationState {
  final PickedDestinationModel destination;
  final ListOfRouteModels routeModels;

  SearchDestinationPicked({
    required this.routeModels,
    required this.destination,
  });
}

class SearchDestinationFailed extends SearchDestinationState {}
