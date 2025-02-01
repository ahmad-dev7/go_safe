import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:go_safe/constants/k_values.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class DestinationSearchBar extends StatefulWidget {
  const DestinationSearchBar({super.key});

  @override
  State<DestinationSearchBar> createState() => _DestinationSearchBarState();
}

class _DestinationSearchBarState extends State<DestinationSearchBar> {
  var searchController = FloatingSearchBarController();
  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      controller: searchController,
      hint: 'Search destination...',
      hintStyle: TextStyle(color: AppColors.secondary(context)),
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 600),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: -1.0,
      openAxisAlignment: 0.0,
      height: 50,
      margins: const EdgeInsets.symmetric(horizontal: 20),
      borderRadius: BorderRadius.circular(kBorderRadius),
      debounceDelay: const Duration(milliseconds: 400),
      backgroundColor: AppColors.primary(context),
      transition: CircularFloatingSearchBarTransition(),
      leadingActions: [
        const FloatingSearchBarAction(
          showIfClosed: true,
          showIfOpened: false,
          child: Icon(CupertinoIcons.location_north),
        ),
        FloatingSearchBarAction(
          showIfClosed: false,
          showIfOpened: true,
          child: InkWell(
            onTap: () {},
            child: const Icon(CupertinoIcons.back, size: 26),
          ),
        ),
      ],
      onQueryChanged: (query) {
        //TODO: query == '' ? ctrl.predictions.clear() : ctrl.getSearchOptions(query);
      },
      actions: [
        FloatingSearchBarAction.searchToClear(showIfClosed: true),
      ],
      builder: (ctx, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: AppColors.primary(context),
            elevation: 4.0,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              /*TODO:   children: ctrl.predictions.map((place) {
                return InkWell(
                  onTap: () {
                    debugPrint("Tapped");
                    //TODO: ctrl.getLatLong(place['place_id']!);
                    searchController.close();
                  },
                  child: Container(
                    width: double.maxFinite,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                    margin: const EdgeInsets.only(bottom: 2),
                    color: AppColors.background(context),
                    child: Text(place['description']!),
                  ),
                );
              }).toList(), */
            ),
          ),
        );
      },
    );
  }
}
