import 'package:hamqrg/src/features/home/data/repository/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'set_telegram_group_member_provider.g.dart';

@riverpod
Future<void> setAlreadyInTelegramCommunity(Ref ref) async {
  final repository = await ref.watch(homeRepositoryProvider.future);
  return repository.setAlreadyInTelegramCommunity();
}
