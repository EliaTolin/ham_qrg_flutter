import 'package:freezed_annotation/freezed_annotation.dart';

part 'altimetric_profile_point_model.freezed.dart';
part 'altimetric_profile_point_model.g.dart';

@freezed
abstract class AltimetricProfilePointModel
    with _$AltimetricProfilePointModel {
  const factory AltimetricProfilePointModel({
    required double lat,
    required double lon,
    @JsonKey(name: 'elevation_m') required double elevationM,
    @JsonKey(name: 'distance_km') required double distanceKm,
  }) = _AltimetricProfilePointModel;

  factory AltimetricProfilePointModel.fromJson(Map<String, dynamic> json) =>
      _$AltimetricProfilePointModelFromJson(json);
}
