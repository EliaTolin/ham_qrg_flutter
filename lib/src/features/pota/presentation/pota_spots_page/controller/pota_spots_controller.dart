import 'dart:async';

import 'package:hamqrg/src/features/pota/domain/pota_spot.dart';
import 'package:hamqrg/src/features/pota/presentation/pota_spots_page/controller/state/pota_spots_state.dart';
import 'package:hamqrg/src/features/pota/provider/get_pota_spots/get_pota_spots_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pota_spots_controller.g.dart';

@Riverpod(keepAlive: true)
class PotaSpotsController extends _$PotaSpotsController {
  Timer? _refreshTimer;

  @override
  FutureOr<PotaSpotsState> build() async {
    ref.onDispose(() => _refreshTimer?.cancel());
    final spots = await ref.read(getPotaSpotsProvider.future);
    _startAutoRefresh();
    return PotaSpotsState(spots: spots, filteredSpots: spots);
  }

  void _startAutoRefresh() {
    _refreshTimer?.cancel();
    _refreshTimer = Timer.periodic(
      const Duration(seconds: 60),
      (_) => refresh(),
    );
  }

  Future<void> refresh() async {
    final currentState = state.value;
    try {
      state = AsyncData(
        (currentState ?? const PotaSpotsState())
            .copyWith(isRefreshing: true),
      );
      ref.invalidate(getPotaSpotsProvider);
      final spots = await ref.read(getPotaSpotsProvider.future);
      final filtered = _applySearch(spots, currentState?.searchQuery ?? '');
      state = AsyncData(
        PotaSpotsState(
          spots: spots,
          filteredSpots: filtered,
          searchQuery: currentState?.searchQuery ?? '',
        ),
      );
    } catch (_) {
      state = AsyncData(
        (currentState ?? const PotaSpotsState()).copyWith(
          hasLoadError: true,
          isRefreshing: false,
        ),
      );
    }
  }

  void search(String query) {
    final currentState = state.value;
    if (currentState == null) return;
    final filtered = _applySearch(currentState.spots, query);
    state = AsyncData(
      currentState.copyWith(
        searchQuery: query,
        filteredSpots: filtered,
      ),
    );
  }

  List<PotaSpot> _applySearch(List<PotaSpot> spots, String query) {
    if (query.isEmpty) return spots;
    final lower = query.toLowerCase();
    return spots
        .where(
          (s) =>
              s.activator.toLowerCase().contains(lower) ||
              s.reference.toLowerCase().contains(lower) ||
              s.name.toLowerCase().contains(lower) ||
              s.mode.toLowerCase().contains(lower),
        )
        .toList();
  }
}
