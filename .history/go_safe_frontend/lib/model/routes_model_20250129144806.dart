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
  final double lat;
  final double lng;

  Location({required this.lat, required this.lng});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}

class Distance {
  final String text;
  final int value;

  Distance({required this.text, required this.value});

  factory Distance.fromJson(Map<String, dynamic> json) {
    return Distance(
      text: json['text'],
      value: json['value'],
    );
  }
}

class Duration {
  final String text;
  final int value;

  Duration({required this.text, required this.value});

  factory Duration.fromJson(Map<String, dynamic> json) {
    return Duration(
      text: json['text'],
      value: json['value'],
    );
  }
}
