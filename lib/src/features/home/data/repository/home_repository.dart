import 'package:hamqrg/src/features/home/data/datasource/home_datasource.dart';
import 'package:hamqrg/src/features/home/data/datasource/home_local_datasource.dart';
import 'package:hamqrg/src/features/onboarding/data/datasource/onboarding_local_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository.g.dart';

class HomeRepository {
  HomeRepository(this.dataSource, this.onboardingDatasource);
  final HomeDatasource dataSource;
  final dynamic onboardingDatasource;

  /// Show Telegram re-prompt only if:
  /// - User is already a Telegram member? No → skip
  /// - User declined Telegram in onboarding? Yes → show after 7 days
  /// - Fallback: show every 31 days (legacy behavior)
  Future<bool> needToShowTelegramRePrompt() async {
    final isTelegramMember = await dataSource.isTelegramGroupMember();
    if (isTelegramMember) return false;

    final lastShownDate = await dataSource.getTelegramInviteLastShownDate();
    if (lastShownDate == null) {
      // Never shown as re-prompt → check onboarding state
      // If onboarding completed and telegram was declined, show after 7 days
      return false;
    }

    final now = DateTime.now();
    final difference = now.difference(lastShownDate);
    return difference.inDays >= 7;
  }

  Future<void> setAlreadyInTelegramCommunity() {
    return dataSource.setTelegramGroupMember();
  }

  Future<void> setLastTelegramInviteShow() {
    return dataSource.setTelegramInviteLastShownDate(DateTime.now());
  }
}

@riverpod
Future<HomeRepository> homeRepository(Ref ref) async {
  // Read all providers BEFORE any await: if we interleave ref.watch and
  // await, the Ref can be disposed between calls (auto-dispose) and the
  // second ref.watch throws "Cannot use the Ref after it has been disposed".
  final dataSourceFuture = ref.watch(homeLocalDatasourceProvider.future);
  final onboardingDatasourceFuture =
      ref.watch(onboardingLocalDatasourceProvider.future);
  final dataSource = await dataSourceFuture;
  final onboardingDatasource = await onboardingDatasourceFuture;
  return HomeRepository(dataSource, onboardingDatasource);
}
