import 'package:ham_qrg/common/service/image_caching/image_caching_service/image_caching_service.dart';
import 'package:ham_qrg/src/features/authentication/data/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_provider.g.dart';

@riverpod
Future<void> logout(Ref ref) async {
  final imageService = await ref.read(imageCachingServiceProvider.future);
  await imageService.deleteAllCachedImages();
  final authRepository = await ref.read(authRepositoryProvider.future);
  await authRepository.logout();
  // I need to sign in again as anonymous
  await authRepository.anonymousSignIn();
}
