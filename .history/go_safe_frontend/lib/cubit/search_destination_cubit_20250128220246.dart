import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/config/api_endpoints.dart';
import 'package:go_safe/config/api_keys.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class SearchDestinationCubit extends Cubit<SearchDestinationState> {
  SearchDestinationCubit() : super(SearchDestinationInitial());

  Future<void> searchOptions(String query) async {
    var url = "${GoogleMapEndpoints.placeUrl}input=$query&key=${ApiKeys.googleMaps}";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Map<String, String>> options = [];
      for (var place in data["predictions"]) {
        options.add({
          "description": place["description"],
          "place_id": place["place_id"],
        });
      }
      emit(SearchDestinationOptions(destinationOptions: options));
    }
  }
}

abstract class SearchDestinationState {}

class SearchDestinationInitial extends SearchDestinationState {}

class SearchDestinationOptions extends SearchDestinationState {
  List<Map<String, String>> destinationOptions;
  SearchDestinationOptions({required this.destinationOptions});
}

class PickedDestination extends SearchDestinationState {
  final LatLng destination;

  PickedDestination({required this.destination});
}
