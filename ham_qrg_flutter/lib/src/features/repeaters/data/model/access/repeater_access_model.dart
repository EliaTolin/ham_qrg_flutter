import 'package:freezed_annotation/freezed_annotation.dart';

part 'repeater_access_model.freezed.dart';
part 'repeater_access_model.g.dart';

@freezed
abstract class RepeaterAccessModel with _$RepeaterAccessModel {
  const factory RepeaterAccessModel({
    required String id,
    @JsonKey(name: 'repeater_id') required String repeaterId,
    @JsonKey(name: 'network_id') String? networkId,
    required String mode,
    @JsonKey(name: 'ctcss_hz') double? ctcssHz,
    @JsonKey(name: 'dcs_code') int? dcsCode,
    @JsonKey(name: 'tone_scope') required String toneScope,
    @JsonKey(name: 'tone_direction') required String toneDirection,
    @JsonKey(name: 'color_code') int? colorCode,
    @JsonKey(name: 'dmr_id') int? dmrId,
    @JsonKey(name: 'dg_id') int? dgId,
    String? notes,
    required String source,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _RepeaterAccessModel;

  factory RepeaterAccessModel.fromJson(Map<String, dynamic> json) =>
      _$RepeaterAccessModelFromJson(json);
}

