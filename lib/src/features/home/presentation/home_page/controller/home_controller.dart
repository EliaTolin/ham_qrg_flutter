import 'package:hamqrg/src/features/home/presentation/home_page/controller/state/home_state.dart';
import 'package:hamqrg/src/features/home/provider/need_to_show_disclaimer/need_to_show_disclaimer_provider.dart';
import 'package:hamqrg/src/features/home/provider/need_to_show_telegram_invite/need_to_show_telegram_invite_provider.dart';
import 'package:hamqrg/src/features/home/provider/set_disclaimer_seen/set_disclaimer_seen_provider.dart';
import 'package:hamqrg/src/features/home/provider/set_last_telegram_invite_show/set_last_telegram_invite_show_provider.dart';
import 'package:hamqrg/src/features/home/provider/set_telegram_group_member/set_telegram_group_member_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<HomeState> build() async {
    final needToShowTelegram = await ref.read(needToShowTelegramInviteProvider.future);
    final needToShowDisclaimer = await ref.read(needToShowDisclaimerProvider.future);
    return HomeState(
      showTelegram: needToShowTelegram,
      showDisclaimer: needToShowDisclaimer,
      needToExtraConfig: false,
    );
  }

  Future<void> setTelegramGroupMember() async {
    await ref.read(setAlreadyInTelegramCommunityProvider.future);
  }

  Future<void> setTelegramInviteLastShownDate() async {
    final currentState = state.value;
    state = await AsyncValue.guard(() async {
      await ref.read(setLastTelegramInviteShowProvider.future);
      return currentState?.copyWith(showTelegram: false) ??
          const HomeState(
            showTelegram: false,
            showDisclaimer: false,
            needToExtraConfig: false,
          );
    });
  }

  Future<void> setDisclaimerSeen() async {
    final currentState = state.value;
    state = await AsyncValue.guard(() async {
      await ref.read(setDisclaimerSeenProvider.future);
      return currentState?.copyWith(showDisclaimer: false) ??
          const HomeState(
            showTelegram: false,
            showDisclaimer: false,
            needToExtraConfig: false,
          );
    });
  }
}
