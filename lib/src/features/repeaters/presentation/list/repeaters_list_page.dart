import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/mode_filter_chips_horizontal.dart';
import 'package:hamqrg/common/widgets/responsive/responsive_layout.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback_stats.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/presentation/list/controller/repeaters_list_controller.dart';
import 'package:hamqrg/src/features/repeaters/presentation/list/controller/state/repeaters_list_state.dart';
import 'package:hamqrg/src/features/repeaters/presentation/list/controller/state/repeaters_sort_order.dart';
import 'package:hamqrg/src/features/repeaters/presentation/list/repeaters_list_tablet.dart';
import 'package:hamqrg/src/features/repeaters/presentation/widgets/repeater_card.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeaters_feedback_stats_from_ids/get_repeaters_feedback_stats_from_ids_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/search_repeaters/search_repeaters_provider.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const int _searchDebounceMs = 500;

@RoutePage()
class RepeatersListPage extends HookConsumerWidget {
  const RepeatersListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final searchQuery = useState<String>('');
    final debounceTimer = useRef<Timer?>(null);

    final selectedModes = useState<Set<AccessMode>>(const {});
    final stableAccessModes = useRef<List<AccessMode>?>(null);

    final listAsyncState = ref.watch(repeatersListControllerProvider);
    final listNotifier = ref.read(repeatersListControllerProvider.notifier);

    // Search debounce
    useEffect(
      () {
        void onTextChanged() {
          final currentText = searchController.text.trim();
          debounceTimer.value?.cancel();

          if (currentText.isEmpty) {
            searchQuery.value = '';
            return;
          }

          debounceTimer.value = Timer(
            const Duration(milliseconds: _searchDebounceMs),
            () => searchQuery.value = currentText,
          );
        }

        searchController.addListener(onTextChanged);
        return () {
          searchController.removeListener(onTextChanged);
          debounceTimer.value?.cancel();
        };
      },
      [searchController],
    );

    // Stable access modes
    final currentModes = selectedModes.value;
    if (currentModes.isEmpty) {
      stableAccessModes.value = null;
    } else if (stableAccessModes.value == null ||
        !setEquals(stableAccessModes.value!.toSet(), currentModes)) {
      stableAccessModes.value = currentModes.toList();
    }

    final currentSearchText = searchController.text.trim();
    final isSearchMode = currentSearchText.isNotEmpty;
    final debouncedQuery = searchQuery.value.trim();
    final isTyping = isSearchMode && currentSearchText != debouncedQuery;

    final userPosition = switch (ref.watch(cachedUserPositionProvider)) {
      AsyncData(:final value) => value,
      _ => null,
    };

    final searchAsyncState = debouncedQuery.isNotEmpty
        ? ref.watch(
            searchRepeatersProvider(
              query: debouncedQuery,
              accessModes: stableAccessModes.value,
              latitude: userPosition?.latitude,
              longitude: userPosition?.longitude,
            ),
          )
        : null;

    final searchRepeaters = switch (searchAsyncState) {
      AsyncData(:final value) => value,
      _ => null,
    };
    final searchResultIds = useMemoized(
      () => searchRepeaters?.map((r) => r.id).toList(),
      [searchRepeaters],
    );

    final searchFeedbackStatsAsync =
        searchResultIds != null && searchResultIds.isNotEmpty
            ? ref.watch(
                getRepeatersFeedbackStatsFromIdsProvider(searchResultIds),
              )
            : null;
    final searchFeedbackStats = switch (searchFeedbackStatsAsync) {
      AsyncData(:final value) => value,
      _ => const <String, RepeaterFeedbackStats>{},
    };

