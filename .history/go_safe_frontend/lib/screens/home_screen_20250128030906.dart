import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:go_safe/constants/k_values.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      appBar: AppBar(
        toolbarHeight: kToolbarHeight * 1.2,
        title: "Current location".text.semiBold.size(18).make(),
        titleSpacing: 0,
        leading: Icon(
          CupertinoIcons.location_solid,
          color: AppColors.accent(context),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: "SOS".text.make(),
          )
        ],
        bottom: AppBar(
          title: "Voice Monitor".text.size(18).make(),
          titleSpacing: 0,
          toolbarHeight: kToolbarHeight * 0.8,
          backgroundColor: AppColors.secondary(context).withOpacity(.1),
          leading: Icon(
            CupertinoIcons.mic_fill,
            color: AppColors.accent(context),
          ),
          actions: [
            CupertinoSwitch(
              value: false,
              onChanged: (_) {},
            ).pOnly(right: kHorizontalPadding / 2)
          ],
        ),
      ),
    );
  }
}
