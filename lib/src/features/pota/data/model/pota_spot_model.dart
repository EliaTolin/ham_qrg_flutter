import 'package:freezed_annotation/freezed_annotation.dart';

part 'pota_spot_model.freezed.dart';
part 'pota_spot_model.g.dart';

@freezed
abstract class PotaSpotModel with _$PotaSpotModel {
  const factory PotaSpotModel({
    required int spotId,
    required String spotTime,
    required String activator,
    required String frequency,
    required String mode,
    required String reference,
    required String name,
    String? locationDesc,
    String? spotter,
    String? comments,
    String? source,
  }) = _PotaSpotModel;

  factory PotaSpotModel.fromJson(Map<String, dynamic> json) =>
      _$PotaSpotModelFromJson(json);
}
