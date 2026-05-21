import 'package:hamqrg/src/features/sota/data/model/sota_spot_model.dart';
import 'package:hamqrg/src/features/sota/data/model/sota_summit_model.dart';

abstract interface class SotaDatasource {
  Future<List<SotaSpotModel>> getActiveSpots();
  Future<SotaSummitModel> getSummit(String summitCode);
}
