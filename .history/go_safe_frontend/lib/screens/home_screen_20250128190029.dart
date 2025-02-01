import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/components/home_screen_components/destination_search_bar.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:go_safe/constants/k_values.dart';
import 'package:go_safe/cubit/location_permission_cubit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
      body: Stack(
        children: [
          BlocBuilder<LocationPermissionCubit, LocationState>(
            builder: (context, state) {
              return GoogleMap(
                initialCameraPosition: kInitialCameraPosition,
                mapType: MapType.hybrid,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                zoomControlsEnabled: false,
                buildingsEnabled: true,
                compassEnabled: false,
                onMapCreated: (controller) {
                  if (state is LocationGranted) {
                    controller.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(target: state.userLocation, zoom: 14.5),
                      ),
                    );
                  }
                },
                markers: const <Marker>{},
              );
            },
          ),
          // show [DestinationSearchBar] //! only if navigation is not started
          const DestinationSearchBar(),
        ],
      ),
    );
  }
}
