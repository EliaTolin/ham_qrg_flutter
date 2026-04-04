import 'package:hamqrg/src/features/onboarding/data/repository/onboarding_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'needs_onboarding_provider.g.dart';

@riverpod
Future<bool> needsOnboarding(Ref ref) async {
  final repository = await ref.watch(onboardingRepositoryProvider.future);
  final completed = await repository.hasCompletedOnboarding();
  return !completed;
}
