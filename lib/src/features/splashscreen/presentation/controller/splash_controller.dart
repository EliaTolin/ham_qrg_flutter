import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:hamqrg/clients/package_info/package_info.dart';
import 'package:hamqrg/common/utils/repeater_mode_helper.dart';
import 'package:hamqrg/common/utils/version_utils.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:hamqrg/log/talker_service/talker_service.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/authentication/provider/anonymous_signin/anonymous_signin_provider.dart';
import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:hamqrg/src/features/authentication/provider/is_anonymous/is_anonymous_provider.dart';
import 'package:hamqrg/src/features/onboarding/provider/needs_onboarding_provider.dart';
import 'package:hamqrg/src/features/params/provider/get_params/get_params_provider.dart';
import 'package:hamqrg/src/features/post_login_onboarding/provider/check_needs_onboarding/check_needs_onboarding_provider.dart';
import 'package:hamqrg/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/favorite_repeaters_notifier/favorite_repeaters_notifier.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeaters_nearby/get_repeaters_nearby_provider.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:hamqrg/src/features/splashscreen/errors/update_required_exception.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'splash_controller.g.dart';

@riverpod
class SplashController extends _$SplashController {
  Talker get _talker => ref.read(talkerServiceProvider);

  @override
  Future<SplashAction?> build() async {
    final talker = _talker;
    try {
      final startWatch = Stopwatch()..start();
      talker.info('[Splash] build() start');

      var userId = await ref.read(getUserIdProvider.future);
      if (userId == null) {
        talker.info('[Splash] step: anonymousSignIn');
        userId = await ref.read(anonymousSignInProvider.future);
      }
      talker.info('[Splash] userId resolved: $userId');

      if (userId != null) {
        talker.info('[Splash] step: OneSignal.login');
        await OneSignal.login(userId);
      }

      talker.info('[Splash] step: packageInfo');
      final packageInfo = await ref.read(packageInfoProvider.future);

      try {
        talker.info('[Splash] step: ensureMinimumVersion');
        await _ensureMinimumVersion(packageInfo);
      } on UpdateRequiredException catch (error) {
        talker.warning(
          '[Splash] update required: '
          '${error.installedVersion} < ${error.minVersion}',
        );
        return SplashAction.showUpdateDialog(
          UpdateRequiredDialogData(
            appStoreId: AppConfigs.getAppStoreId(),
            playStorePackageName: packageInfo.packageName,
            installedVersion: error.installedVersion,
            minVersion: error.minVersion,
            fallbackRoute: const HomeRoute(),
          ),
        );
      }

      _configureSentryUser(userId);

      // Check if first-launch onboarding is needed (for all users)
      talker.info('[Splash] step: needsOnboarding');
      final needsFirstLaunchOnboarding = await ref.read(needsOnboardingProvider.future);
      if (needsFirstLaunchOnboarding) {
        talker.info('[Splash] -> OnboardingRoute');
        return const SplashAction.navigate(OnboardingRoute());
      }

      // Check if user is not anonymous and needs post-login onboarding
      talker.info('[Splash] step: isAnonymous');
      final isAnonymous = await ref.read(isAnonymousProvider.future);
      if (!isAnonymous) {
        talker.info('[Splash] step: checkNeedsPostLoginOnboarding');
        final needsOnboarding = await ref.read(checkNeedsPostLoginOnboardingProvider.future);
        if (needsOnboarding) {
          talker.info('[Splash] -> PostLoginOnboardingRoute');
          return const SplashAction.navigate(PostLoginOnboardingRoute());
        }
      }

      talker.info('[Splash] step: prefetchDashboardData');
      await _prefetchDashboardData();
      talker.info(
        '[Splash] build() done in ${startWatch.elapsed} -> HomeRoute',
      );
      return const SplashAction.navigate(HomeRoute());
    } catch (error, stackTrace) {
      // Errors must NEVER be silent: log to Talker + Sentry and rethrow so
      // the UI can show a proper error state with a retry button.
      talker.handle(error, stackTrace, '[Splash] build() failed');
      await Sentry.captureException(error, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Prefetch all data the dashboard controller will need.
  /// Results are discarded — this only warms the provider and HTTP caches.
  Future<void> _prefetchDashboardData() async {
    final talker = _talker;
    try {
      talker.info('[Splash] prefetch: favorites + profile');
      await Future.wait([
        ref.read(favoriteRepeatersProvider.future),
        ref.read(getProfileProvider.future),
      ]);

      // Location + nearby repeaters
      talker.info('[Splash] prefetch: currentPosition');
      final position = await ref.read(locationServiceProvider).getCurrentPositionOrDefault();
      talker.info(
        '[Splash] prefetch: repeatersNearby '
        '(${position.latitude}, ${position.longitude})',
      );
      final repeatersNearby = await ref.read(
        getRepeatersNearbyProvider(
          latitude: position.latitude,
          longitude: position.longitude,
        ).future,
      );
      // Pre-generate all icon combinations
      for (final repeater in repeatersNearby) {
        final accessModes = repeater.accesses.map((e) => e.mode).toSet().toList();
        await RepeaterModeHelper.generateRepeaterIconWithAccessModes(
          accessModes,
        );
      }
      talker.info('[Splash] prefetch: done');
    } catch (error, stackTrace) {
      // Prefetch failures are non-fatal: report but do not block.
      talker.handle(error, stackTrace, '[Splash] prefetch failed');
      unawaited(
        Sentry.captureException(error, stackTrace: stackTrace),
      );
    }
  }

  Future<void> _ensureMinimumVersion(PackageInfo packageInfo) async {
    final talker = _talker;
    final installedVersion = packageInfo.version;
    final minVersionKey = Platform.isIOS ? 'min_version_app_store' : 'min_version_play_store';

    try {
      final minVersionParam = await ref.read(getParamByKeyProvider(minVersionKey).future);
      if (minVersionParam == null) return;

      final minVersion = minVersionParam.value;
      if (isVersionOutdated(installedVersion, minVersion)) {
        talker.warning(
          '[Splash] installed version ($installedVersion) '
          'is lower than required ($minVersion)',
        );
        throw UpdateRequiredException(
          minVersion: minVersion,
          installedVersion: installedVersion,
        );
      }
    } on UpdateRequiredException {
      rethrow;
    } catch (error, stackTrace) {
      talker.handle(error, stackTrace, '[Splash] minVersion check failed');
      await Sentry.captureException(error, stackTrace: stackTrace);
    }
  }

  void _configureSentryUser(String? userId) {
    if (userId == null) return;
    Sentry.configureScope((scope) => scope.setUser(SentryUser(id: userId)));
  }

  void clearAction() {
    state = const AsyncValue.data(null);
  }
}

class SplashAction {
  const SplashAction._({
    this.route,
    this.updateDialogData,
  });

  const SplashAction.navigate(PageRouteInfo route)
      : this._(
          route: route,
        );

  const SplashAction.showUpdateDialog(UpdateRequiredDialogData dialogData)
      : this._(
          updateDialogData: dialogData,
        );

  final PageRouteInfo? route;
  final UpdateRequiredDialogData? updateDialogData;

  SplashActionType get type =>
      route != null ? SplashActionType.navigate : SplashActionType.updateDialog;
}

enum SplashActionType {
  navigate,
  updateDialog,
}

class UpdateRequiredDialogData {
  const UpdateRequiredDialogData({
    required this.appStoreId,
    required this.playStorePackageName,
    required this.minVersion,
    required this.installedVersion,
    required this.fallbackRoute,
  });

  final String appStoreId;
  final String playStorePackageName;
  final String minVersion;
  final String installedVersion;
  final PageRouteInfo fallbackRoute;
}
