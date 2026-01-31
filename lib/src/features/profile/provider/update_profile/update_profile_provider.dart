import 'package:hamqrg/src/features/profile/data/repository/profile_repository.dart';
import 'package:hamqrg/src/features/profile/domain/profile/profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_profile_provider.g.dart';

@riverpod
Future<void> updateProfile(Ref ref, Profile profile) async {
  final repository = await ref.read(profileRepositoryProvider.future);
  await repository.updateProfile(profile);
}
