import 'package:hamqrg/src/features/home/data/repository/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'need_to_show_telegram_invite_provider.g.dart';

/// Returns true only for the Day-7 re-prompt scenario:
/// User completed onboarding, declined Telegram, and 7+ days have passed.
@riverpod
Future<bool> needToShowTelegramInvite(Ref ref) async {
  final repository = await ref.watch(homeRepositoryProvider.future);
  return repository.needToShowTelegramRePrompt();
}
