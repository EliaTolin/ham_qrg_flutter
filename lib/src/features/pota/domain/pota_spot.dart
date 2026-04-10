import 'package:freezed_annotation/freezed_annotation.dart';

part 'pota_spot.freezed.dart';

@freezed
abstract class PotaSpot with _$PotaSpot {
  const factory PotaSpot({
    required int spotId,
    required DateTime spotTime,
    required String activator,
    required String frequency,
    required String mode,
    required String reference,
    required String name,
    String? locationDesc,
    String? spotter,
    String? comments,
    String? source,
  }) = _PotaSpot;
}
