class DestinationSearchPredictionsModel {
  final String description;
  final String placeId;

  DestinationSearchPredictionsModel({required this.description, required this.placeId});

  factory DestinationSearchPredictionsModel.fromJson(Map<String, dynamic> json) {
    return DestinationSearchPredictionsModel(
      description: json['description'],
      placeId: json['place_id'],
    );
  }
}
