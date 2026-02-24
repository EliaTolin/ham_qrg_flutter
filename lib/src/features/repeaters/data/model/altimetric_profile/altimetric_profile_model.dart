import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/repeaters/data/model/altimetric_profile/altimetric_profile_point_model.dart';

part 'altimetric_profile_model.freezed.dart';
part 'altimetric_profile_model.g.dart';

@freezed
abstract class AltimetricProfileModel with _$AltimetricProfileModel {
  const factory AltimetricProfileModel({
    required List<AltimetricProfilePointModel> points,
    @JsonKey(name: 'total_distance_km') required double totalDistanceKm,
    @JsonKey(name: 'num_points') required int numPoints,
  }) = _AltimetricProfileModel;

  factory AltimetricProfileModel.fromJson(Map<String, dynamic> json) =>
      _$AltimetricProfileModelFromJson(json);
}
