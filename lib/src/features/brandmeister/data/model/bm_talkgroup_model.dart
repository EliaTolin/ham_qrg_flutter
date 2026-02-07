import 'package:freezed_annotation/freezed_annotation.dart';

part 'bm_talkgroup_model.freezed.dart';
part 'bm_talkgroup_model.g.dart';

@freezed
abstract class BmTalkgroupModel with _$BmTalkgroupModel {
  const factory BmTalkgroupModel({
    required String talkgroup,
    required String slot,
    @JsonKey(name: 'repeaterid') required String repeaterId,
  }) = _BmTalkgroupModel;

  factory BmTalkgroupModel.fromJson(Map<String, dynamic> json) =>
      _$BmTalkgroupModelFromJson(json);
}
