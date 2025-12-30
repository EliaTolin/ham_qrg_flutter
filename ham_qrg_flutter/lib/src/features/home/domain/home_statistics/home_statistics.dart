import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_statistics.freezed.dart';

@freezed
abstract class HomeStatistics with _$HomeStatistics {
  const factory HomeStatistics({
    required int totalRepeaters,
    required int favoritesCount,
  }) = _HomeStatistics;
}

