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

class PredictionsResponse {
  final List<DestinationSearchPredictionsModel> predictions;
  final String status;

  PredictionsResponse({required this.predictions, required this.status});

  factory PredictionsResponse.fromJson(Map<String, dynamic> json) {
    return PredictionsResponse(
      predictions: (json['predictions'] as List)
          .map((predictionJson) => DestinationSearchPredictionsModel.fromJson(predictionJson))
          .toList(),
      status: json['status'],
    );
  }
}
