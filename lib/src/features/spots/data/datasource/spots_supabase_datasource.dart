import 'package:hamqrg/src/features/spots/data/datasource/spots_datasource.dart';
import 'package:hamqrg/src/features/spots/data/model/spot_model.dart';
import 'package:hamqrg/src/features/spots/errors/spot_error.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

class SpotsSupabaseDatasource implements SpotsDatasource {
  SpotsSupabaseDatasource(this._client, this._talker);
  final SupabaseClient _client;
  final Talker _talker;

  static const _enrichedSelect = '''
    id, user_id, repeater_id, callsign_snapshot, spotted_callsign,
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
    required String accessId,
  }) async {
    try {
      final response = await _client.functions.invoke(
        'create-spot',
        body: {
          'repeater_id': repeaterId,
          'duration_minutes': durationMinutes,
          'access_id': accessId,
        },
      );
      return _parseResponse(response);
    } catch (error, stackTrace) {
      _talker.handle(error, stackTrace, 'Error creating self-spot');
      rethrow;
    }
  }

  @override
  Future<SpotModel> createOtherSpot({
    required String repeaterId,
    required String spottedCallsign,
    String? accessId,
  }) async {
    try {
      final response = await _client.functions.invoke(
        'create-spot',
        body: {
          'repeater_id': repeaterId,
          'spotted_callsign': spottedCallsign,
          if (accessId != null) 'access_id': accessId,
        },
      );
      return _parseResponse(response);
    } catch (error, stackTrace) {
      _talker.handle(error, stackTrace, 'Error creating other-spot');
      rethrow;
    }
  }

  @override
  Future<SpotModel> closeSpot({required String spotId}) async {
    try {
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
    } catch (error, stackTrace) {
      _talker.handle(error, stackTrace, 'Error closing spot $spotId');
      rethrow;
    }
  }

  @override
  Future<List<SpotModel>> getActiveSpotsForRepeater(
    String repeaterId,
  ) async {
    try {
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
    } catch (error, stackTrace) {
      _talker.handle(
        error,
        stackTrace,
        'Error fetching active spots for repeater $repeaterId',
      );
      rethrow;
    }
  }

  @override
  Future<List<SpotModel>> getAllSpotsForRepeater(
    String repeaterId, {
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      final rows = await _client
          .from('repeater_spots')
          .select(_enrichedSelectNoRepeater)
          .eq('repeater_id', repeaterId)
          .order('started_at', ascending: false)
          .range(offset, offset + limit - 1);
      return (rows as List<dynamic>)
          .map((r) => SpotModel.fromJson(r as Map<String, dynamic>))
          .toList();
    } catch (error, stackTrace) {
      _talker.handle(
        error,
        stackTrace,
        'Error fetching all spots for repeater $repeaterId',
      );
      rethrow;
    }
  }

  @override
  Future<List<SpotModel>> getRecentSpots() async {
    try {
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
    } catch (error, stackTrace) {
      _talker.handle(error, stackTrace, 'Error fetching recent spots');
      rethrow;
    }
  }

  @override
  Future<SpotModel?> getMyActiveSpot(String userId) async {
    try {
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
    } catch (error, stackTrace) {
      _talker.handle(
        error,
        stackTrace,
        'Error fetching my active spot for user $userId',
      );
      rethrow;
    }
  }

  @override
  Future<List<String>> getRepeaterIdsWithActiveSpots() async {
    try {
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
    } catch (error, stackTrace) {
      _talker.handle(
        error,
        stackTrace,
        'Error fetching repeater IDs with active spots',
      );
      rethrow;
    }
  }

  @override
  Future<void> setClusterNotificationsEnabled({required bool enabled}) async {
    try {
      await _client
          .from('profiles')
          .update({'cluster_notifications_enabled': enabled}).eq(
        'id',
        _client.auth.currentUser!.id,
      );
    } catch (error, stackTrace) {
      _talker.handle(
        error,
        stackTrace,
        'Error setting cluster notifications enabled=$enabled',
      );
      rethrow;
    }
  }

  @override
  Future<void> setFavoriteClusterNotifications({
    required String favoriteId,
    required bool enabled,
  }) async {
    try {
      await _client.from('user_favorite_repeaters').update(
        {'cluster_notifications_enabled': enabled},
      ).eq('id', favoriteId);
    } catch (error, stackTrace) {
      _talker.handle(
        error,
        stackTrace,
        'Error setting favorite $favoriteId cluster notifications=$enabled',
      );
      rethrow;
    }
  }
}
