import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:velocity_x/velocity_x.dart';

class DestinationSearchBar extends StatelessWidget {
  const DestinationSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var searchController = FloatingSearchBarController();
    return FloatingSearchBar(
      controller: searchController,
      hint: 'Search destination...',
      hintStyle: TextStyle(color: AppColors.secondary(context)),
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      height: 55,
      borderRadius: BorderRadius.circular(8),
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 600),
      backgroundColor: AppColors.onPrimary(context),
      leadingActions: [
        if (searchController.isClosed) FloatingSearchBarAction.searchToClear(),
        if (searchController.isOpen)
          FloatingSearchBarAction.icon(
            icon: CupertinoIcons.back,
            onTap: () => Navigator.pop(context),
          ),
      ],
      onQueryChanged: (query) {
        //TODO: query == '' ? ctrl.predictions.clear() : ctrl.getSearchOptions(query);
      },
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(CupertinoIcons.location_north),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(showIfClosed: false),
      ],
      builder: (ctx, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: AppColors.onPrimary(context),
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
