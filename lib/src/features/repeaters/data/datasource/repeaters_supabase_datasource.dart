import 'package:hamqrg/clients/supabase/supabase_client/supabase_client.dart';
import 'package:hamqrg/log/talker_service/talker_service.dart';
import 'package:hamqrg/src/features/repeaters/data/datasource/repeaters_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/model/feedback/repeater_feedback_model.dart';
import 'package:hamqrg/src/features/repeaters/data/model/feedback/repeater_feedback_stats_model.dart';
import 'package:hamqrg/src/features/repeaters/data/model/repeater/repeater_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'repeaters_supabase_datasource.g.dart';

class RepeatersSupabaseDatasource implements RepeatersDatasource {
  RepeatersSupabaseDatasource(this._client, this._talker);
  final SupabaseClient _client;
  final Talker _talker;

  void _logTiming(String method, Stopwatch sw, {String? extra}) {
    final ms = sw.elapsedMilliseconds;
    final emoji = ms < 200
        ? '🟢'
        : ms < 400
            ? '🟡'
            : '🔴';
    final detail = extra != null ? ' ($extra)' : '';
    _talker.log('$emoji [$method] ${ms}ms$detail');
  }

  @override
  Future<List<RepeaterModel>> getRepeatersInBounds({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
    List<String>? accessModes,
  }) async {
    final sw = Stopwatch()..start();
    try {
      final data = await _client.rpc(
        'repeaters_in_bounds',
        params: <String, dynamic>{
          'p_lat1': lat1,
          'p_lon1': lon1,
          'p_lat2': lat2,
          'p_lon2': lon2,
          if (accessModes != null && accessModes.isNotEmpty) 'p_access_modes': accessModes,
        },
      );

      if (data is! List) {
        _logTiming('getRepeatersInBounds', sw, extra: '0 results');
        return [];
      }
      final results = data.map((e) {
        final row = e as Map<String, dynamic>;
        final repeaterData = Map<String, dynamic>.from(row['repeater'] as Map);
        repeaterData['distance_m'] = row['distance_m'];
        repeaterData['accesses'] = row['accesses'];
        return RepeaterModel.fromJson(repeaterData);
      }).toList();
      _logTiming('getRepeatersInBounds', sw, extra: '${results.length} results');
      return results;
    } catch (error, stackTrace) {
      _logTiming('getRepeatersInBounds', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error fetching repeaters_in_bounds');
      rethrow;
    }
  }

  @override
  Future<List<RepeaterModel>> getRepeatersNearby({
    required double latitude,
    required double longitude,
    double radiusKm = 50,
    List<String>? accessModes,
  }) async {
    final sw = Stopwatch()..start();
    try {
      final data = await _client.rpc(
        'repeaters_nearby',
        params: <String, dynamic>{
          'p_lat': latitude,
          'p_lon': longitude,
          'p_radius_km': radiusKm,
          if (accessModes != null && accessModes.isNotEmpty) 'p_access_modes': accessModes,
        },
      );

      if (data is! List) {
        _logTiming('getRepeatersNearby', sw, extra: '0 results');
        return [];
      }

      final results = data.map((e) {
        final row = e as Map<String, dynamic>;
        final repeaterData = Map<String, dynamic>.from(row['repeater'] as Map);
        repeaterData['distance_m'] = row['distance_m'];
        repeaterData['accesses'] = row['accesses'];
        return RepeaterModel.fromJson(repeaterData);
      }).toList();
      _logTiming('getRepeatersNearby', sw, extra: '${results.length} results');
      return results;
    } catch (error, stackTrace) {
      _logTiming('getRepeatersNearby', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error fetching repeaters_nearby');
      rethrow;
    }
  }

  @override
  Future<List<RepeaterModel>> searchRepeaters({
    required String query,
    int limit = 100,
    List<String>? accessModes,
  }) async {
    final sw = Stopwatch()..start();
    try {
      final searchPattern = '%$query%';
      final orConditions =
          'callsign.ilike.$searchPattern,name.ilike.$searchPattern,locality.ilike.$searchPattern,region.ilike.$searchPattern,locator.ilike.$searchPattern,manager.ilike.$searchPattern';

      final hasAccessModeFilter = accessModes != null && accessModes.isNotEmpty;

      final selectQuery = hasAccessModeFilter
          ? '*, accesses:repeater_access!inner(*)'
          : '*, accesses:repeater_access(*, network:networks(*))';

      var request = _client.from('repeaters').select(selectQuery).or(orConditions);

      if (hasAccessModeFilter) {
        request = request.inFilter('accesses.mode', accessModes);
      }

      final data = await request.limit(limit);

      final dataList = data as List;
      final results =
          dataList.map((e) => RepeaterModel.fromJson(e as Map<String, dynamic>)).toList();
      _logTiming('searchRepeaters', sw, extra: '"$query" → ${results.length} results');
      return results;
    } catch (error, stackTrace) {
      _talker.handle(error, stackTrace, 'Error searching repeaters');
      try {
        final hasAccessModeFilter = accessModes != null && accessModes.isNotEmpty;
        final selectQuery = hasAccessModeFilter
            ? '*, accesses:repeater_access!inner(*)'
            : '*, accesses:repeater_access(*, network:networks(*))';

        var request = _client.from('repeaters').select(selectQuery).ilike('callsign', '%$query%');

        if (hasAccessModeFilter) {
          request = request.inFilter('accesses.mode', accessModes);
        }

        final data = await request.limit(limit);
        final dataList = data as List;
        final results = dataList
            .map(
              (e) => RepeaterModel.fromJson(
                Map<String, dynamic>.from(e as Map<dynamic, dynamic>),
              ),
            )
            .toList();
        _logTiming(
          'searchRepeaters',
          sw,
          extra: '⚠️ fallback "$query" → ${results.length} results',
        );
        return results;
      } catch (fallbackError, fallbackStack) {
        _logTiming('searchRepeaters', sw, extra: '❌ fallback error');
        _talker.handle(fallbackError, fallbackStack, 'Error with fallback search');
        return [];
      }
    }
  }

  @override
  Future<int?> getTotalFavoritesCount(String userId) async {
    final sw = Stopwatch()..start();
    try {
      if (userId.isEmpty) {
        return null;
      }
      final data =
          await _client.from('user_favorite_repeaters').select('id').eq('user_id', userId).count();
      _logTiming('getTotalFavoritesCount', sw, extra: '${data.count}');
      return data.count;
    } catch (error, stackTrace) {
      _logTiming('getTotalFavoritesCount', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error fetching total favorites count');
      rethrow;
    }
  }

  @override
  Future<int> getTotalRepeatersCount() async {
    final sw = Stopwatch()..start();
    try {
      final data = await _client.from('repeaters').select('id').count();
      _logTiming('getTotalRepeatersCount', sw, extra: '${data.count}');
      return data.count;
    } catch (error, stackTrace) {
      _logTiming('getTotalRepeatersCount', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error fetching total repeaters count');
      rethrow;
    }
  }

  @override
  Future<List<String>> getFavoriteRepeatersIds(String userId) async {
    final sw = Stopwatch()..start();
    try {
      if (userId.isEmpty) {
        return [];
      }
      final data =
          await _client.from('user_favorite_repeaters').select('repeater_id').eq('user_id', userId);

      final results = (data as List)
          .map(
            (e) => (e as Map<String, dynamic>)['repeater_id'] as String,
          )
          .toList();
      _logTiming('getFavoriteRepeatersIds', sw, extra: '${results.length} ids');
      return results;
    } catch (error, stackTrace) {
      _logTiming('getFavoriteRepeatersIds', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error fetching favorite repeaters IDs');
      rethrow;
    }
  }

  @override
  Future<RepeaterModel?> getRepeaterById(String repeaterId) async {
    final sw = Stopwatch()..start();
    try {
      // Run repeater and accesses queries in parallel (no joins)
      final repeaterFuture = _client.from('repeaters').select().eq('id', repeaterId).maybeSingle();
      final accessesFuture = _client.from('repeater_access').select().eq('repeater_id', repeaterId);

      final (repeaterData, accessesList) = await (repeaterFuture, accessesFuture).wait;

      if (repeaterData == null) {
        _logTiming('getRepeaterById', sw, extra: '⚠️ null');
        return null;
      }

      // Collect unique network IDs from accesses
      final networkIds =
          accessesList.map((e) => e['network_id'] as String?).whereType<String>().toSet();

      // Fetch networks in a single query if any exist
      final networksMap = <String, Map<String, dynamic>>{};
      if (networkIds.isNotEmpty) {
        final networksData =
            await _client.from('networks').select().inFilter('id', networkIds.toList());
        for (final net in networksData) {
          networksMap[net['id'] as String] = net;
        }
      }

      // Assemble accesses with their networks
      final accesses = accessesList.map((e) {
        final accessMap = Map<String, dynamic>.from(e);
        final networkId = accessMap['network_id'] as String?;
        if (networkId != null && networksMap.containsKey(networkId)) {
          accessMap['network'] = networksMap[networkId];
        }
        return accessMap;
      }).toList();

      repeaterData['accesses'] = accesses;

      _logTiming('getRepeaterById', sw, extra: '✅ found');
      return RepeaterModel.fromJson(repeaterData);
    } catch (error, stackTrace) {
      _logTiming('getRepeaterById', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error fetching repeater by id');
      rethrow;
    }
  }

  @override
  Future<List<RepeaterModel>> getFavoriteRepeaters(String userId) async {
    final sw = Stopwatch()..start();
    try {
      if (userId.isEmpty) {
        return [];
      }
      final data = await _client
          .from('user_favorite_repeaters')
          .select('repeater:repeaters(*, accesses:repeater_access(*, network:networks(*)))')
          .eq('user_id', userId);

      final results = (data as List)
          .map((e) {
            final repeaterData = (e as Map<String, dynamic>)['repeater'];
            if (repeaterData == null) {
              return null;
            }
            return RepeaterModel.fromJson(repeaterData);
          })
          .whereType<RepeaterModel>()
          .toList();
      _logTiming('getFavoriteRepeaters', sw, extra: '${results.length} results');
      return results;
    } catch (error, stackTrace) {
      _logTiming('getFavoriteRepeaters', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error fetching favorite repeaters');
      rethrow;
    }
  }

  @override
  Future<void> addFavoriteRepeater(String userId, String repeaterId) async {
    final sw = Stopwatch()..start();
    try {
      if (userId.isEmpty) {
        throw Exception('User not authenticated');
      }
      await _client.from('user_favorite_repeaters').insert({
        'user_id': userId,
        'repeater_id': repeaterId,
      });
      _logTiming('addFavoriteRepeater', sw);
    } catch (error, stackTrace) {
      _logTiming('addFavoriteRepeater', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error adding favorite repeater');
      rethrow;
    }
  }

  @override
  Future<void> removeFavoriteRepeater(String userId, String repeaterId) async {
    final sw = Stopwatch()..start();
    try {
      if (userId.isEmpty) {
        throw Exception('User not authenticated');
      }
      await _client
          .from('user_favorite_repeaters')
          .delete()
          .eq('user_id', userId)
          .eq('repeater_id', repeaterId);
      _logTiming('removeFavoriteRepeater', sw);
    } catch (error, stackTrace) {
      _logTiming('removeFavoriteRepeater', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error removing favorite repeater');
      rethrow;
    }
  }

  @override
  Future<RepeaterFeedbackStatsModel?> getRepeaterFeedbackStats(
    String repeaterId,
  ) async {
    final sw = Stopwatch()..start();
    try {
      // Query repeater_feedback directly instead of the view,
      // which can't push the WHERE filter inside the GROUP BY.
      final data = await _client
          .from('repeater_feedback')
          .select('type, created_at')
          .eq('repeater_id', repeaterId);

      final rows = data as List;
      if (rows.isEmpty) {
        _logTiming('getRepeaterFeedbackStats', sw, extra: '⚠️ null');
        return null;
      }

      // Aggregate in Dart (same logic as the v_repeater_feedback_stats view)
      var likesTotal = 0;
      var downTotal = 0;
      String? lastLikeAt;
      String? lastDownAt;

      for (final row in rows) {
        final r = row as Map<String, dynamic>;
        final type = r['type'] as String;
        final createdAt = r['created_at'] as String;
        if (type == 'like') {
          likesTotal++;
          if (lastLikeAt == null || createdAt.compareTo(lastLikeAt) > 0) {
            lastLikeAt = createdAt;
          }
        } else if (type == 'down') {
          downTotal++;
          if (lastDownAt == null || createdAt.compareTo(lastDownAt) > 0) {
            lastDownAt = createdAt;
          }
        }
      }

      _logTiming(
        'getRepeaterFeedbackStats',
        sw,
        extra: '✅ ${rows.length} feedbacks',
      );

      return RepeaterFeedbackStatsModel.fromJson({
        'repeater_id': repeaterId,
        'likes_total': likesTotal,
        'down_total': downTotal,
        'last_like_at': lastLikeAt,
        'last_down_at': lastDownAt,
      });
    } catch (error, stackTrace) {
      _logTiming('getRepeaterFeedbackStats', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error fetching repeater feedback stats');
      rethrow;
    }
  }

  @override
  Future<void> addRepeaterFeedback({
    required String userId,
    required String repeaterId,
    required String repeaterAccessId,
    required String type,
    required String station,
    required double latitude,
    required double longitude,
    required String comment,
  }) async {
    final sw = Stopwatch()..start();
    try {
      await _client.from('repeater_feedback').insert({
        'repeater_id': repeaterId,
        'repeater_access_id': repeaterAccessId,
        'user_id': userId,
        'type': type,
        'station': station,
        'lat': latitude,
        'lon': longitude,
        'comment': comment.trim(),
      });
      _logTiming('addRepeaterFeedback', sw);
    } catch (error, stackTrace) {
      _logTiming('addRepeaterFeedback', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error adding repeater feedback');
      rethrow;
    }
  }

  @override
  Future<void> deleteRepeaterFeedback(
    String userId,
    String feedbackId,
  ) async {
    final sw = Stopwatch()..start();
    try {
      await _client.from('repeater_feedback').delete().eq('id', feedbackId).eq('user_id', userId);
      _logTiming('deleteRepeaterFeedback', sw);
    } catch (error, stackTrace) {
      _logTiming('deleteRepeaterFeedback', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error deleting repeater feedback');
      rethrow;
    }
  }

  @override
  Future<List<RepeaterFeedbackModel>> getRepeaterFeedbacks({
    required String repeaterId,
    int? limit,
  }) async {
    final sw = Stopwatch()..start();
    try {
      var query = _client
          .from('repeater_feedback')
          .select(
            '*, repeater:repeaters(*, accesses:repeater_access(*, network:networks(*))), repeater_access:repeater_access_id(*, network:networks(*)), profile:profiles!user_id(callsign, first_name, last_name, propic)',
          )
          .eq('repeater_id', repeaterId)
          .order('created_at', ascending: false);

      if (limit != null) {
        query = query.limit(limit);
      }

      final data = await query;

      final results = (data as List)
          .map(
            (e) => RepeaterFeedbackModel.fromJson(
              Map<String, dynamic>.from(e),
            ),
          )
          .toList();
      _logTiming('getRepeaterFeedbacks', sw, extra: '${results.length} results');
      return results;
    } catch (error, stackTrace) {
      _logTiming('getRepeaterFeedbacks', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error fetching repeater feedbacks');
      rethrow;
    }
  }

  @override
  Future<RepeaterFeedbackModel?> getMyRepeaterFeedback({
    required String userId,
    required String repeaterId,
  }) async {
    final sw = Stopwatch()..start();
    try {
      final data = await _client
          .from('repeater_feedback')
          .select()
          .eq('repeater_id', repeaterId)
          .eq('user_id', userId)
          .maybeSingle();

      _logTiming('getMyRepeaterFeedback', sw, extra: data != null ? '✅ found' : '⚠️ null');

      if (data == null) {
        return null;
      }

      return RepeaterFeedbackModel.fromJson(
        Map<String, dynamic>.from(data),
      );
    } catch (error, stackTrace) {
      _logTiming('getMyRepeaterFeedback', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error fetching my repeater feedback');
      rethrow;
    }
  }

  @override
  Future<List<RepeaterFeedbackModel>> getMyRepeaterFeedbacks({
    required String userId,
    required String repeaterId,
  }) async {
    final sw = Stopwatch()..start();
    try {
      final data = await _client
          .from('repeater_feedback')
          .select(
            '*, repeater:repeaters(*, accesses:repeater_access(*, network:networks(*))), repeater_access:repeater_access_id(*, network:networks(*)), profile:profiles!user_id(callsign, first_name, last_name, propic)',
          )
          .eq('repeater_id', repeaterId)
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      final results = (data as List)
          .map(
            (e) => RepeaterFeedbackModel.fromJson(
              Map<String, dynamic>.from(e),
            ),
          )
          .toList();
      _logTiming('getMyRepeaterFeedbacks', sw, extra: '${results.length} results');
      return results;
    } catch (error, stackTrace) {
      _logTiming('getMyRepeaterFeedbacks', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error fetching my repeater feedbacks');
      rethrow;
    }
  }

  @override
  Future<void> submitRepeaterReport({
    required String userId,
    required String repeaterId,
    required String description,
  }) async {
    final sw = Stopwatch()..start();
    try {
      if (userId.isEmpty) {
        throw Exception('User not authenticated');
      }
      await _client.from('repeater_reports').insert({
        'user_id': userId,
        'repeater_id': repeaterId,
        'description': description.trim(),
      });
      _logTiming('submitRepeaterReport', sw);
    } catch (error, stackTrace) {
      _logTiming('submitRepeaterReport', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error submitting repeater report');
      rethrow;
    }
  }
}

@riverpod
RepeatersDatasource repeatersSupabaseDatasource(Ref ref) {
  return RepeatersSupabaseDatasource(
    ref.read(supabaseClientProvider),
    ref.read(talkerServiceProvider),
  );
}
