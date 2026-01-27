import 'package:hamqrg/src/features/splashscreen/data/repository/splash_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'set_onboarding_seen_provider.g.dart';

@riverpod
Future<void> setOnboardingSeen(Ref ref) async {
  final repository = await ref.watch(splashRepositoryProvider.future);
  return repository.setOnboardingSeen();
}
