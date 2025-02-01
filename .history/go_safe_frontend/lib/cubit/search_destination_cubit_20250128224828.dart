import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/config/api_endpoints.dart';
import 'package:go_safe/config/api_keys.dart';
import 'package:go_safe/model/destination_search_predictions_model.dart';
import 'package:go_safe/model/picked_destination_model.dart';
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
      print("added print for prediction 0: ${predictions.predictions[0]}");
    } else {
      emit(SearchDestinationFailed());
    }
  }

  Future<void> getPickedDestination(String placeId) async {
    var url = "${GoogleMapEndpoints.placeLatLangUrl}$placeId&key=${ApiKeys.googleMaps}";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var destination = PickedDestinationModel.fromJson(jsonDecode(response.body));
      emit(SearchDestinationPicked(destination: destination));
      print("added print for picked destination: ${destination.latLng}");
    }
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

  SearchDestinationPicked({required this.destination});
}

class SearchDestinationFailed extends SearchDestinationState {}
