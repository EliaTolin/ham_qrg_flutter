import 'dart:async';

import 'package:hamqrg/log/talker_service/talker_service.dart';
import 'package:hamqrg/src/features/spots/data/mappers/spot_mapper.dart';
import 'package:hamqrg/src/features/spots/data/model/spot_model.dart';
import 'package:hamqrg/src/features/spots/data/repository/spots_repository.dart';
import 'package:hamqrg/src/features/spots/domain/spot/repeater_spot.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'my_active_spot_notifier.g.dart';

@Riverpod(keepAlive: true)
class MyActiveSpotNotifier extends _$MyActiveSpotNotifier {
  RealtimeChannel? _channel;
  final _mapper = SpotMapper();
  late Talker _talker;

  @override
  FutureOr<RepeaterSpot?> build() async {
    _talker = ref.read(talkerServiceProvider);
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId == null) return null;

    final repository = ref.read(spotsRepositoryProvider);
    final spot = await repository.getMyActiveSpot(userId);

    _subscribeRealtime(userId);

    ref.onDispose(() {
      _channel?.unsubscribe();
    });

    return spot;
  }

  void _subscribeRealtime(String userId) {
    final client = Supabase.instance.client;
    _channel = client.channel('spots:user:$userId')
      ..onPostgresChanges(
        event: PostgresChangeEvent.all,
        schema: 'public',
        table: 'repeater_spots',
        filter: PostgresChangeFilter(
          type: PostgresChangeFilterType.eq,
          column: 'user_id',
          value: userId,
        ),
        callback: _onRealtimeEvent,
      )
      ..subscribe();
  }

  Future<void> _onRealtimeEvent(PostgresChangePayload payload) async {
    // Only care about self-spots (spotted_callsign IS NULL)
    final spottedCallsign = payload.newRecord['spotted_callsign'];
    if (spottedCallsign != null) return; // other-spot, ignore

    final eventType = payload.eventType;

    if (eventType == PostgresChangeEvent.delete) {
      state = const AsyncData(null);
      return;
    }

    final closedAt = payload.newRecord['closed_at'];
    final oldClosedAt = payload.oldRecord['closed_at'];

    // UPDATE: spot was closed (manually or by substitution)
    if (eventType == PostgresChangeEvent.update &&
        oldClosedAt == null &&
        closedAt != null) {
      state = const AsyncData(null);
      return;
    }

    // INSERT: new self-spot created → re-fetch enriched
    if (eventType == PostgresChangeEvent.insert) {
      try {
        final spotId = payload.newRecord['id'] as String?;
        if (spotId == null) return;
        final client = Supabase.instance.client;
        final row = await client.from('repeater_spots').select('''
              id, user_id, repeater_id, callsign_snapshot,
              started_at, expires_at, closed_at, duration_minutes,
              repeaters!repeater_id(id, callsign, name),
              repeater_access!access_id(id, mode)
            ''').eq('id', spotId).maybeSingle();
        if (row != null) {
          final model = SpotModel.fromJson(row);
          state = AsyncData(_mapper.fromModel(model));
        }
      } catch (error, stackTrace) {
        _talker.handle(
          error,
          stackTrace,
          'Error re-fetching my active spot after INSERT',
        );
      }
    }
  }

  void clearExpired() {
    state = const AsyncData(null);
  }
}
