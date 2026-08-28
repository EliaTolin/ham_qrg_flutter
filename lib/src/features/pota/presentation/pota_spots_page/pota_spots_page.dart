import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/filter/spot_filter_chip.dart';
import 'package:hamqrg/common/widgets/label/last_update_label.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spots_page/controller/pota_spots_controller.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spots_page/controller/state/pota_spots_sort_order.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spots_page/controller/state/pota_spots_state.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spots_page/widgets/pota_spot_list_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class PotaSpotsPage extends ConsumerWidget {
  const PotaSpotsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(potaSpotsControllerProvider);
    final notifier = ref.read(potaSpotsControllerProvider.notifier);
    final l10n = context.localization;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/pota_logo.png', width: 28, height: 28),
            const SizedBox(width: 8),
            Text(l10n.potaTitle),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.map_outlined),
            onPressed: () => context.router.push(const PotaSpotsMapRoute()),
          ),
        ],
      ),
      body: asyncState.when(
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        error: (error, stackTrace) {
          log('POTA spots error: $error\n$stackTrace');
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  size: 64,
                  color: Theme.of(context)
                      .colorScheme
                      .error
                      .withValues(alpha: 0.6),
                ),
                const SizedBox(height: 16),
                Text(l10n.potaLoadError),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => ref.invalidate(potaSpotsControllerProvider),
                  child: Text(l10n.potaRetry),
                ),
              ],
            ),
          );
        },
        data: (state) => _PotaSpotsBody(
          state: state,
          notifier: notifier,
        ),
      ),
    );
  }
}

class _PotaSpotsBody extends StatelessWidget {
  const _PotaSpotsBody({
    required this.state,
    required this.notifier,
  });

  final PotaSpotsState state;
  final PotaSpotsController notifier;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    return Column(
      children: [
        // Filter & Sort Bar
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Band filter chips
              if (state.availableBands.isNotEmpty)
                SizedBox(
                  height: 36,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SpotFilterChip(
                        label: l10n.potaFilterAll,
                        selected: state.selectedBand == null,
                        onSelected: (_) => notifier.filterByBand(null),
                      ),
                      const SizedBox(width: 6),
                      ...state.availableBands.map(
                        (band) => Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: SpotFilterChip(
                            label: band,
                            selected: state.selectedBand == band,
                            onSelected: (_) => notifier.filterByBand(
                              state.selectedBand == band ? null : band,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 8),
              // Mode filter chips
              if (state.availableModes.isNotEmpty)
                SizedBox(
                  height: 36,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SpotFilterChip(
                        label: l10n.potaFilterAll,
                        selected: state.selectedMode == null,
                        onSelected: (_) => notifier.filterByMode(null),
                      ),
                      const SizedBox(width: 6),
                      ...state.availableModes.map(
                        (mode) => Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: SpotFilterChip(
                            label: mode,
                            selected: state.selectedMode == mode,
                            onSelected: (_) => notifier.filterByMode(
                              state.selectedMode == mode ? null : mode,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 10),
              // Sort row + count
              Row(
                children: [
                  Text(
                    l10n.potaSpotsCount(state.filteredSpots.length),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: LastUpdateLabel(
                        lastUpdatedAt: state.lastUpdatedAt,
                        nextUpdateAt: state.nextRefreshAt,
                        isRefreshing: state.isRefreshing,
                        autoRefreshInterval:
                            PotaSpotsController.autoRefreshInterval,
                        onRefresh: notifier.refresh,
                      ),
                    ),
                  ),
                  _SortButton(
                    sortOrder: state.sortOrder,
                    hasDistances: state.distanceByReference.isNotEmpty,
                    onChanged: notifier.setSortOrder,
                  ),
                ],
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
        // List
        Expanded(
          child: RefreshIndicator(
            onRefresh: notifier.refresh,
            child: state.filteredSpots.isEmpty
                ? ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.4,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search_off,
                                size: 64,
                                color: colorScheme.onSurface
                                    .withValues(alpha: 0.3),
                              ),
                              const SizedBox(height: 16),
                              Text(l10n.potaNoSpots),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    itemCount: state.filteredSpots.length,
                    itemBuilder: (context, index) {
                      final spot = state.filteredSpots[index];
                      return PotaSpotListItem(
                        spot: spot,
                        distanceKm: state.distanceByReference[spot.reference],
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Filter Chip
// ---------------------------------------------------------------------------

class _SortButton extends StatelessWidget {
  const _SortButton({
    required this.sortOrder,
    required this.hasDistances,
    required this.onChanged,
  });

  final PotaSpotsSortOrder sortOrder;
  final bool hasDistances;
  final ValueChanged<PotaSpotsSortOrder> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final colorScheme = Theme.of(context).colorScheme;

    return PopupMenuButton<PotaSpotsSortOrder>(
      onSelected: onChanged,
      initialValue: sortOrder,
      // Icon-only trigger: the active criterion lives in the tooltip and in
      // the checked menu entry, so the row stays compact.
      tooltip: sortOrder == PotaSpotsSortOrder.time
          ? l10n.potaSortByTime
          : l10n.potaSortByDistance,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: PotaSpotsSortOrder.time,
          child: _SortMenuItem(
            icon: Icons.schedule,
            label: l10n.potaSortByTime,
            selected: sortOrder == PotaSpotsSortOrder.time,
          ),
        ),
        if (hasDistances)
          PopupMenuItem(
            value: PotaSpotsSortOrder.distance,
            child: _SortMenuItem(
              icon: Icons.near_me,
              label: l10n.potaSortByDistance,
              selected: sortOrder == PotaSpotsSortOrder.distance,
            ),
          ),
      ],
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(Icons.sort, size: 18, color: colorScheme.onSurfaceVariant),
      ),
    );
  }
}

class _SortMenuItem extends StatelessWidget {
  const _SortMenuItem({
    required this.icon,
    required this.label,
    required this.selected,
  });

  final IconData icon;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: selected ? colorScheme.primary : colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            color: selected ? colorScheme.primary : null,
            fontWeight: selected ? FontWeight.w600 : null,
          ),
        ),
      ],
    );
  }
}
