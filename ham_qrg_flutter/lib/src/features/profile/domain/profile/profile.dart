import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/post_login_onboarding/domain/user_type.dart';

part 'profile.freezed.dart';

@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    required String id,
    required String name,
    required String surname,
    required String? callsign,
    required String? propic,
    UserType? userType,
  }) = _Profile;
}
