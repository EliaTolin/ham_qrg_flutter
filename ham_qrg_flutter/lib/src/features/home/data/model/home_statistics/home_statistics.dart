import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_statistics.freezed.dart';
part 'home_statistics.g.dart';

@freezed
abstract class HomeStatisticsModel with _$HomeStatisticsModel {
  const factory HomeStatisticsModel({
    @JsonKey(name: 'total_repeaters') required int totalRepeaters,
    @JsonKey(name: 'favorites_count') required int favoritesCount,
  }) = _HomeStatisticsModel;

  factory HomeStatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$HomeStatisticsModelFromJson(json);
}
