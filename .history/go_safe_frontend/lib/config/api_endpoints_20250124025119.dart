import 'dart:io';

class ApiEndpoints {
  static const String baseUrl = "192.168.0.103:3000"; // base url of the API
}

Future<String> getBaseUrl() async {
  try {
    for (var interface in await NetworkInterface.list()) {
      for (var addr in interface.addresses) {
        if (addr.type == InternetAddressType.IPv4 && addr.address.startsWith('192.168.')) {
          return 'http://${addr.address}:3000'; // Replace port if needed
        }
      }
    }
  } catch (e) {
    print("Error fetching IP: $e");
  }
  return 'http://localhost:3000'; // Fallback
}
