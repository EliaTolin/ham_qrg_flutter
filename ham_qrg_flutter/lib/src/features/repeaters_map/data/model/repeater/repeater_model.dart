import 'package:freezed_annotation/freezed_annotation.dart';

part 'repeater_model.freezed.dart';
part 'repeater_model.g.dart';

@freezed
abstract class RepeaterModel with _$RepeaterModel {
  const factory RepeaterModel({
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'frequency_hz') required int frequencyHz,
    required String mode,
    required String status,
    String? callsign,
    String? name,
    @JsonKey(name: 'node_number') int? nodeNumber,
    @JsonKey(name: 'manager_callsign') String? managerCallsign,
    @JsonKey(name: 'shift_hz') int? shiftHz,
    @JsonKey(name: 'shift_raw') String? shiftRaw,
    @JsonKey(name: 'tone_raw') String? toneRaw,
    @JsonKey(name: 'ctcss_hz') double? ctcssHz,
    String? network,
    String? region,
    @JsonKey(name: 'province_code') String? provinceCode,
    String? locality,
    String? locator,
    double? lat,
    double? lon,
    @JsonKey(name: 'distance_m') double? distanceM,
  }) = _RepeaterModel;

  factory RepeaterModel.fromJson(Map<String, dynamic> json) =>
      _$RepeaterModelFromJson(json);
}
