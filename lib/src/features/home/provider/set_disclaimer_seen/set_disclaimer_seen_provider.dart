import 'package:hamqrg/src/features/home/data/repository/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'set_disclaimer_seen_provider.g.dart';

@riverpod
Future<void> setDisclaimerSeen(Ref ref) async {
  final repository = await ref.watch(homeRepositoryProvider.future);
  return repository.setDisclaimerSeen();
}
