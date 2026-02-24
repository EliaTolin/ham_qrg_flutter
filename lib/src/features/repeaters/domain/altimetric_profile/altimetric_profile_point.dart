import 'package:freezed_annotation/freezed_annotation.dart';

part 'altimetric_profile_point.freezed.dart';

@freezed
abstract class AltimetricProfilePoint with _$AltimetricProfilePoint {
  const factory AltimetricProfilePoint({
    required double lat,
    required double lon,
    required double elevationM,
    required double distanceKm,
  }) = _AltimetricProfilePoint;
}
