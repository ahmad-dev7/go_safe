import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/components/action_button.dart';
import 'package:go_safe/components/info_tile.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:go_safe/constants/k_values.dart';
import 'package:go_safe/cubit/search_destination_cubit.dart';
import 'package:go_safe/model/routes_model.dart';
import 'package:velocity_x/velocity_x.dart';

class AvailableRoutesDetails extends StatefulWidget {
  final ListOfRouteModels routeData;
  const AvailableRoutesDetails({super.key, required this.routeData});

  @override
  State<AvailableRoutesDetails> createState() => _AvailableRoutesDetailsState();
}

class _AvailableRoutesDetailsState extends State<AvailableRoutesDetails> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(kBorderRadius),
          topRight: Radius.circular(kBorderRadius),
        ),
        child: BlocBuilder<SearchDestinationCubit, SearchDestinationState>(builder: (context, state) {
          return ExpansionTile(
            dense: true,
            shape: const Border(),
            initiallyExpanded: true,
            iconColor: AppColors.accent(context),
            backgroundColor: AppColors.primary(context),
            collapsedBackgroundColor: AppColors.primary(context),
            tilePadding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            childrenPadding: EdgeInsets.fromLTRB(
              kHorizontalPadding,
              kVerticalPadding / 2,
              kHorizontalPadding,
              kHorizontalPadding,
            ),
            title: "Route Information".text.titleLarge(context).bold.make(),
            children: [
              if (state is SearchDestinationDecodingData)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const WidthBox(5),
                    state.message.text.make(),
                  ],
                ),
              if (state is SearchDestinationPicked)
                ...List.generate(
                  widget.routeData.routes.length,
                  (index) {
                    var route = widget.routeData.routes;
                    //?TODO: for now the first index is considered to be safest
                    var isSafest = index == 0;
                    return InfoTile(
                      title: isSafest ? "Safest Route" : "Alternative Route",
                      subtitle: "Via ${route[index].via}",
                      borderColor: isSafest ? AppColors.accent(context) : AppColors.border(context),
                      leading: Icon(
                        CupertinoIcons.shield_lefthalf_fill,
                        color: isSafest ? AppColors.accent(context) : AppColors.warning(),
                      ),
                      time: route[index].duration.text.bold.make(),
                      distance: route[index].distance.text.make(),
                    ).pOnly(bottom: 12);
                  },
                ),
              if (state is SearchDestinationPicked) ActionButton(label: "Start Navigation", onTap: () {}),
            ],
          );
        }),
      ),
    );
  }
}
