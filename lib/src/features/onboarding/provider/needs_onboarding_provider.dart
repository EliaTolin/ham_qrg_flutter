import 'package:hamqrg/src/features/onboarding/data/datasource/onboarding_local_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'needs_onboarding_provider.g.dart';

@riverpod
Future<bool> needsOnboarding(Ref ref) async {
  final datasource = await ref.watch(onboardingLocalDatasourceProvider.future);
  final completed = await datasource.hasCompletedOnboarding();
  return completed;
}
