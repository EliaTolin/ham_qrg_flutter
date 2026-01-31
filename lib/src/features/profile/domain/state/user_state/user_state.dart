import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/profile/domain/profile/profile.dart';

part 'user_state.freezed.dart';

@freezed
abstract class UserState with _$UserState {
  factory UserState({
    required Profile profile,
    required String? email,
    required String? imageProfileUrl,
    required bool isAnonymous,
  }) = _UserState;
}
