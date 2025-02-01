import 'package:google_maps_flutter/google_maps_flutter.dart';

class ListOfRouteModels {
  final List<RouteModel> routes;

  ListOfRouteModels({required this.routes});

  factory ListOfRouteModels.fromJson(Map<String, dynamic> json) {
    return ListOfRouteModels(
      routes: (json['routes'] as List).map((routeJson) => RouteModel.fromJson(routeJson)).toList(),
    );
  }
}

class RouteModel {
  final Bounds bounds;
  final String distance;
  final String duration;
  final String polylinePoints;

  RouteModel({
    required this.bounds,
    required this.distance,
    required this.duration,
    required this.polylinePoints,
  });

  factory RouteModel.fromJson(Map<String, dynamic> json) {
    return RouteModel(
      bounds: Bounds.fromJson(json['bounds']),
      distance: json['legs'][0]['distance']['text'],
      duration: json['legs'][0]['duration']['text'],
      polylinePoints: json['overview_polyline']['points'],
    );
  }
}

class Bounds {
  final LatLng northeast;
  final LatLng southwest;

  Bounds({required this.northeast, required this.southwest});

  factory Bounds.fromJson(Map<String, dynamic> json) {
    return Bounds(
      northeast: LatLng(json['northeast']['lat'], json['northeast']['lng']),
      southwest: LatLng(json['southwest']['lat'], json['southwest']['lng']),
    );
  }
}
