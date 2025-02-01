import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:go_safe/constants/k_values.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

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
        FloatingSearchBarAction(
          showIfClosed: true,
          showIfOpened: true,
          builder: (BuildContext context, Animation<double> animation) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300), // Animation duration
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: IconButton(
                key: const ValueKey("isOpen"),
                icon: Icon(
                  searchController.isHidden ? Icons.arrow_back : Icons.map,
                  color: Colors.black,
                  size: 24.0,
                ),
                tooltip: searchController.isHidden
                    ? MaterialLocalizations.of(context).backButtonTooltip
                    : "Map", // Tooltip for map icon
                onPressed: () {
                  if (searchController.isHidden) {
                    searchController.close(); // Close the search bar
                  } else {
                    // Map icon action
                    print("Map icon clicked!");
                  }
                },
              ),
            );
          },
        ),

        // FloatingSearchBarAction(
        //   showIfOpened: false,
        //   builder: (context, anim) {
        //     final searchBarState = FloatingSearchAppBar.of(context)!;
        //     return CircularButton(
        //       icon: AnimatedSwitcher(
        //         duration: kDuration,
        //         transitionBuilder: (child, _) => RotationTransition(
        //           turns: child.key == const ValueKey('icon1')
        //               ? Tween<double>(begin: 1, end: 0.75).animate(anim)
        //               : Tween<double>(begin: 0.75, end: 1).animate(anim),
        //           child: ScaleTransition(scale: anim, child: child),
        //         ),
        //         child: searchBarState.isOpen
        //             ? const Icon(Icons.close, key: ValueKey('icon1'))
        //             : const Icon(
        //                 Icons.arrow_back,
        //                 key: ValueKey('icon2'),
        //               ),
        //       ),
        //       onPressed: () {},
        //     );
        //   },
        // ),
      ],
      onQueryChanged: (query) {
        //TODO: query == '' ? ctrl.predictions.clear() : ctrl.getSearchOptions(query);
      },
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction.searchToClear(showIfClosed: true),
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
