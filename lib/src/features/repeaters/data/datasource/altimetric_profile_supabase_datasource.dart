import 'package:hamqrg/clients/supabase/supabase_client/supabase_client.dart';
import 'package:hamqrg/common/cache/offline_cache_gate_ref.dart';
import 'package:hamqrg/src/features/repeaters/data/datasource/altimetric_profile_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/datasource/cached_altimetric_profile_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/model/altimetric_profile/altimetric_profile_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'altimetric_profile_supabase_datasource.g.dart';

class AltimetricProfileSupabaseDatasource
    implements AltimetricProfileDatasource {
  AltimetricProfileSupabaseDatasource(this._client);
  final SupabaseClient _client;

  @override
  Future<AltimetricProfileModel> getAltimetricProfile({
    required double repeaterLat,
    required double repeaterLon,
    required double userLat,
    required double userLon,
  }) async {
    final response = await _client.functions.invoke(
      'get_altimetric_profile',
      body: {
        'repeater_lat': repeaterLat,
        'repeater_lon': repeaterLon,
        'user_lat': userLat,
        'user_lon': userLon,
      },
    );

    final data = response.data as Map<String, dynamic>;
    return AltimetricProfileModel.fromJson(data);
  }
}

@riverpod
AltimetricProfileDatasource altimetricProfileSupabaseDatasource(Ref ref) {
  return CachedAltimetricProfileDatasource(
    inner: AltimetricProfileSupabaseDatasource(
      ref.read(supabaseClientProvider),
    ),
    gate: ref.watchOfflineCacheGate(
      remoteTimeout: CachedAltimetricProfileDatasource.remoteTimeout,
    ),
  );
}
