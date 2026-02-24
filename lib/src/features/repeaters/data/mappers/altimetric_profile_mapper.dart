import 'package:hamqrg/src/features/repeaters/data/model/altimetric_profile/altimetric_profile_model.dart';
import 'package:hamqrg/src/features/repeaters/data/model/altimetric_profile/altimetric_profile_point_model.dart';
import 'package:hamqrg/src/features/repeaters/domain/altimetric_profile/altimetric_profile.dart';
import 'package:hamqrg/src/features/repeaters/domain/altimetric_profile/altimetric_profile_point.dart';

class AltimetricProfileMapper {
  AltimetricProfile fromModel(AltimetricProfileModel model) {
    return AltimetricProfile(
      points: model.points.map(_pointFromModel).toList(),
      totalDistanceKm: model.totalDistanceKm,
      numPoints: model.numPoints,
    );
  }

  AltimetricProfilePoint _pointFromModel(
    AltimetricProfilePointModel model,
  ) {
    return AltimetricProfilePoint(
      lat: model.lat,
      lon: model.lon,
      elevationM: model.elevationM,
      distanceKm: model.distanceKm,
    );
  }
}
