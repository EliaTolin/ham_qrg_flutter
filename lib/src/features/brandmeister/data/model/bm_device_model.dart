import 'package:freezed_annotation/freezed_annotation.dart';

part 'bm_device_model.freezed.dart';
part 'bm_device_model.g.dart';

@freezed
abstract class BmDeviceModel with _$BmDeviceModel {
  const factory BmDeviceModel({
    required int id,
    String? callsign,
    String? hardware,
    String? firmware,
    String? tx,
    String? rx,
    @JsonKey(name: 'colorcode') int? colorCode,
    int? status,
    double? lat,
    double? lng,
    String? city,
    String? website,
    int? pep,
    int? agl,
    String? description,
    @JsonKey(name: 'last_seen') String? lastSeen,
  }) = _BmDeviceModel;

  factory BmDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$BmDeviceModelFromJson(json);
}
