import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/mode_filter_chips_horizontal.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/feedback/repeater_feedback_stats.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hamqrg/src/features/repeaters/presentation/list/controller/repeaters_list_controller.dart';
import 'package:hamqrg/src/features/repeaters/presentation/list/controller/state/repeaters_list_state.dart';
import 'package:hamqrg/src/features/repeaters/presentation/list/controller/state/repeaters_sort_order.dart';
import 'package:hamqrg/src/features/repeaters/presentation/widgets/repeater_card.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeaters_feedback_stats_from_ids/get_repeaters_feedback_stats_from_ids_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/search_repeaters/search_repeaters_provider.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Debounce delay for search (milliseconds)
const int _searchDebounceMs = 500;

@RoutePage()
class RepeatersListPage extends HookConsumerWidget {
  const RepeatersListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final searchQuery = useState<String>('');
    final debounceTimer = useRef<Timer?>(null);

    // Local selected modes (source of truth for filter chips + search)
    final selectedModes = useState<Set<AccessMode>>(const {});

    // Stable list reference for the search provider (avoids new List identity each build)
    final stableAccessModes = useRef<List<AccessMode>?>(null);

    final listAsyncState = ref.watch(repeatersListControllerProvider);
    final listNotifier = ref.read(repeatersListControllerProvider.notifier);

    // Handle search debounce
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

    // Keep stable access modes list in sync with selectedModes
    final currentModes = selectedModes.value;
    if (currentModes.isEmpty) {
      stableAccessModes.value = null;
    } else if (stableAccessModes.value == null ||
        !setEquals(stableAccessModes.value!.toSet(), currentModes)) {
      stableAccessModes.value = currentModes.toList();
    }

    // Determine search mode
    final currentSearchText = searchController.text.trim();
    final isSearchMode = currentSearchText.isNotEmpty;
    final debouncedQuery = searchQuery.value.trim();
    final isTyping = isSearchMode && currentSearchText != debouncedQuery;

    // User position from shared cached provider (no duplicate GPS request)
    final userPosition = switch (ref.watch(cachedUserPositionProvider)) {
      AsyncData(:final value) => value,
      _ => null,
    };

    // Get search results if in search mode (pass user position for server-side distance)
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

    // Memoize search result IDs for stable provider key (List == is reference-based)
    final searchRepeaters = switch (searchAsyncState) {
      AsyncData(:final value) => value,
      _ => null,
    };
    final searchResultIds = useMemoized(
      () => searchRepeaters?.map((r) => r.id).toList(),
      [searchRepeaters],
    );

    // Fetch feedback stats for search results
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

    // Handle loading state (only when not searching)
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

    // Handle error state (only when not searching)
    if (listAsyncState.hasError && !isSearchMode && listAsyncState.error != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(context.localization.repeatersListTitle),
        ),
        body: _buildErrorState(context, listAsyncState.error!),
      );
    }

    final listState = listAsyncState.value;
    final l10n = context.localization;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.repeatersListTitle),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8),
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
                fillColor: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Filter chips – always visible
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
          // Sort order
          if (listState != null) ...[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 16, bottom: 4),
              child: _SortOrderRow(
                current: listState.sortOrder,
                onChanged: listNotifier.setSortOrder,
              ),
            ),
          ],
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

  /// Build search results view
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

    // Show loading while typing or loading
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

        // Sort (distance comes from server, likes from feedback stats)
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
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: sorted.length,
            itemBuilder: (context, index) {
              final repeater = sorted[index];
              return RepeaterCard(
                repeater: repeater,
                feedbackStats: feedbackStats[repeater.id],
              );
            },
          ),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      error: (error, stackTrace) => _buildErrorState(context, error),
    );
  }

  /// Build nearby content (without filter chips – they are in the parent Column)
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

    // Show location error
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
                  LocationErrorType.servicesDisabled => l10n.repeatersMapLocationServicesDisabled,
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

    // Empty state
    if (listState.repeaters.isEmpty) {
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

    return RefreshIndicator(
      onRefresh: () => ref
          .read(repeatersListControllerProvider.notifier)
          .refreshAndReload(),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: listState.repeaters.length,
        itemBuilder: (context, index) {
          final repeater = listState.repeaters[index];
          return RepeaterCard(
            repeater: repeater,
            feedbackStats: listState.feedbackStats[repeater.id],
          );
        },
      ),
    );
  }

  /// Build error state widget
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
                  LocationErrorType.servicesDisabled => l10n.repeatersMapLocationServicesDisabled,
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
// Sort order chip row — mirrors the filter chip style
// ---------------------------------------------------------------------------
class _SortOrderRow extends StatelessWidget {
  const _SortOrderRow({required this.current, required this.onChanged});

  final RepeatersSortOrder current;
  final ValueChanged<RepeatersSortOrder> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    // final theme = Theme.of(context);
    //final colorScheme = theme.colorScheme;

    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Icon(Icons.sort, size: 16, color: colorScheme.onSurfaceVariant),
        _SortChip(
          label: l10n.repeatersSortDistance,
          icon: Icons.near_me_outlined,
          isSelected: current == RepeatersSortOrder.distance,
          onTap: () => onChanged(RepeatersSortOrder.distance),
        ),
        _SortChip(
          label: l10n.repeatersSortLikes,
          icon: Icons.thumb_up_rounded,
          isSelected: current == RepeatersSortOrder.likes,
          onTap: () => onChanged(RepeatersSortOrder.likes),
        ),
        _SortChip(
          label: l10n.repeatersSortFrequency,
          icon: Icons.radio_outlined,
          isSelected: current == RepeatersSortOrder.frequency,
          onTap: () => onChanged(RepeatersSortOrder.frequency),
        ),
      ],
    );
  }
}

class _SortChip extends StatelessWidget {
  const _SortChip({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final backgroundColor = isSelected ? colorScheme.primary : colorScheme.surfaceContainerHighest;
    final foregroundColor = isSelected ? colorScheme.onPrimary : colorScheme.onSurface;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.transparent : colorScheme.outline,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: foregroundColor),
            const SizedBox(width: 4),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: foregroundColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
