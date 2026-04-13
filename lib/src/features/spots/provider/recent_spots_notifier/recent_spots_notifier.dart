import 'dart:async';

import 'package:hamqrg/log/talker_service/talker_service.dart';
import 'package:hamqrg/src/features/spots/data/mappers/spot_mapper.dart';
import 'package:hamqrg/src/features/spots/data/model/spot_model.dart';
import 'package:hamqrg/src/features/spots/data/repository/spots_repository.dart';
import 'package:hamqrg/src/features/spots/domain/spot/repeater_spot.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'recent_spots_notifier.g.dart';

@riverpod
class RecentSpotsNotifier extends _$RecentSpotsNotifier {
  RealtimeChannel? _channel;
  final _mapper = SpotMapper();
  late Talker _talker;

  @override
  FutureOr<List<RepeaterSpot>> build() async {
    _talker = ref.read(talkerServiceProvider);
    final repository = ref.read(spotsRepositoryProvider);
    final spots = await repository.getRecentSpots();

    _subscribeRealtime();

    ref.onDispose(() {
      _channel?.unsubscribe();
    });

    return spots;
  }

  void _subscribeRealtime() {
    final client = Supabase.instance.client;
    _channel = client.channel('spots:global')
      ..onPostgresChanges(
        event: PostgresChangeEvent.all,
        schema: 'public',
        table: 'repeater_spots',
        callback: _onRealtimeEvent,
      )
      ..subscribe();
  }

  Future<void> _onRealtimeEvent(PostgresChangePayload payload) async {
    final spotId =
        (payload.newRecord['id'] ?? payload.oldRecord['id']) as String?;
    if (spotId == null) return;

    final currentSpots = state.value ?? [];

    if (payload.eventType == PostgresChangeEvent.delete) {
      state = AsyncData(
        currentSpots.where((s) => s.id != spotId).toList(),
      );
      return;
    }

    try {
      final client = Supabase.instance.client;
      final row = await client.from('repeater_spots').select('''
            id, user_id, callsign_snapshot, spotted_callsign,
            access_id, started_at, expires_at, closed_at, duration_minutes,
            profiles!user_id(id, callsign, first_name),
            repeaters!repeater_id(id, callsign, name),
            repeater_access!access_id(id, mode)
          ''').eq('id', spotId).maybeSingle();

      final next = [...currentSpots]..removeWhere((s) => s.id == spotId);

      if (row != null) {
        final model = SpotModel.fromJson(row);
        final spot = _mapper.fromModel(model);
        next.insert(0, spot);
      }

      state = AsyncData(next);
    } catch (error, stackTrace) {
      _talker.handle(error, stackTrace, 'Realtime re-fetch failed for spot');
      try {
        final repository = ref.read(spotsRepositoryProvider);
        final spots = await repository.getRecentSpots();
        state = AsyncData(spots);
      } catch (refreshError, refreshStack) {
        _talker.handle(
          refreshError,
          refreshStack,
          'Error refreshing recent spots',
        );
      }
    }
  }
}
