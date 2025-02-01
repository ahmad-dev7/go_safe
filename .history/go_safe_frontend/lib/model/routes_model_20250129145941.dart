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
  final Distance distance;
  final Duration duration;
  final String overviewPolyline;

  RouteModel({
    required this.bounds,
    required this.distance,
    required this.duration,
    required this.overviewPolyline,
  });

  factory RouteModel.fromJson(Map<String, dynamic> json) {
    return RouteModel(
      bounds: Bounds.fromJson(json['bounds']),
      distance: Distance.fromJson(json['legs'][0]['distance']),
      duration: Duration.fromJson(json['legs'][0]['duration']),
      overviewPolyline: json['overview_polyline']['points'],
    );
  }
}

class Bounds {
  final Location northeast;
  final Location southwest;

  Bounds({required this.northeast, required this.southwest});

  factory Bounds.fromJson(Map<String, dynamic> json) {
    return Bounds(
      northeast: Location.fromJson(json['northeast']),
      southwest: Location.fromJson(json['southwest']),
    );
  }
}

class Location {
  final LatLng latLng;

  Location({required this.latLng});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latLng: LatLng(json['lat'], json['lng']),
    );
  }
}

class Distance {
  final String text;

  Distance({required this.text});

  factory Distance.fromJson(Map<String, dynamic> json) {
    return Distance(
      text: json['text'],
    );
  }
}

class Duration {
  final String text;

  Duration({required this.text});

  factory Duration.fromJson(Map<String, dynamic> json) {
    return Duration(
      text: json['text'],
    );
  }
}
