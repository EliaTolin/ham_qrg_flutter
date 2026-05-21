import 'package:freezed_annotation/freezed_annotation.dart';

part 'sota_spot.freezed.dart';

enum SotaSpotType { normal, qrt }

@freezed
abstract class SotaSpot with _$SotaSpot {
  const factory SotaSpot({
    required int id,
    required DateTime timestamp,
    required String activator,
    required String summitCode,
    required String summitName,
    required int altitudeM,
    required int altitudeFt,
    required int points,
    required double frequencyMhz,
    required String mode,
    required SotaSpotType type,
    String? activatorName,
    String? comments,
    String? spotter,
  }) = _SotaSpot;
}
