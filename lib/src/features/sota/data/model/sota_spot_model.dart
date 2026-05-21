import 'package:freezed_annotation/freezed_annotation.dart';

part 'sota_spot_model.freezed.dart';
part 'sota_spot_model.g.dart';

@freezed
abstract class SotaSpotModel with _$SotaSpotModel {
  const factory SotaSpotModel({
    int? id,
    @JsonKey(name: 'AltM') int? altM,
    @JsonKey(name: 'AltFt') int? altFt,
    int? points,
    String? timeStamp,
    String? activatorCallsign,
    String? summitCode,
    String? summitName,
    String? mode,
    double? frequency,
    String? activatorName,
    String? comments,
    String? type,
    String? callsign,
    int? userID,
    String? epoch,
  }) = _SotaSpotModel;

  factory SotaSpotModel.fromJson(Map<String, dynamic> json) =>
      _$SotaSpotModelFromJson(json);
}
