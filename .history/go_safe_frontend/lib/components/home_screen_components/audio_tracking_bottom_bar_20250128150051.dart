import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:go_safe/constants/k_values.dart';
import 'package:go_safe/cubit/voice_monitor_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

class AudioTrackingBottomBar extends StatelessWidget implements PreferredSizeWidget {
  const AudioTrackingBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 0.8);
}
