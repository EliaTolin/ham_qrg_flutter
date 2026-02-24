import 'package:hamqrg/src/features/repeaters/data/model/altimetric_profile/altimetric_profile_model.dart';

abstract interface class AltimetricProfileDatasource {
  Future<AltimetricProfileModel> getAltimetricProfile({
    required double repeaterLat,
    required double repeaterLon,
    required double userLat,
    required double userLon,
  });
}
