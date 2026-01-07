import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ham_qrg/src/features/repeaters/data/model/access/repeater_access_model.dart';

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
    String? callsign,
    String? name,
    String? manager,
    @JsonKey(name: 'shift_hz') int? shiftHz,
    @JsonKey(name: 'shift_raw') String? shiftRaw,
    String? region,
    @JsonKey(name: 'province_code') String? provinceCode,
    String? locality,
    String? locator,
    double? lat,
    double? lon,
    @JsonKey(name: 'distance_m') double? distanceM,
    required String source,
    @JsonKey(name: 'accesses') @Default([]) List<RepeaterAccessModel> accesses,
  }) = _RepeaterModel;

  factory RepeaterModel.fromJson(Map<String, dynamic> json) => _$RepeaterModelFromJson(json);
}
