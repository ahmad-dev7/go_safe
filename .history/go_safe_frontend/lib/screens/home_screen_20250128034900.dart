import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:go_safe/constants/k_values.dart';
import 'package:go_safe/cubit/voice_monitor_cubit.dart';
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
      //! If navigation has started show current info [AppBar]
      //! else show search location [AppBar]
      appBar: AppBar(
        toolbarHeight: kToolbarHeight * 1.2,
        title: "Current location".text.semiBold.size(15).make(),
        titleSpacing: 0,
        leading: Icon(
          CupertinoIcons.location_solid,
          color: AppColors.accent(context),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Colors.red),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                )),
            child: "SOS".text.white.make(),
          ).pOnly(right: kHorizontalPadding),
        ],
        bottom: AppBar(
          title: "Voice Monitor".text.size(15).make(),
          titleSpacing: 0,
          toolbarHeight: kToolbarHeight * 0.8,
          backgroundColor: AppColors.secondary(context).withOpacity(.1),
          leading: Icon(
            CupertinoIcons.mic_fill,
            color: AppColors.accent(context),
          ),
          actions: [
            BlocBuilder<VoiceMonitorCubit, VoiceMonitorState>(
              builder: (context, state) {
                return CupertinoSwitch(
                  value: state is VoiceMonitorEnabled,
                  onChanged: (_) {
                    context.read<VoiceMonitorCubit>().updateVoiceMonitorState(_);
                  },
                ).pOnly(right: kHorizontalPadding);
              },
            )
          ],
        ),
      ),
      body: const GoogleMap(
        myLocationEnabled: true,
        mapType: MapType.satellite,
        initialCameraPosition: CameraPosition(
          target: LatLng(40.7128, 74.0060),
          zoom: 14.4746,
        ),
      ),
    );
  }
}
