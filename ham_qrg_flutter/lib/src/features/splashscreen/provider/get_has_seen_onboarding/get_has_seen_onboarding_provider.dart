import 'package:hamqrg/src/features/splashscreen/data/repository/splash_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_has_seen_onboarding_provider.g.dart';

@riverpod
Future<bool> getHasSeenOnboarding(Ref ref) async {
  final repository = await ref.watch(splashRepositoryProvider.future);
  return repository.hasSeenOnboarding();
}
