import 'package:hamqrg/src/features/spots/data/datasource/spots_datasource.dart';
import 'package:hamqrg/src/features/spots/data/model/spot_model.dart';
import 'package:hamqrg/src/features/spots/errors/spot_error.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SpotsSupabaseDatasource implements SpotsDatasource {
  SpotsSupabaseDatasource(this._client);
  final SupabaseClient _client;

  static const _enrichedSelect = '''
    id, user_id, callsign_snapshot, spotted_callsign,
    access_id, started_at, expires_at, closed_at, duration_minutes,
    profiles!user_id(id, callsign, first_name),
    repeaters!repeater_id(id, callsign, name),
    repeater_access!access_id(id, mode)
  ''';

  static const _enrichedSelectNoRepeater = '''
    id, user_id, repeater_id, callsign_snapshot, spotted_callsign,
    access_id, started_at, expires_at, closed_at, duration_minutes,
    profiles!user_id(id, callsign, first_name),
    repeater_access!access_id(id, mode)
  ''';

  SpotModel _parseResponse(
    FunctionResponse response, {
    int expectedStatus = 201,
  }) {
    final data = response.data as Map<String, dynamic>;
    if (response.status != expectedStatus) {
      final error = data['error'] as String? ?? 'UNKNOWN';
      throw SpotError.fromCode(error);
    }
    return SpotModel.fromJson(data['data'] as Map<String, dynamic>);
  }

  @override
  Future<SpotModel> createSelfSpot({
    required String repeaterId,
    required int durationMinutes,
    String? accessId,
  }) async {
    final response = await _client.functions.invoke(
      'create-spot',
      body: {
        'repeater_id': repeaterId,
        'duration_minutes': durationMinutes,
        if (accessId != null) 'access_id': accessId,
      },
    );
    return _parseResponse(response);
  }

  @override
  Future<SpotModel> createOtherSpot({
    required String repeaterId,
    required String spottedCallsign,
    String? accessId,
  }) async {
    final response = await _client.functions.invoke(
      'create-spot',
      body: {
        'repeater_id': repeaterId,
        'spotted_callsign': spottedCallsign,
        if (accessId != null) 'access_id': accessId,
      },
    );
    return _parseResponse(response);
  }

  @override
  Future<SpotModel> closeSpot({required String spotId}) async {
    final response = await _client.functions.invoke(
      'close-spot',
      body: {'spot_id': spotId},
    );
    final data = response.data as Map<String, dynamic>;
    if (response.status != 200) {
      final error = data['error'] as String? ?? 'UNKNOWN';
      // Treat ALREADY_CLOSED as success (FR-009)
      if (error == 'ALREADY_CLOSED') {
        return SpotModel.fromJson(data['data'] as Map<String, dynamic>);
      }
      throw SpotError.fromCode(error);
    }
    return SpotModel.fromJson(data['data'] as Map<String, dynamic>);
  }

  @override
  Future<List<SpotModel>> getActiveSpotsForRepeater(
    String repeaterId,
  ) async {
    final rows = await _client
        .from('repeater_spots')
        .select(_enrichedSelectNoRepeater)
        .eq('repeater_id', repeaterId)
        .isFilter('closed_at', null)
        .gt('expires_at', DateTime.now().toUtc().toIso8601String())
        .isFilter('spotted_callsign', null)
        .order('started_at', ascending: false);
    return (rows as List<dynamic>)
        .map((r) => SpotModel.fromJson(r as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<List<SpotModel>> getRecentSpots() async {
    final since = DateTime.now()
        .subtract(const Duration(hours: 24))
        .toUtc()
        .toIso8601String();
    final rows = await _client
        .from('repeater_spots')
        .select(_enrichedSelect)
        .gte('started_at', since)
        .order('started_at', ascending: false);
    return (rows as List<dynamic>)
        .map((r) => SpotModel.fromJson(r as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<SpotModel?> getMyActiveSpot(String userId) async {
    final row = await _client
        .from('repeater_spots')
        .select('''
          id, user_id, repeater_id, callsign_snapshot,
          started_at, expires_at, closed_at, duration_minutes,
          repeaters!repeater_id(id, callsign, name),
          repeater_access!access_id(id, mode)
        ''')
        .eq('user_id', userId)
        .isFilter('closed_at', null)
        .isFilter('spotted_callsign', null)
        .gt('expires_at', DateTime.now().toUtc().toIso8601String())
        .maybeSingle();
    if (row == null) return null;
    return SpotModel.fromJson(row);
  }

  @override
  Future<List<String>> getRepeaterIdsWithActiveSpots() async {
    final rows = await _client
        .from('repeater_spots')
        .select('repeater_id')
        .isFilter('closed_at', null)
        .isFilter('spotted_callsign', null)
        .gt('expires_at', DateTime.now().toUtc().toIso8601String());
    return (rows as List<dynamic>)
        .map((r) => (r as Map<String, dynamic>)['repeater_id'] as String)
        .toSet()
        .toList();
  }

  @override
  Future<void> setClusterNotificationsEnabled({required bool enabled}) async {
    await _client
        .from('profiles')
        .update({'cluster_notifications_enabled': enabled})
        .eq('id', _client.auth.currentUser!.id);
  }

  @override
  Future<void> setFavoriteClusterNotifications({
    required String favoriteId,
    required bool enabled,
  }) async {
    await _client
        .from('user_favorite_repeaters')
        .update({'cluster_notifications_enabled': enabled})
        .eq('id', favoriteId);
  }
}
