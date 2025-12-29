import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ham_qrg/common/extension/l10n_extension.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/list/controller/repeaters_list_controller.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/list/controller/state/repeaters_list_state.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/widgets/mode_filter_chips.dart';
import 'package:ham_qrg/src/features/repeaters_map/presentation/widgets/repeater_list_item.dart';
import 'package:ham_qrg/src/features/repeaters_map/provider/search_repeaters/search_repeaters_provider.dart';
import 'package:ham_qrg/src/features/repeaters_map/service/location_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class RepeatersListPage extends HookConsumerWidget {
  const RepeatersListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final searchQuery = useState<String>('');
    final debounceTimer = useRef<Timer?>(null);

    // Debounce search query - starts timer when user types
    useEffect(
      () {
        void onTextChanged() {
          final currentText = searchController.text.trim();

          // Cancel previous timer if exists
          debounceTimer.value?.cancel();

          // If text is empty, update immediately
          if (currentText.isEmpty) {
            searchQuery.value = '';
            return;
          }

          // Start debounce timer - updates query after user stops typing
          debounceTimer.value = Timer(
            const Duration(milliseconds: 500),
            () {
              searchQuery.value = currentText;
            },
          );
        }

        // Add listener to controller
        searchController.addListener(onTextChanged);

        // Cleanup: remove listener and cancel timer
        return () {
          searchController.removeListener(onTextChanged);
          debounceTimer.value?.cancel();
        };
      },
      [searchController],
    );

    final listAsyncState = ref.watch(repeatersListControllerProvider);
    final listNotifier = ref.read(repeatersListControllerProvider.notifier);

    // Determine if we're in search mode based on current text input
    final currentSearchText = searchController.text.trim();
    final isSearchMode = currentSearchText.isNotEmpty;
    final debouncedQuery = searchQuery.value.trim();
    final isTyping = isSearchMode && currentSearchText != debouncedQuery;

    // Only trigger search provider when we have a debounced query
    // If user is typing, we'll show loading state manually
    final searchAsyncState = debouncedQuery.isNotEmpty
        ? ref.watch(
            searchRepeatersProvider(
              query: debouncedQuery,
              modes: listAsyncState.value?.selectedModes.isEmpty ?? true
                  ? null
                  : listAsyncState.value!.selectedModes.toList(),
            ),
          )
        : null;

    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

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
                suffixIcon: searchController.text.isNotEmpty
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
              ),
            ),
          ),
        ),
      ),
      body: isSearchMode
          ? _buildSearchResults(
              context,
              ref,
              searchAsyncState,
              isTyping,
              listAsyncState.value?.selectedModes ?? <RepeaterMode>{},
              listNotifier,
            )
          : _buildNearbyResults(
              context,
              ref,
              listAsyncState,
              listNotifier,
            ),
    );
  }

  Widget _buildSearchResults(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<List<Repeater>>? searchAsyncState,
    bool isTyping,
    Set<RepeaterMode> selectedModes,
    RepeatersListController notifier,
  ) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Show loading if user is typing or if provider is loading
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

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: repeaters.length,
          itemBuilder: (context, index) {
            final repeater = repeaters[index];
            return RepeaterListItem(
              repeater: repeater,
            );
          },
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      error: (error, stackTrace) => Center(
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
      ),
    );
  }

  Widget _buildNearbyResults(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<RepeatersListState> listAsyncState,
    RepeatersListController notifier,
  ) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return listAsyncState.when(
      data: (state) {
        if (state.repeaters.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_off_outlined,
                  size: 64,
                  color: colorScheme.onSurface.withValues(alpha: 0.3),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.repeatersMapEmpty,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ModeFilterChips(
                selectedModes: state.selectedModes,
                onModeToggled: notifier.toggleModeFilter,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.repeaters.length,
                itemBuilder: (context, index) {
                  final repeater = state.repeaters[index];
                  return RepeaterListItem(
                    repeater: repeater,
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      error: (error, stackTrace) {
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
      },
    );
  }
}
