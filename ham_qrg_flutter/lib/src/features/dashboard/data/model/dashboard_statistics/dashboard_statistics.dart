import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_statistics.freezed.dart';
part 'dashboard_statistics.g.dart';

@freezed
abstract class DashboardStatisticsModel with _$DashboardStatisticsModel {
  const factory DashboardStatisticsModel({
    @JsonKey(name: 'total_repeaters') required int totalRepeaters,
    @JsonKey(name: 'favorites_count') required int favoritesCount,
  }) = _DashboardStatisticsModel;

  factory DashboardStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardStatisticsModelFromJson(json);
}
