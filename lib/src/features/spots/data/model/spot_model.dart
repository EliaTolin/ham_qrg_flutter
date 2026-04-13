import 'package:freezed_annotation/freezed_annotation.dart';

part 'spot_model.freezed.dart';
part 'spot_model.g.dart';

@freezed
abstract class SpotModel with _$SpotModel {
  const factory SpotModel({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'repeater_id') required String repeaterId,
    @JsonKey(name: 'callsign_snapshot') required String callsignSnapshot,
    @JsonKey(name: 'started_at') required DateTime startedAt,
    @JsonKey(name: 'spotted_callsign') String? spottedCallsign,
    @JsonKey(name: 'access_id') String? accessId,
    @JsonKey(name: 'duration_minutes') int? durationMinutes,
    @JsonKey(name: 'expires_at') DateTime? expiresAt,
    @JsonKey(name: 'closed_at') DateTime? closedAt,
    @JsonKey(name: 'profiles') SpotProfileModel? profile,
    @JsonKey(name: 'repeaters') SpotRepeaterModel? repeater,
    @JsonKey(name: 'repeater_access') SpotAccessModel? access,
  }) = _SpotModel;

  factory SpotModel.fromJson(Map<String, dynamic> json) =>
      _$SpotModelFromJson(json);
}

@freezed
abstract class SpotProfileModel with _$SpotProfileModel {
  const factory SpotProfileModel({
    required String id,
    String? callsign,
    @JsonKey(name: 'first_name') String? firstName,
  }) = _SpotProfileModel;

  factory SpotProfileModel.fromJson(Map<String, dynamic> json) =>
      _$SpotProfileModelFromJson(json);
}

@freezed
abstract class SpotRepeaterModel with _$SpotRepeaterModel {
  const factory SpotRepeaterModel({
    required String id,
    String? callsign,
    String? name,
  }) = _SpotRepeaterModel;

  factory SpotRepeaterModel.fromJson(Map<String, dynamic> json) =>
      _$SpotRepeaterModelFromJson(json);
}

@freezed
abstract class SpotAccessModel with _$SpotAccessModel {
  const factory SpotAccessModel({
    required String id,
    required String mode,
  }) = _SpotAccessModel;

  factory SpotAccessModel.fromJson(Map<String, dynamic> json) =>
      _$SpotAccessModelFromJson(json);
}
