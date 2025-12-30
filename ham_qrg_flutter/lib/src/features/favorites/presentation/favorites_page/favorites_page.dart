import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ham_qrg/common/extension/l10n_extension.dart';
import 'package:ham_qrg/src/features/favorites/presentation/favorites_page/controller/favorites_controller.dart';
import 'package:ham_qrg/src/features/favorites/presentation/favorites_page/controller/state/favorites_state.dart';
import 'package:ham_qrg/src/features/favorites/presentation/widgets/favorite_repeater_item.dart';
import 'package:ham_qrg/src/features/favorites/presentation/widgets/mode_filter_chips_horizontal.dart';
import 'package:ham_qrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Debounce delay for search (milliseconds)
const int _searchDebounceMs = 300;

@RoutePage()
class FavoritesPage extends HookConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final searchQuery = useState<String>('');
    final debounceTimer = useRef<Timer?>(null);

    final controllerAsync = ref.watch(favoritesControllerProvider);
    final controllerNotifier = ref.read(favoritesControllerProvider.notifier);

    // Handle search debounce
    useEffect(
      () {
        void onTextChanged() {
          final currentText = searchController.text.trim();
          debounceTimer.value?.cancel();

          if (currentText.isEmpty) {
            searchQuery.value = '';
            controllerNotifier.updateSearchQuery('');
            return;
          }

          debounceTimer.value = Timer(
            const Duration(milliseconds: _searchDebounceMs),
            () {
              searchQuery.value = currentText;
              controllerNotifier.updateSearchQuery(currentText);
            },
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

    return Scaffold(
      appBar: AppBar(
        title: Text(context.localization.favoritesTitle),
      ),
      body: controllerAsync.when(
        data: (state) => _buildContent(
          context,
          ref,
          state,
          controllerNotifier,
          searchController,
        ),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                context.localization.error_message,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: controllerNotifier.reload,
                child: Text(context.localization.retry),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    FavoritesState state,
    FavoritesController notifier,
    TextEditingController searchController,
  ) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Filter favorites based on search and mode filters
    final filteredFavorites = _filterFavorites(
      state.favorites,
      state.searchQuery,
      state.selectedModes,
    );

    return Column(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Search bar
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: l10n.favoritesSearchHint,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            searchController.clear();
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: colorScheme.surfaceContainerHighest,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Mode filters
              ModeFilterChipsHorizontal(
                selectedModes: state.selectedModes,
                onModeToggled: notifier.toggleModeFilter,
                onAllSelected: () {
                  notifier.toggleModeFilter(RepeaterMode.analog);
                  // Clear all selections
                  for (final mode in RepeaterMode.values) {
                    if (state.selectedModes.contains(mode)) {
                      notifier.toggleModeFilter(mode);
                    }
                  }
                },
              ),
            ],
          ),
        ),
        // Content
        Expanded(
          child: filteredFavorites.isEmpty
              ? _buildEmptyState(context)
              : ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: filteredFavorites.length + 1,
                  itemBuilder: (context, index) {
                    if (index == filteredFavorites.length) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Center(
                          child: Text(
                            l10n.favoritesShowing(
                              filteredFavorites.length,
                              state.favorites.length,
                            ),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      );
                    }
                    return FavoriteRepeaterItem(
                      repeater: filteredFavorites[index],
                      onRemoveFavorite: () {
                        notifier.removeFavorite(filteredFavorites[index].id);
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 64,
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.favoritesEmpty,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              l10n.favoritesEmptyDescription,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  List<Repeater> _filterFavorites(
    List<Repeater> favorites,
    String searchQuery,
    Set<RepeaterMode> selectedModes,
  ) {
    var filtered = favorites;

    // Apply search filter
    if (searchQuery.isNotEmpty) {
      final query = searchQuery.toLowerCase();
      filtered = filtered.where((repeater) {
        final callsign = repeater.callsign?.toLowerCase() ?? '';
        final name = repeater.name?.toLowerCase() ?? '';
        final locality = repeater.locality?.toLowerCase() ?? '';
        final region = repeater.region?.toLowerCase() ?? '';
        return callsign.contains(query) ||
            name.contains(query) ||
            locality.contains(query) ||
            region.contains(query);
      }).toList();
    }

    // Apply mode filter
    if (selectedModes.isNotEmpty) {
      filtered = filtered.where((repeater) => selectedModes.contains(repeater.mode)).toList();
    }

    return filtered;
  }
}
