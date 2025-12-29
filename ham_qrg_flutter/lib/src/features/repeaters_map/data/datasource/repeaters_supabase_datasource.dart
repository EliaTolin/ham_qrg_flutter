import 'dart:developer';

import 'package:ham_qrg/clients/supabase/supabase_client/supabase_client.dart';
import 'package:ham_qrg/src/features/repeaters_map/data/datasource/repeaters_datasource.dart';
import 'package:ham_qrg/src/features/repeaters_map/data/model/repeater/repeater_model.dart';
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
}

@riverpod
RepeatersDatasource repeatersSupabaseDatasource(Ref ref) {
  return RepeatersSupabaseDatasource(ref.read(supabaseClientProvider));
}
