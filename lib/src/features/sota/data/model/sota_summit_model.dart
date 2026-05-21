import 'package:freezed_annotation/freezed_annotation.dart';

part 'sota_summit_model.freezed.dart';
part 'sota_summit_model.g.dart';

@freezed
abstract class SotaSummitModel with _$SotaSummitModel {
  const factory SotaSummitModel({
    required String summitCode,
    required String name,
    required String associationName,
    required String associationCode,
    required String regionName,
    required String regionCode,
    required double latitude,
    required double longitude,
    required int altM,
    required int altFt,
    required int points,
    required String locator,
    required String validFrom,
    required String validTo,
    required bool valid,
    required bool restrictionMask,
    @Default(<String>[]) List<String> restrictionList,
    String? notes,
    String? gridRef1,
    String? gridRef2,
  }) = _SotaSummitModel;

  factory SotaSummitModel.fromJson(Map<String, dynamic> json) =>
      _$SotaSummitModelFromJson(json);
}
