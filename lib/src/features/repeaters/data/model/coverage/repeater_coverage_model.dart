import 'package:freezed_annotation/freezed_annotation.dart';

part 'repeater_coverage_model.freezed.dart';
part 'repeater_coverage_model.g.dart';

@freezed
abstract class CoverageBoundsModel with _$CoverageBoundsModel {
  const factory CoverageBoundsModel({
    required double north,
    required double south,
    required double east,
    required double west,
  }) = _CoverageBoundsModel;

  factory CoverageBoundsModel.fromJson(Map<String, dynamic> json) =>
      _$CoverageBoundsModelFromJson(json);
}

@freezed
abstract class CoverageSizeModel with _$CoverageSizeModel {
  const factory CoverageSizeModel({
    required int width,
    required int height,
  }) = _CoverageSizeModel;

  factory CoverageSizeModel.fromJson(Map<String, dynamic> json) =>
      _$CoverageSizeModelFromJson(json);
}

@freezed
abstract class CoverageLegendStopModel with _$CoverageLegendStopModel {
  const factory CoverageLegendStopModel({
    required double dbm,
    required String color,
  }) = _CoverageLegendStopModel;

  factory CoverageLegendStopModel.fromJson(Map<String, dynamic> json) =>
      _$CoverageLegendStopModelFromJson(json);
}

@freezed
abstract class RepeaterCoverageModel with _$RepeaterCoverageModel {
  const factory RepeaterCoverageModel({
    required CoverageBoundsModel bounds,
    required CoverageSizeModel size,
    @Default([]) List<CoverageLegendStopModel> legend,
    @JsonKey(name: 'image_url') String? imageUrl,
    String? image,
    @Default(false) bool cached,
    String? source,
  }) = _RepeaterCoverageModel;

  factory RepeaterCoverageModel.fromJson(Map<String, dynamic> json) =>
      _$RepeaterCoverageModelFromJson(json);
}