    // Loading state
    if (listAsyncState.isLoading && !isSearchMode) {
      return Scaffold(
        appBar: AppBar(
          title: Text(context.localization.repeatersListTitle),
        ),
        body: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }

    // Error state
    if (listAsyncState.hasError &&
        !isSearchMode &&
        listAsyncState.error != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(context.localization.repeatersListTitle),
        ),
        body: _buildErrorState(context, listAsyncState.error!),
      );
    }

    final listState = listAsyncState.value;
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.repeatersListTitle),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: l10n.repeatersSearchHint,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: currentSearchText.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          searchQuery.value = '';
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: colorScheme.surface,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Filter chips
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ModeFilterChipsHorizontal(
              allLabel: l10n.repeaterModeAllmode,
              selectedModes: selectedModes.value,
              onModeToggled: (mode) {
                final newModes = Set<AccessMode>.from(selectedModes.value);
                if (newModes.contains(mode)) {
                  newModes.remove(mode);
                } else {
                  newModes.add(mode);
                }
                selectedModes.value = newModes;
                if (!isSearchMode) {
                  listNotifier.loadWithModes(newModes);
                }
              },
              onAllSelected: () {
                if (selectedModes.value.isEmpty) return;
                selectedModes.value = const {};
                if (!isSearchMode) {
                  listNotifier.loadWithModes(const {});
                }
              },
            ),
          ),
          // Count + Sort row
          if (listState != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: _CountAndSortRow(
                count: isSearchMode
                    ? (searchRepeaters?.length ?? 0)
                    : listState.repeaters.length,
                isSearchMode: isSearchMode,
                sortOrder: listState.sortOrder,
                onSortChanged: listNotifier.setSortOrder,
              ),
            ),
          // Content
          Expanded(
            child: isSearchMode
                ? _buildSearchResults(
                    context,
                    searchAsyncState,
                    isTyping,
                    sortOrder:
                        listState?.sortOrder ?? RepeatersSortOrder.distance,
                    feedbackStats: searchFeedbackStats,
                    onRefresh: () async {
                      ref.invalidate(cachedUserPositionProvider);
                      await ref.read(cachedUserPositionProvider.future);
                    },
                  )
                : _buildNearbyContent(context, ref, listState),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(
    BuildContext context,
    AsyncValue<List<Repeater>>? searchAsyncState,
    bool isTyping, {
    required RepeatersSortOrder sortOrder,
    required Map<String, RepeaterFeedbackStats> feedbackStats,
    required RefreshCallback onRefresh,
  }) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (isTyping || searchAsyncState == null || searchAsyncState.isLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    return searchAsyncState.when(
      data: (repeaters) {
        if (repeaters.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search_off,
                  size: 64,
                  color: colorScheme.onSurface.withValues(alpha: 0.3),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.repeatersSearchEmpty,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          );
        }

        final sorted = List<Repeater>.of(repeaters);
        switch (sortOrder) {
          case RepeatersSortOrder.distance:
            sorted.sort((a, b) {
              final da = a.distanceMeters ?? double.infinity;
              final db = b.distanceMeters ?? double.infinity;
              return da.compareTo(db);
            });
          case RepeatersSortOrder.likes:
            sorted.sort((a, b) {
              final la = feedbackStats[a.id]?.likesTotal ?? 0;
              final lb = feedbackStats[b.id]?.likesTotal ?? 0;
              return lb.compareTo(la);
            });
          case RepeatersSortOrder.frequency:
            sorted.sort((a, b) => a.frequencyHz.compareTo(b.frequencyHz));
        }

        return RefreshIndicator(
          onRefresh: onRefresh,
          child: ResponsiveLayout(
            mobile: (_) => ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: sorted.length,
              itemBuilder: (context, index) {
                final repeater = sorted[index];
                return RepeaterCard(
                  repeater: repeater,
                  feedbackStats: feedbackStats[repeater.id],
                );
              },
            ),
            tablet: (_) => RepeatersListTablet(
              repeaters: sorted,
              feedbackStats: feedbackStats,
            ),
          ),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      error: (error, stackTrace) => _buildErrorState(context, error),
    );
  }

  Widget _buildNearbyContent(
    BuildContext context,
    WidgetRef ref,
    RepeatersListState? listState,
  ) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (listState == null) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    if (listState.locationError != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_off,
                size: 64,
                color: colorScheme.error.withValues(alpha: 0.6),
              ),
              const SizedBox(height: 16),
              Text(
                switch (listState.locationError!) {
                  LocationErrorType.permissionDenied ||
                  LocationErrorType.permissionPermanentlyDenied =>
                    l10n.repeatersMapPermissionPermanentlyDenied,
                  LocationErrorType.servicesDisabled =>
                    l10n.repeatersMapLocationServicesDisabled,
                },
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  ref.read(repeatersListControllerProvider.notifier).reload();
                },
                child: Text(l10n.repeatersMapRetry),
              ),
            ],
          ),
        ),
      );
    }

    if (listState.repeaters.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.cell_tower,
              size: 64,
              color: colorScheme.onSurface.withValues(alpha: 0.2),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.repeatersSearchEmpty,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () =>
          ref.read(repeatersListControllerProvider.notifier).refreshAndReload(),
      child: ResponsiveLayout(
        mobile: (_) => ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: listState.repeaters.length,
          itemBuilder: (context, index) {
            final repeater = listState.repeaters[index];
            return RepeaterCard(
              repeater: repeater,
              feedbackStats: listState.feedbackStats[repeater.id],
            );
          },
        ),
        tablet: (_) => RepeatersListTablet(
          repeaters: listState.repeaters,
          feedbackStats: listState.feedbackStats,
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, Object error) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (error is LocationException) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_off,
                size: 64,
                color: colorScheme.error.withValues(alpha: 0.6),
              ),
              const SizedBox(height: 16),
              Text(
                switch (error.type) {
                  LocationErrorType.permissionDenied ||
                  LocationErrorType.permissionPermanentlyDenied =>
                    l10n.repeatersMapPermissionPermanentlyDenied,
                  LocationErrorType.servicesDisabled =>
                    l10n.repeatersMapLocationServicesDisabled,
                },
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      );
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning_amber_rounded,
              size: 64,
              color: colorScheme.error.withValues(alpha: 0.6),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.repeatersMapGenericError,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Count + Sort Row
