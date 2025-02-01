import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_safe/constants/k_app_colors.dart';
import 'package:go_safe/constants/k_values.dart';
import 'package:go_safe/cubit/search_destination_cubit.dart';
import 'package:go_safe/model/destination_search_predictions_model.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:velocity_x/velocity_x.dart';

class DestinationSearchBar extends StatefulWidget {
  const DestinationSearchBar({super.key});

  @override
  State<DestinationSearchBar> createState() => _DestinationSearchBarState();
}

class _DestinationSearchBarState extends State<DestinationSearchBar> {
  var searchController = FloatingSearchBarController();
  var predictions = <DestinationSearchPredictionsModel>[];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchDestinationCubit, SearchDestinationState>(
      builder: (context, state) {
        if (state is SearchDestinationPredictionsLoaded) {
          predictions.clear();
          predictions.addAll(state.destinationPredictions.predictions);
        }
        return FloatingSearchBar(
          controller: searchController,
          elevation: 10,
          hint: 'Search destination...',
          hintStyle: TextStyle(color: AppColors.secondary(context)),
          scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
          transitionDuration: const Duration(milliseconds: 600),
          transitionCurve: Curves.easeInOut,
          physics: const BouncingScrollPhysics(),
          axisAlignment: -1.0,
          openAxisAlignment: 0.0,
          height: 50,
          margins: EdgeInsets.fromLTRB(
            //* let
            kHorizontalPadding,
            //* Top
            (context.screenPadding.top + kVerticalPadding),
            //* Right
            kHorizontalPadding,
            //* Bottom
            0,
          ),
          borderRadius: BorderRadius.circular(kBorderRadius),
          debounceDelay: const Duration(milliseconds: 600),
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
                onTap: () => searchController.close(),
                borderRadius: BorderRadius.circular(kBorderRadius),
                child: const Icon(CupertinoIcons.back, size: 26),
              ),
            ),
          ],
          onQueryChanged: (query) {
            //* query == '' ? ctrl.predictions.clear() : ctrl.getSearchOptions(query);
            query == '' ? predictions.clear() : context.read<SearchDestinationCubit>().searchPredictions(query);
          },
          actions: [
            FloatingSearchBarAction.searchToClear(
              showIfClosed: true,
              color: AppColors.secondary(context),
            ),
          ],
          builder: (ctx, transition) {
            if (state is SearchDestinationsLoading) {
              return Material(
                color: Colors.transparent,
                elevation: 20,
                child: CircularProgressIndicator(
                  color: AppColors.accent(context),
                ).box.size(30, 30).shadow2xl.makeCentered(),
              );
            }
            return ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius / 2),
              child: Material(
                color: AppColors.primary(context),
                elevation: 4.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: predictions.map(
                    (place) {
                      return InkWell(
                        onTap: () {
                          debugPrint("Tapped");
                          //* ctrl.getLatLong(place['place_id']!);
                          context.read<SearchDestinationCubit>().getPickedDestination(place.placeId);
                          searchController.close;
                        },
                        child: Container(
                          width: double.maxFinite,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          margin: const EdgeInsets.only(bottom: 3),
                          color: AppColors.onPrimary(context),
                          child: Text(place.description),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
