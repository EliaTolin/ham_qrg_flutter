import 'package:ham_qrg/src/features/repeaters_map/data/model/repeater/repeater_model.dart';

abstract interface class RepeatersDatasource {
  Future<List<RepeaterModel>> getRepeatersInBounds({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
    List<String>? modes,
  });

  Future<List<RepeaterModel>> searchRepeaters({
    required String query,
    int limit,
    List<String>? modes,
  });
}
