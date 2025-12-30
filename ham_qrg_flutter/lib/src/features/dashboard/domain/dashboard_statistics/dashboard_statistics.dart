import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_statistics.freezed.dart';

@freezed
abstract class DashboardStatistics with _$DashboardStatistics {
  const factory DashboardStatistics({
    required int totalRepeaters,
    required int? favoritesCount,
  }) = _DashboardStatistics;
}
