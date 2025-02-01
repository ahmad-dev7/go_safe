import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/components/home_screen_components/available_routes_details.dart';
import 'package:go_safe/components/home_screen_components/destination_search_bar.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:go_safe/constants/k_values.dart';
import 'package:go_safe/cubit/location_permission_cubit.dart';
import 'package:go_safe/cubit/search_destination_cubit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController? mapController;
  Set<Marker> marker = <Marker>{};
  Set<Polyline> polyline = <Polyline>{};
  PolylinePoints polylinePoints = PolylinePoints();
  CameraTargetBounds cameraTargetBounds = CameraTargetBounds.unbounded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      // show [SOSAppBar] //!only if navigation has started
      //appBar: const SOSAppBar(),
      body: Stack(
        children: [
          MultiBlocListener(
            listeners: [
              BlocListener<LocationPermissionCubit, LocationState>(
                listener: (ctx, state) {
                  if (state is LocationGranted && mapController != null) {
                    mapController!.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(target: state.userLocation, zoom: 18.5),
                      ),
                    );
                  }
                  if (state is LocationDenied) {}
                },
              ),
              BlocListener<SearchDestinationCubit, SearchDestinationState>(
                listener: (ctx, state) {
                  if (state is SearchDestinationPicked) {
                    marker.clear();
                    polyline.clear();
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
                      for (var route in state.routesInfo.routes) {
                        var decodedPoints = polylinePoints.decodePolyline(route.polylinePoints);
                        polyline.add(
                          Polyline(
                            polylineId: PolylineId(route.via),
                            color: state.routesInfo.routes.indexOf(route) == 0
                                ? AppColors.accent(context)
                                : AppColors.warning(),
                            zIndex: state.routesInfo.routes.indexOf(route) == 0 ? 1 : 0,
                            points: decodedPoints.map((e) => LatLng(e.latitude, e.longitude)).toList(),
                          ),
                        );
                      }
                      LatLngBounds bounds = LatLngBounds(
                        northeast: state.routesInfo.routes[0].bounds.northeast,
                        southwest: state.routesInfo.routes[0].bounds.southwest,
                      );
                      cameraTargetBounds = CameraTargetBounds(bounds);

                      mapController!.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
                    });
                  }
                },
              ),
            ],
            child: BlocBuilder<LocationPermissionCubit, LocationState>(
              builder: (context, snapshot) {
                return GoogleMap(
                  initialCameraPosition: kInitialCameraPosition,
                  mapType: MapType.satellite,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: false,
                  buildingsEnabled: true,
                  compassEnabled: false,
                  polylines: polyline,
                  cameraTargetBounds: cameraTargetBounds,
                  onMapCreated: (_) => mapController = _,
                  markers: marker,
                );
              },
            ),
          ),
          // show [DestinationSearchBar] //! only if navigation is not started
          const DestinationSearchBar(),
          // show [Navigation info] //! only if navigation destination is picked & navigation is not started
          BlocBuilder<SearchDestinationCubit, SearchDestinationState>(
            builder: (context, state) {
              if (state is SearchDestinationPicked) {
                return AvailableRoutesDetails(routeData: state.routesInfo);
              } else if (state is SearchDestinationsLoading) {
                return Center(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(color: AppColors.accent(context)),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
