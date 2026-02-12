import 'package:hamqrg/src/features/profile/data/repository/profile_repository.dart';
import 'package:hamqrg/src/features/profile/domain/profile_with_picture/profile_with_picture.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_profile_with_picture_provider.g.dart';

@riverpod
Future<ProfileWithPicture> getProfileWithPicture(Ref ref, String userId) async {
  final repository = await ref.read(profileRepositoryProvider.future);
  final profile = await repository.getProfile(userId);
  if (profile.propic == null) {
    return ProfileWithPicture(profile: profile, propic: null);
  }
  final propic = await repository.getImagePropicUrl(profile.propic!);
  return ProfileWithPicture(profile: profile, propic: propic);
}
