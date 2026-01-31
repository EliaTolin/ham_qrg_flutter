import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:hamqrg/src/features/profile/data/repository/profile_repository.dart';
import 'package:hamqrg/src/features/profile/domain/profile/profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_profile_provider.g.dart';

@riverpod
Future<Profile> getProfile(Ref ref) async {
  // Read all providers upfront before any async gaps
  final repositoryFuture = ref.read(profileRepositoryProvider.future);
  final userIdFuture = ref.read(getUserIdProvider.future);

  final repository = await repositoryFuture;
  final userId = await userIdFuture;

  if (userId == null) {
    throw Exception('User ID is null. Cannot fetch profile.');
  }
  return repository.getProfile(userId);
}
