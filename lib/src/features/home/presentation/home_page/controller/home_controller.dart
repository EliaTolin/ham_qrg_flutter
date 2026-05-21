import 'package:hamqrg/log/talker_service/talker_service.dart';
import 'package:hamqrg/src/features/home/presentation/home_page/controller/state/home_state.dart';
import 'package:hamqrg/src/features/home/provider/need_to_show_telegram_invite/need_to_show_telegram_invite_provider.dart';
import 'package:hamqrg/src/features/home/provider/set_last_telegram_invite_show/set_last_telegram_invite_show_provider.dart';
import 'package:hamqrg/src/features/home/provider/set_telegram_group_member/set_telegram_group_member_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<HomeState> build() async {
    final talker = ref.read(talkerServiceProvider);
    try {
      talker.info('[Home] build() start');
      final needToShowTelegram =
          await ref.read(needToShowTelegramInviteProvider.future);
      talker.info('[Home] needToShowTelegram: $needToShowTelegram');
      return HomeState(
        showTelegramRePrompt: needToShowTelegram,
        needToExtraConfig: false,
      );
    } catch (error, stackTrace) {
      talker.handle(error, stackTrace, '[Home] build() failed');
      rethrow;
    }
  }

  Future<void> setTelegramGroupMember() async {
    await ref.read(setAlreadyInTelegramCommunityProvider.future);
  }

  Future<void> setTelegramInviteLastShownDate() async {
    final currentState = state.value;
    state = await AsyncValue.guard(() async {
      await ref.read(setLastTelegramInviteShowProvider.future);
      return currentState?.copyWith(showTelegramRePrompt: false) ??
          const HomeState(
            showTelegramRePrompt: false,
            needToExtraConfig: false,
          );
    });
  }
}
