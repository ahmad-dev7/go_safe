class PickedDestinationModel {
  final double lat;
  final double lng;

  PickedDestinationModel({required this.lat, required this.lng});

  factory PickedDestinationModel.fromJson(Map<String, dynamic> json) {
    return PickedDestinationModel(
      lat: json['result']['geometry']['location']['lat'],
      lng: json['result']['geometry']['location']['lng'],
    );
  }
}
