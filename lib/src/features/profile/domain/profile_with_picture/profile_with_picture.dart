import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/profile/domain/profile/profile.dart';

part 'profile_with_picture.freezed.dart';

@freezed
abstract class ProfileWithPicture with _$ProfileWithPicture {
  const factory ProfileWithPicture({
    required Profile profile,
    required String? propic,
  }) = _ProfileWithPicture;
}
