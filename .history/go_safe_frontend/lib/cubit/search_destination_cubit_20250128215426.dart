import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchDestinationCubit extends Cubit<SearchDestinationState> {
  SearchDestinationCubit() : super(SearchDestinationInitial());
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
