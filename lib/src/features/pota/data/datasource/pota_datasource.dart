import 'package:hamqrg/src/features/pota/data/model/pota_park_model.dart';
import 'package:hamqrg/src/features/pota/data/model/pota_spot_model.dart';

/// Abstract interface for POTA API calls.
abstract interface class PotaDatasource {
  /// Fetches all currently active POTA spots.
  Future<List<PotaSpotModel>> getActiveSpots();

  /// Fetches park details by reference (e.g. "US-4999").
  Future<PotaParkModel> getPark(String reference);
}
