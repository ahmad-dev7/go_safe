import 'package:go_safe/config/api_keys.dart';

class ApiEndpoints {
  static const String baseUrl = "http://192.168.0.103:3000";

  static const String login = "$baseUrl/login";

  static const String signup = "$baseUrl/signup";
}

class GoogleMapEndpoints {
  static const apiKey = ApiKeys.googleMaps;

  static const baseUrl = "https://maps.googleapis.com/maps/api/";

  static const placeUrl = '${baseUrl}place/autocomplete/json?';

  static const placeLatLangUrl = '${baseUrl}place/details/json?place_id=';

  static const directionUrl = "${baseUrl}directions/json?";
  static const directionUrlInfo = "mode=driving&alternative=true&key=$apiKey";
}
