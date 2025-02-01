import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  static const String baseUrl = "http://192.168.0.103:3000";

  static const String login = "$baseUrl/login";

  static const String signup = "$baseUrl/signup";
}

class GoogleMapEndpoints {
  static var apiKey = dotenv.env['GOOGLE_MAP_API_KEY'];

  static const baseUrl = "https://maps.googleapis.com/maps/api/";

  static const placeUrl = '${baseUrl}place/autocomplete/json?';

  static const placeLatLangUrl = '${baseUrl}place/details/json?place_id=';

  /// DirectionUrlExample = "${directionUrl}origin=19.73,73.82&destination=19.45,73.89&$directionUrl";
  static const directionUrl = "${baseUrl}directions/json?";

  /// DirectionUrlExample = "${directionUrl}origin=19.73,73.82&destination=19.45,73.89&$directionUrl";
  static String directionUrlInfo = "mode=driving&alternatives=true&key=$apiKey";
}
