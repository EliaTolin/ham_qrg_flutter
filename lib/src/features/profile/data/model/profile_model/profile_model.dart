import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/post_login_onboarding/domain/user_type.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required String id,
    @JsonKey(name: 'first_name', defaultValue: '') required String firstName,
    @JsonKey(name: 'last_name', defaultValue: '') required String lastName,
    required String? callsign,
    required String? propic,
    @JsonKey(name: 'user_type') UserType? userType,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);
}
