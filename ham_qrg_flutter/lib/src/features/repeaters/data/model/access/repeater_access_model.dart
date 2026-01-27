import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/repeaters/data/model/network/network_model.dart';

part 'repeater_access_model.freezed.dart';
part 'repeater_access_model.g.dart';

@freezed
abstract class RepeaterAccessModel with _$RepeaterAccessModel {
  const factory RepeaterAccessModel({
    required String id,
    @JsonKey(name: 'repeater_id') required String repeaterId,
    required String mode,
    required String source,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'network_id') String? networkId,
    NetworkModel? network,
    @JsonKey(name: 'ctcss_tx_hz') double? ctcssTxHz,
    @JsonKey(name: 'ctcss_rx_hz') double? ctcssRxHz,
    @JsonKey(name: 'dcs_code') int? dcsCode,
    @JsonKey(name: 'color_code') int? colorCode,
    @JsonKey(name: 'dmr_id') int? dmrId,
    @JsonKey(name: 'dg_id') int? dgId,
    String? notes,
  }) = _RepeaterAccessModel;

  factory RepeaterAccessModel.fromJson(Map<String, dynamic> json) =>
      _$RepeaterAccessModelFromJson(json);
}
