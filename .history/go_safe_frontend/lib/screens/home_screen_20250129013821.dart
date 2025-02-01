import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/components/home_screen_components/destination_search_bar.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:go_safe/constants/k_values.dart';
import 'package:go_safe/cubit/location_permission_cubit.dart';
import 'package:go_safe/cubit/search_destination_cubit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController? mapController;
  Set<Marker> marker = <Marker>{};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      // show [SOSAppBar] //!only if navigation has started
      //appBar: const SOSAppBar(),
      body: Stack(
        children: [
          BlocListener<SearchDestinationCubit, SearchDestinationState>(
            listener: (context, state) {
              if (state is SearchDestinationPicked) {
                setState(() {
                  marker.add(
                    Marker(
                      markerId: const MarkerId("DestinationMarker"),
                      position: state.destination.latLng,
                      icon: BitmapDescriptor.defaultMarker,
                      draggable: true,
                      onDragEnd: (value) {
                        context.read<SearchDestinationCubit>().updateDestination(value);
                      },
                    ),
                  );
                  mapController!.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(target: state.destination.latLng, zoom: 18.5),
                    ),
                  );
                });
              }
            },
            child: BlocConsumer<LocationPermissionCubit, LocationState>(
              listener: (context, state) {
                if (state is LocationGranted && mapController != null) {
                  mapController!.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(target: state.userLocation, zoom: 18.5),
                    ),
                  );
                }
                if (state is LocationDenied) {}
              },
              builder: (context, snapshot) {
                return GoogleMap(
                  initialCameraPosition: kInitialCameraPosition,
                  mapType: MapType.hybrid,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: false,
                  buildingsEnabled: true,
                  compassEnabled: false,
                  onMapCreated: (_) => mapController = _,
                  markers: marker,
                );
              },
            ),
          ),
          // show [DestinationSearchBar] //! only if navigation is not started
          const DestinationSearchBar(),
          // show [Navigation info] //! only if navigation destination is picked & navigation is not started
          Align(
            alignment: Alignment.bottomCenter,
            child: VxBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Route Information".text.size(20).bold.make(),
                  HeightBox(kVerticalPadding),
                  VxBox(
                    child: ListTile(
                      dense: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                      minVerticalPadding: 0,
                      title: "Safest Route".text.bodyLarge(context).bold.make(),
                      subtitle: "Via Central Park".text.make(),
                      leading: Icon(
                        CupertinoIcons.shield_lefthalf_fill,
                        color: AppColors.accent(context),
                      ),
                      trailing: "12 min".text.bold.make(),
                    ),
                  )
                      .height(65)
                      .rounded
                      .color(AppColors.primary(context))
                      .border(color: AppColors.accent(context))
                      .makeCentered(),
                  HeightBox(kVerticalPadding),
                  VxBox(
                    child: ListTile(
                      dense: true,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                      minVerticalPadding: 0,
                      title: "Safest Route".text.bodyLarge(context).bold.make(),
                      subtitle: "Via Broadway".text.make(),
                      leading: const Icon(
                        CupertinoIcons.shield_lefthalf_fill,
                        color: Vx.yellow500,
                      ),
                      trailing: "12 min".text.bold.make(),
                    ),
                  )
                      .height(65)
                      .rounded
                      .color(AppColors.primary(context))
                      .border(color: AppColors.secondary(context).withOpacity(.2))
                      .makeCentered(),
                  HeightBox(kVerticalPadding),
                  VxBox(child: "Start Navigation".text.white.bodyLarge(context).bold.makeCentered())
                      .height(55)
                      .rounded
                      .color(AppColors.accent(context))
                      .make(),
                ],
              ).px(kHorizontalPadding).py12(),
            ).color(AppColors.primary(context)).topRounded(value: 20).make(),
          ),
        ],
      ),
    );
  }
}
