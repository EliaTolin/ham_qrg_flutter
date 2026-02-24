import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/repeaters/domain/altimetric_profile/altimetric_profile_point.dart';

part 'altimetric_profile.freezed.dart';

@freezed
abstract class AltimetricProfile with _$AltimetricProfile {
  const factory AltimetricProfile({
    required List<AltimetricProfilePoint> points,
    required double totalDistanceKm,
    required int numPoints,
  }) = _AltimetricProfile;
}
