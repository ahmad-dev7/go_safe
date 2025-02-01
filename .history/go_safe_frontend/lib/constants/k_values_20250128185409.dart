import 'package:google_maps_flutter/google_maps_flutter.dart';

double kHorizontalPadding = 20;

double kVerticalPadding = 15;

// Gap between two different sections
const double kSectionGap = 30;

/// Gap between two different elements of same section
const double kElementGap = 20;

const Duration kDuration = Duration(milliseconds: 300);

const double kBorderRadius = 12;

/// This points to center of india with zoom of only 4.5 to show whole Indian map,
/// Once the user current location is fetched, the camera should point to that
const kInitialCameraPosition = CameraPosition(target: LatLng(21.149850, 79.080598), zoom: 4.5);
