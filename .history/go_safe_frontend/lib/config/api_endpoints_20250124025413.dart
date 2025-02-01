import 'dart:io';
import 'package:flutter/material.dart';

class ApiEndpoints {
  static const String baseUrl = getBaseUrl(); // base url of the API
}

//! to dynamically fetch the ipAddress of with connected network
Future<String> getBaseUrl() async {
  try {
    for (var interface in await NetworkInterface.list()) {
      for (var addr in interface.addresses) {
        if (addr.type == InternetAddressType.IPv4 && addr.address.startsWith('192.168.')) {
          return 'http://${addr.address}:3000'; // Can change port if needed
        }
      }
    }
  } catch (e) {
    debugPrint("Error fetching IP: $e");
  }
  return 'http://localhost:3000'; // Default
}
