import 'package:freezed_annotation/freezed_annotation.dart';

part 'pota_park_model.freezed.dart';
part 'pota_park_model.g.dart';

@freezed
abstract class PotaParkModel with _$PotaParkModel {
  const factory PotaParkModel({
    required String reference,
    required String name,
    double? latitude,
    double? longitude,
    String? grid4,
    String? grid6,
    String? parktypeDesc,
    String? locationName,
    String? entityName,
    String? website,
    String? accessMethods,
    String? firstActivator,
    String? firstActivationDate,
  }) = _PotaParkModel;

  factory PotaParkModel.fromJson(Map<String, dynamic> json) =>
      _$PotaParkModelFromJson(json);
}
