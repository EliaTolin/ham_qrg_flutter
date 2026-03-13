import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spots_page/controller/pota_spots_controller.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spots_page/widgets/pota_spot_list_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const int _searchDebounceMs = 500;

@RoutePage()
class PotaSpotsPage extends HookConsumerWidget {
  const PotaSpotsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final debounceTimer = useRef<Timer?>(null);

    final asyncState = ref.watch(potaSpotsControllerProvider);
    final notifier = ref.read(potaSpotsControllerProvider.notifier);
    final l10n = context.localization;

    useEffect(
      () {
        void onTextChanged() {
          final currentText = searchController.text.trim();
          debounceTimer.value?.cancel();

          if (currentText.isEmpty) {
            notifier.search('');
            return;
          }

          debounceTimer.value = Timer(
            const Duration(milliseconds: _searchDebounceMs),
            () => notifier.search(currentText),
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
        title: Text(l10n.potaTitle),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: l10n.potaSearchHint,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          notifier.search('');
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
      body: asyncState.when(
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        error: (error, _) => Center(
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
        ),
        data: (state) {
          if (state.filteredSpots.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off,
                    size: 64,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.3),
                  ),
                  const SizedBox(height: 16),
                  Text(l10n.potaNoSpots),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: notifier.refresh,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.filteredSpots.length,
              itemBuilder: (context, index) {
                return PotaSpotListItem(spot: state.filteredSpots[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
