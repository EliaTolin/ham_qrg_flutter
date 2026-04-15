import 'dart:async';

import 'package:hamqrg/log/talker_service/talker_service.dart';
import 'package:hamqrg/src/features/spots/data/mappers/spot_mapper.dart';
import 'package:hamqrg/src/features/spots/data/model/spot_model.dart';
import 'package:hamqrg/src/features/spots/data/repository/spots_repository.dart';
import 'package:hamqrg/src/features/spots/domain/spot/repeater_spot.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'active_spots_notifier.g.dart';

const _pageSize = 20;

/// Provides the paginated spot history for a repeater
/// (active + expired + closed), with Realtime updates.
@riverpod
class ActiveSpotsNotifier extends _$ActiveSpotsNotifier {
  RealtimeChannel? _channel;
  final _mapper = SpotMapper();
  late String _repeaterId;
  late Talker _talker;
  bool _hasMore = true;
  bool _isLoadingMore = false;

  bool get hasMore => _hasMore;
  bool get isLoadingMore => _isLoadingMore;

  @override
  FutureOr<List<RepeaterSpot>> build(String repeaterId) async {
    _repeaterId = repeaterId;
    _talker = ref.read(talkerServiceProvider);
    _hasMore = true;
    _isLoadingMore = false;

    final repository = ref.read(spotsRepositoryProvider);
    final spots = await repository.getAllSpotsForRepeater(repeaterId);

    _hasMore = spots.length >= _pageSize;

    _subscribeRealtime(repeaterId);

    ref.onDispose(() {
      _channel?.unsubscribe();
    });

    return spots;
  }

  Future<void> loadMore() async {
    if (!_hasMore || _isLoadingMore) return;
    final current = state.value ?? [];

    _isLoadingMore = true;
    // Notify UI to show loading indicator
    state = AsyncData(current);

    try {
      final repository = ref.read(spotsRepositoryProvider);
      final moreSpots = await repository.getAllSpotsForRepeater(
        _repeaterId,
        offset: current.length,
      );

      _hasMore = moreSpots.length >= _pageSize;
      state = AsyncData([...current, ...moreSpots]);
    } catch (error, stackTrace) {
      _talker.handle(error, stackTrace, 'Error loading more spots');
    } finally {
      _isLoadingMore = false;
    }
  }

  void _subscribeRealtime(String repeaterId) {
    final client = Supabase.instance.client;
    _channel = client.channel('spots:repeater:$repeaterId')
      ..onPostgresChanges(
        event: PostgresChangeEvent.all,
        schema: 'public',
        table: 'repeater_spots',
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'repeater_id',
          value: repeaterId,
        ),
        callback: _onRealtimeEvent,
      )
      ..subscribe();
  }

  Future<void> _onRealtimeEvent(PostgresChangePayload payload) async {
    final spotId =
        (payload.newRecord['id'] ?? payload.oldRecord['id']) as String?;
    if (spotId == null) return;

    final currentSpots = state.value ?? [];

    // DELETE → remove
    if (payload.eventType == PostgresChangeEvent.delete) {
      state = AsyncData(
        currentSpots.where((s) => s.id != spotId).toList(),
      );
      return;
    }

    // INSERT or UPDATE → re-fetch enriched
    try {
      final client = Supabase.instance.client;
      final row = await client.from('repeater_spots').select('''
            id, user_id, repeater_id, callsign_snapshot, spotted_callsign,
            access_id, started_at, expires_at, closed_at, duration_minutes,
            profiles!user_id(id, callsign, first_name),
            repeater_access!access_id(id, mode)
          ''').eq('id', spotId).maybeSingle();

      final next = [...currentSpots]..removeWhere((s) => s.id == spotId);

      if (row != null) {
        final model = SpotModel.fromJson(row);
        final spot = _mapper.fromModel(model);
        // Insert at top (most recent first)
        next.insert(0, spot);
      }

      state = AsyncData(next);
    } catch (error, stackTrace) {
      _talker.handle(error, stackTrace, 'Realtime re-fetch failed for spot');
      await _refreshFromRest();
    }
  }

  Future<void> _refreshFromRest() async {
    try {
      final repository = ref.read(spotsRepositoryProvider);
      final current = state.value ?? [];
      // Refresh up to the currently loaded amount
      final count = current.length.clamp(_pageSize, 1000);
      final spots = await repository.getAllSpotsForRepeater(
        _repeaterId,
        limit: count,
      );
      _hasMore = spots.length >= count;
      state = AsyncData(spots);
    } catch (error, stackTrace) {
      _talker.handle(
        error,
        stackTrace,
        'Error refreshing spots for repeater $_repeaterId',
      );
    }
  }
}
