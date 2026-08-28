import 'package:hamqrg/src/features/coverage_search/data/model/saved_station_model.dart';

/// Archivio delle postazioni salvate.
///
/// È un archivio, non una cache: nulla qui dentro scade e nulla viene espulso.
abstract class SavedStationsDatasource {
  Future<List<String>> readIndex();

  Future<SavedStationModel?> read(String id);

  /// Scrive il record e aggiorna l'indice.
  Future<void> write(SavedStationModel station);

  /// Unica rimozione ammessa: quella esplicita dell'utente (FR-051).
  Future<void> delete(String id);
}
