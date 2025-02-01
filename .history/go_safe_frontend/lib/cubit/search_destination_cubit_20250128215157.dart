import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchDestinationCubit extends Cubit<SearchDestinationState> {
  SearchDestinationCubit() : super(SearchDestinationInitial());
}

abstract class SearchDestinationState {}

class SearchDestinationInitial extends SearchDestinationState {}

class SearchDestinationOptions extends SearchDestinationState {
  List<Map<String, String>> destinationOptions;
  SearchDestinationOptions({required this.destinationOptions});
}