// ---------------------------------------------------------------------------

class _CountAndSortRow extends StatelessWidget {
  const _CountAndSortRow({
    required this.count,
    required this.isSearchMode,
    required this.sortOrder,
    required this.onSortChanged,
  });

  final int count;
  final bool isSearchMode;
  final RepeatersSortOrder sortOrder;
  final ValueChanged<RepeatersSortOrder> onSortChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    return Row(
      children: [
        Text(
          isSearchMode
              ? l10n.repeatersResultsCount(count)
              : l10n.repeatersNearbyCount(count),
          style: theme.textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const Spacer(),
        _SortButton(
          sortOrder: sortOrder,
          onChanged: onSortChanged,
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Sort Button (PopupMenu)
// ---------------------------------------------------------------------------

class _SortButton extends StatelessWidget {
  const _SortButton({
    required this.sortOrder,
    required this.onChanged,
  });

  final RepeatersSortOrder sortOrder;
  final ValueChanged<RepeatersSortOrder> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = context.localization;

    final label = switch (sortOrder) {
      RepeatersSortOrder.distance => l10n.repeatersSortDistance,
      RepeatersSortOrder.likes => l10n.repeatersSortLikes,
      RepeatersSortOrder.frequency => l10n.repeatersSortFrequency,
    };

    return PopupMenuButton<RepeatersSortOrder>(
      onSelected: onChanged,
      initialValue: sortOrder,
      itemBuilder: (context) => [
        PopupMenuItem(
          value: RepeatersSortOrder.distance,
          child: _SortMenuItem(
            icon: Icons.near_me_outlined,
            label: l10n.repeatersSortDistance,
            selected: sortOrder == RepeatersSortOrder.distance,
          ),
        ),
        PopupMenuItem(
          value: RepeatersSortOrder.likes,
          child: _SortMenuItem(
            icon: Icons.thumb_up_rounded,
            label: l10n.repeatersSortLikes,
            selected: sortOrder == RepeatersSortOrder.likes,
          ),
        ),
        PopupMenuItem(
          value: RepeatersSortOrder.frequency,
          child: _SortMenuItem(
            icon: Icons.radio_outlined,
            label: l10n.repeatersSortFrequency,
            selected: sortOrder == RepeatersSortOrder.frequency,
          ),
        ),
      ],
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.sort, size: 16, color: colorScheme.onSurfaceVariant),
            const SizedBox(width: 4),
            Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
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
