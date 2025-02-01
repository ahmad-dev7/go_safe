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
  static const directionUrlInfo = "mode=driving&alternatives=true&key=$apiKey";
  static const eg = "${directionUrl}origin=19.73,73.82&destination=19.45,73.89&$directionUrl";
  // "https://maps.googleapis.com/maps/api/directions/json?origin=19.0222,73.0390&destination=19.0296,73.0166&mode=driving&alternatives=true&key=AIzaSyAekpJrCOt0Mj522zEiLWX80fzNnHlekFc";
}
