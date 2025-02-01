import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/components/home_screen_components/audio_tracking_bottom_bar.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:go_safe/constants/k_values.dart';
import 'package:velocity_x/velocity_x.dart';

class SOSAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SOSAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        bottom: const AudioTrackingBottomBar());
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
