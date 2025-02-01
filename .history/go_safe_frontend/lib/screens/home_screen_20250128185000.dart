import 'package:flutter/material.dart';
import 'package:go_safe/components/home_screen_components/destination_search_bar.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            mapType: MapType.hybrid,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: false,
            buildingsEnabled: true,
            compassEnabled: false,
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
