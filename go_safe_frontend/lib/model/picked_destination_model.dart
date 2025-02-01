import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickedDestinationModel {
  final LatLng latLng;

  PickedDestinationModel({required this.latLng});

  factory PickedDestinationModel.fromJson(Map<String, dynamic> json) {
    var location = json['result']['geometry']['location'];
    return PickedDestinationModel(
      latLng: LatLng(location['lat'], location['lng']),
    );
  }
}
