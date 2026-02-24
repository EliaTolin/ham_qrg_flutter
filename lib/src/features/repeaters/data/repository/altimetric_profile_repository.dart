import 'package:hamqrg/src/features/repeaters/data/datasource/altimetric_profile_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/datasource/altimetric_profile_supabase_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/mappers/altimetric_profile_mapper.dart';
import 'package:hamqrg/src/features/repeaters/domain/altimetric_profile/altimetric_profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'altimetric_profile_repository.g.dart';

class AltimetricProfileRepository {
  AltimetricProfileRepository(this._datasource);
  final AltimetricProfileDatasource _datasource;

  final _mapper = AltimetricProfileMapper();

  Future<AltimetricProfile> getAltimetricProfile({
    required double repeaterLat,
    required double repeaterLon,
    required double userLat,
    required double userLon,
  }) async {
    final model = await _datasource.getAltimetricProfile(
      repeaterLat: repeaterLat,
      repeaterLon: repeaterLon,
      userLat: userLat,
      userLon: userLon,
    );
    return _mapper.fromModel(model);
  }
}

@riverpod
AltimetricProfileRepository altimetricProfileRepository(Ref ref) {
  return AltimetricProfileRepository(
    ref.read(altimetricProfileSupabaseDatasourceProvider),
  );
}
