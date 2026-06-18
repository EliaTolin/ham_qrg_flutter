import 'package:freezed_annotation/freezed_annotation.dart';

part 'reachable_model.freezed.dart';
part 'reachable_model.g.dart';

/// DTO for one repeater in the /reachable response.
@freezed
abstract class ReachableRepeaterModel with _$ReachableRepeaterModel {
  const factory ReachableRepeaterModel({
    required String id,
    required double dbm,
    @JsonKey(name: 'loss_db') required double lossDb,
    @JsonKey(name: 'distance_km') required double distanceKm,
    @JsonKey(name: 'azimuth_deg') required double azimuthDeg,
    required bool reachable,
    @JsonKey(name: 'itm_errno') @Default(0) int itmErrno,
  }) = _ReachableRepeaterModel;

  factory ReachableRepeaterModel.fromJson(Map<String, dynamic> json) =>
      _$ReachableRepeaterModelFromJson(json);
}

/// DTO for the /reachable response body.
@freezed
abstract class ReachableResponseModel with _$ReachableResponseModel {
  const factory ReachableResponseModel({
    @Default(0) int count,
    @Default([]) List<ReachableRepeaterModel> reachable,
  }) = _ReachableResponseModel;

  factory ReachableResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ReachableResponseModelFromJson(json);
}

/// DTO for one terrain-profile sample in the /link response.
@freezed
abstract class LinkProfilePointModel with _$LinkProfilePointModel {
  const factory LinkProfilePointModel({
    @JsonKey(name: 'distance_km') required double distanceKm,
    @JsonKey(name: 'ground_m') required double groundM,
  }) = _LinkProfilePointModel;

  factory LinkProfilePointModel.fromJson(Map<String, dynamic> json) =>
      _$LinkProfilePointModelFromJson(json);
}

/// DTO for the /link response body (single link + terrain profile).
@freezed
abstract class LinkDetailModel with _$LinkDetailModel {
  const factory LinkDetailModel({
    required String id,
    required double dbm,
    @JsonKey(name: 'loss_db') required double lossDb,
    @JsonKey(name: 'distance_km') required double distanceKm,
    @JsonKey(name: 'azimuth_deg') required double azimuthDeg,
    required bool reachable,
    @JsonKey(name: 'itm_errno') @Default(0) int itmErrno,
    @Default([]) List<LinkProfilePointModel> profile,
  }) = _LinkDetailModel;

  factory LinkDetailModel.fromJson(Map<String, dynamic> json) =>
      _$LinkDetailModelFromJson(json);
}
