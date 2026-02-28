import 'package:hamqrg/src/features/home/data/repository/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'need_to_show_disclaimer_provider.g.dart';

@riverpod
Future<bool> needToShowDisclaimer(Ref ref) async {
  final repository = await ref.watch(homeRepositoryProvider.future);
  return repository.needToShowDisclaimer();
}
