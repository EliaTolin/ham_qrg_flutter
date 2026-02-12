import 'package:hamqrg/src/features/profile/data/repository/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_image_profile_provider.g.dart';

@riverpod
Future<String> getImageProfile(Ref ref, String path) async {
  final repository = await ref.read(profileRepositoryProvider.future);
  return repository.getImagePropicUrl(path);
}
