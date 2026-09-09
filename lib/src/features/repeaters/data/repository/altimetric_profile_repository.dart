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

/// **`watch` e non `read`**: il datasource è costruito attorno a
/// `OfflineCacheGate`, che cattura connettività ed entitlement **al momento
/// della costruzione**. Letto con `read`, questo repository resterebbe
/// aggrappato per sempre alla prima istanza: se al primo avvio i flag erano
/// ancora sbagliati — il probe di rete che scade sotto la contesa dell'avvio
/// basta a dichiarare un falso offline — ogni chiamata continuerebbe a
/// fallire per tutta la sessione, e solo un riprova manuale (che dispone e
/// ricostruisce la catena) la rimetterebbe in piedi. Con `watch` il
/// repository si ricostruisce da sé quando i flag si assestano, e le query
/// che lo osservano ripartono da sole.
@riverpod
AltimetricProfileRepository altimetricProfileRepository(Ref ref) {
  return AltimetricProfileRepository(
    ref.watch(altimetricProfileSupabaseDatasourceProvider),
  );
}
