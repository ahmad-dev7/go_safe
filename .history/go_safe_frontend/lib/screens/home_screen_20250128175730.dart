import 'package:flutter/material.dart';
import 'package:go_safe/components/home_screen_components/destination_search_bar.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:go_safe/constants/k_snack_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _requestLocationPermission();
    super.initState();
  }

  void _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      debugPrint("Requesting permission again");
      await Geolocator.requestPermission();
    } else if (permission == LocationPermission.deniedForever) {
      debugPrint("Permission denied forever");
      await Geolocator.openAppSettings();
    } else {
      debugPrint("Permission granted");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      // show [SOSAppBar] //!only if navigation has started
      //appBar: const SOSAppBar(),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(target: LatLng(21.149850, 79.080598), zoom: 4.5),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: false,
            buildingsEnabled: true,
            onMapCreated: (controller) {
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  const CameraPosition(target: LatLng(21.149850, 79.080598), zoom: 14.5),
                ),
              );
            },
            markers: const <Marker>{},
          ),
          // show [DestinationSearchBar] //! only if navigation is not started
          const DestinationSearchBar(),
        ],
      ),
    );
  }
}
