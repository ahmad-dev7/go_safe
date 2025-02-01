import 'package:flutter/material.dart';
import 'package:go_safe/components/home_screen_components/destination_search_bar.dart';
import 'package:go_safe/components/home_screen_components/sos_app_bar.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      // show [SOSAppBar] //!only if navigation has started
      //appBar: const SOSAppBar(),
      body: const Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            mapType: MapType.satellite,
            initialCameraPosition: CameraPosition(
              target: LatLng(40.7128, 74.0060),
              zoom: 14.4746,
            ),
          ),
          // show [DestinationSearchBar] //! only if navigation is not started
          DestinationSearchBar(),
        ],
      ),
    );
  }
}
