import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/config/api_endpoints.dart';
import 'package:go_safe/config/api_keys.dart';
import 'package:go_safe/model/destination_search_predictions_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class SearchDestinationCubit extends Cubit<SearchDestinationState> {
  SearchDestinationCubit() : super(SearchDestinationInitial());

  Future<void> searchOptions(String query) async {
    emit(SearchDestinationsLoading());
    var url = "${GoogleMapEndpoints.placeUrl}input=$query&key=${ApiKeys.googleMaps}";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      var predictions = PredictionsResponse.fromJson(data);

      emit(SearchDestinationOptionsLoaded(destinationOptions: predictions));
    } else {
      emit(SearchDestinationFailed());
    }
  }

  Future<void> getPickedDestination(String placeId) async {
    var url = "${GoogleMapEndpoints.placeLatLangUrl}$placeId&key=${ApiKeys.googleMaps}";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      var location = data["result"]["geometry"]["location"];
      emit(SearchDestinationPicked(
        destination: LatLng(location['lat'], location['lng']),
      ));
    }
  }
}

abstract class SearchDestinationState {}

class SearchDestinationInitial extends SearchDestinationState {}

class SearchDestinationsLoading extends SearchDestinationState {}

class SearchDestinationOptionsLoaded extends SearchDestinationState {
  PredictionsResponse destinationOptions;
  SearchDestinationOptionsLoaded({required this.destinationOptions});
}

class SearchDestinationPicked extends SearchDestinationState {
  final LatLng destination;

  SearchDestinationPicked({required this.destination});
}

class SearchDestinationFailed extends SearchDestinationState {}
