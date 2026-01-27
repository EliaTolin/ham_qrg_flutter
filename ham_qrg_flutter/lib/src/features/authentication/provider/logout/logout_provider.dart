import 'package:hamqrg/common/service/image_caching/image_caching_service/image_caching_service.dart';
import 'package:hamqrg/src/features/authentication/data/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_provider.g.dart';

@riverpod
Future<void> logout(Ref ref) async {
  // Read all providers upfront before any async gaps
  final imageService = await ref.read(imageCachingServiceProvider.future);
  final authRepository = await ref.read(authRepositoryProvider.future);

  // Now perform async operations without using ref
  await imageService.deleteAllCachedImages();
  await authRepository.logout();
  // Sign in again as anonymous
  await authRepository.anonymousSignIn();
}
