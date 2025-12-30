import 'dart:developer';

import 'package:ham_qrg/clients/supabase/supabase_client/supabase_client.dart';
import 'package:ham_qrg/src/features/repeaters/data/datasource/repeaters_datasource.dart';
import 'package:ham_qrg/src/features/repeaters/data/model/feedback/repeater_feedback_model.dart';
import 'package:ham_qrg/src/features/repeaters/data/model/feedback/repeater_feedback_stats_model.dart';
import 'package:ham_qrg/src/features/repeaters/data/model/repeater/repeater_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'repeaters_supabase_datasource.g.dart';

class RepeatersSupabaseDatasource implements RepeatersDatasource {
  RepeatersSupabaseDatasource(this._client);
  final SupabaseClient _client;
  @override
  Future<List<RepeaterModel>> getRepeatersInBounds({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
    List<String>? modes,
  }) async {
    try {
      final data = await _client.rpc(
        'repeaters_in_bounds',
        params: <String, dynamic>{
          'p_lat1': lat1,
          'p_lon1': lon1,
          'p_lat2': lat2,
          'p_lon2': lon2,
          if (modes != null && modes.isNotEmpty) 'p_modes': modes,
        },
      );

      if (data is! List) {
        return [];
      }

      return data
          .map(
            (e) => RepeaterModel.fromJson(
              Map<String, dynamic>.from(e as Map<dynamic, dynamic>),
            ),
          )
          .toList();
    } catch (error, stackTrace) {
      log('Error fetching repeaters_in_bounds: $error', stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<List<RepeaterModel>> getRepeatersNearby({
    required double latitude,
    required double longitude,
    double radiusKm = 50,
    List<String>? modes,
  }) async {
    try {
      final data = await _client.rpc(
        'repeaters_nearby',
        params: <String, dynamic>{
          'p_lat': latitude,
          'p_lon': longitude,
          'p_radius_km': radiusKm,
          if (modes != null && modes.isNotEmpty) 'p_modes': modes,
        },
      );

      if (data is! List) {
        return [];
      }

      return data
          .map(
            (e) => RepeaterModel.fromJson(
              Map<String, dynamic>.from(e as Map<dynamic, dynamic>),
            ),
          )
          .toList();
    } catch (error, stackTrace) {
      log('Error fetching repeaters_nearby: $error', stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<List<RepeaterModel>> searchRepeaters({
    required String query,
    int limit = 100,
    List<String>? modes,
  }) async {
    try {
      // Build OR conditions for searching multiple fields using PostgREST syntax
      // Search in: callsign, name, locality, region, locator, manager_callsign
      final searchPattern = '%$query%';
      // Format: field1.ilike.pattern,field2.ilike.pattern
      final orConditions =
          'callsign.ilike.$searchPattern,name.ilike.$searchPattern,locality.ilike.$searchPattern,region.ilike.$searchPattern,locator.ilike.$searchPattern,manager_callsign.ilike.$searchPattern';

      var request = _client.from('repeaters').select().or(orConditions);

      // Apply mode filter if provided
      if (modes != null && modes.isNotEmpty) {
        request = request.inFilter('mode', modes);
      }

      // Limit results
      final data = await request.limit(limit);

      final dataList = data as List;
      return dataList
          .map(
            (e) => RepeaterModel.fromJson(
              Map<String, dynamic>.from(e as Map<dynamic, dynamic>),
            ),
          )
          .toList();
    } catch (error, stackTrace) {
      log('Error searching repeaters: $error', stackTrace: stackTrace);
      // If OR doesn't work, fallback to simple callsign search
      try {
        log('Falling back to callsign-only search');
        var request = _client.from('repeaters').select().ilike('callsign', '%$query%');

        if (modes != null && modes.isNotEmpty) {
          request = request.inFilter('mode', modes);
        }

        final data = await request.limit(limit);
        final dataList = data as List;
        return dataList
            .map(
              (e) => RepeaterModel.fromJson(
                Map<String, dynamic>.from(e as Map<dynamic, dynamic>),
              ),
            )
            .toList();
      } catch (fallbackError, fallbackStack) {
        log(
          'Error with fallback search: $fallbackError',
          stackTrace: fallbackStack,
        );
        return [];
      }
    }
  }

  @override
  Future<int?> getTotalFavoritesCount(String userId) async {
    try {
      if (userId.isEmpty) {
        return null;
      }
      final data =
          await _client.from('user_favorite_repeaters').select('id').eq('user_id', userId).count();
      return data.count;
    } catch (e) {
      log('Error fetching total favorites count: $e');
      rethrow;
    }
  }

  @override
  Future<int> getTotalRepeatersCount() async {
    try {
      final data = await _client.from('repeaters').select('id').count();
      return data.count;
    } catch (e) {
      log('Error fetching total repeaters count: $e');
      rethrow;
    }
  }

  @override
  Future<List<String>> getFavoriteRepeatersIds(String userId) async {
    try {
      if (userId.isEmpty) {
        return [];
      }
      final data =
          await _client.from('user_favorite_repeaters').select('repeater_id').eq('user_id', userId);

      return (data as List)
          .map(
            (e) => (e as Map<String, dynamic>)['repeater_id'] as String,
          )
          .toList();
    } catch (error, stackTrace) {
      log(
        'Error fetching favorite repeaters IDs: $error',
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<RepeaterModel?> getRepeaterById(String repeaterId) async {
    try {
      final data = await _client.from('repeaters').select().eq('id', repeaterId).maybeSingle();

      if (data == null) {
        return null;
      }

      return RepeaterModel.fromJson(Map<String, dynamic>.from(data));
    } catch (error, stackTrace) {
      log('Error fetching repeater by id: $error', stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<List<RepeaterModel>> getFavoriteRepeaters(String userId) async {
    try {
      if (userId.isEmpty) {
        return [];
      }
      final data = await _client
          .from('user_favorite_repeaters')
          .select('repeater:repeaters(*)')
          .eq('user_id', userId);

      return (data as List)
          .map((e) {
            final repeaterData = (e as Map<String, dynamic>)['repeater'];
            if (repeaterData == null) {
              return null;
            }
            return RepeaterModel.fromJson(
              Map<String, dynamic>.from(repeaterData),
            );
          })
          .whereType<RepeaterModel>()
          .toList();
    } catch (error, stackTrace) {
      log('Error fetching favorite repeaters: $error', stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> addFavoriteRepeater(String userId, String repeaterId) async {
    try {
      if (userId.isEmpty) {
        throw Exception('User not authenticated');
      }
      await _client.from('user_favorite_repeaters').insert({
        'user_id': userId,
        'repeater_id': repeaterId,
      });
    } catch (error, stackTrace) {
      log('Error adding favorite repeater: $error', stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> removeFavoriteRepeater(String userId, String repeaterId) async {
    try {
      if (userId.isEmpty) {
        throw Exception('User not authenticated');
      }
      await _client
          .from('user_favorite_repeaters')
          .delete()
          .eq('user_id', userId)
          .eq('repeater_id', repeaterId);
    } catch (error, stackTrace) {
      log('Error removing favorite repeater: $error', stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<RepeaterFeedbackStatsModel?> getRepeaterFeedbackStats(
    String repeaterId,
  ) async {
    try {
      final data = await _client
          .from('v_repeater_feedback_stats')
          .select()
          .eq('repeater_id', repeaterId)
          .maybeSingle();

      if (data == null) {
        return null;
      }

      return RepeaterFeedbackStatsModel.fromJson(
        Map<String, dynamic>.from(data),
      );
    } catch (error, stackTrace) {
      log('Error fetching repeater feedback stats: $error', stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> addRepeaterFeedback({
    required String userId,
    required String repeaterId,
    required String type,
    required String station,
    required double latitude,
    required double longitude,
    required String comment,
  }) async {
    try {
      await _client.from('repeater_feedback').insert({
        'repeater_id': repeaterId,
        'user_id': userId,
        'type': type,
        'station': station,
        'lat': latitude,
        'lon': longitude,
        'comment': comment.trim(),
      });
    } catch (error, stackTrace) {
      log('Error adding repeater feedback: $error', stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> deleteRepeaterFeedback(
    String userId,
    String feedbackId,
  ) async {
    try {
      await _client.from('repeater_feedback').delete().eq('id', feedbackId).eq('user_id', userId);
    } catch (error, stackTrace) {
      log('Error deleting repeater feedback: $error', stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<List<RepeaterFeedbackModel>> getRepeaterFeedbacks({
    required String repeaterId,
    int? limit,
  }) async {
    try {
      var query = _client
          .from('repeater_feedback')
          .select()
          .eq('repeater_id', repeaterId)
          .order('created_at', ascending: false);

      if (limit != null) {
        query = query.limit(limit);
      }

      final data = await query;

      return (data as List)
          .map(
            (e) => RepeaterFeedbackModel.fromJson(
              Map<String, dynamic>.from(e),
            ),
          )
          .toList();
    } catch (error, stackTrace) {
      log('Error fetching repeater feedbacks: $error', stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<RepeaterFeedbackModel?> getMyRepeaterFeedback({
    required String userId,
    required String repeaterId,
  }) async {
    try {
      final data = await _client
          .from('repeater_feedback')
          .select()
          .eq('repeater_id', repeaterId)
          .eq('user_id', userId)
          .maybeSingle();

      if (data == null) {
        return null;
      }

      return RepeaterFeedbackModel.fromJson(
        Map<String, dynamic>.from(data),
      );
    } catch (error, stackTrace) {
      log('Error fetching my repeater feedback: $error', stackTrace: stackTrace);
      rethrow;
    }
  }
}

@riverpod
RepeatersDatasource repeatersSupabaseDatasource(Ref ref) {
  return RepeatersSupabaseDatasource(ref.read(supabaseClientProvider));
}
