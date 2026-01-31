import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:hamqrg/clients/package_info/package_info.dart';
import 'package:hamqrg/common/utils/repeater_mode_helper.dart';
import 'package:hamqrg/common/utils/version_utils.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/authentication/provider/anonymous_signin/anonymous_signin_provider.dart';
import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:hamqrg/src/features/authentication/provider/is_anonymous/is_anonymous_provider.dart';
import 'package:hamqrg/src/features/params/provider/get_params/get_params_provider.dart';
import 'package:hamqrg/src/features/post_login_onboarding/provider/check_needs_onboarding/check_needs_onboarding_provider.dart';
import 'package:hamqrg/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/favorite_repeaters_notifier/favorite_repeaters_notifier.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeaters_nearby/get_repeaters_nearby_provider.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:hamqrg/src/features/splashscreen/errors/update_required_exception.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'splash_controller.g.dart';

@riverpod
class SplashController extends _$SplashController {
  @override
  Future<SplashAction?> build() async {
    try {
      final startWatch = Stopwatch()..start();
      var userId = await ref.read(getUserIdProvider.future);
      userId ??= await ref.read(anonymousSignInProvider.future);
      final packageInfo = await ref.read(packageInfoProvider.future);
      try {
        await _ensureMinimumVersion(packageInfo);
      } on UpdateRequiredException catch (error) {
        return SplashAction.showUpdateDialog(
          UpdateRequiredDialogData(
            appStoreId: AppConfigs.getAppStoreId(),
            playStorePackageName: packageInfo.packageName,
            installedVersion: error.installedVersion,
            minVersion: error.minVersion,
            fallbackRoute: const RepeatersMapRoute(),
          ),
        );
      }

      log('userId: $userId');
      _configureSentryUser(userId);

      // // Check if user is not anonymous and needs onboarding
      final isAnonymous = await ref.read(isAnonymousProvider.future);
      if (!isAnonymous) {
        final needsOnboarding = await ref.read(checkNeedsPostLoginOnboardingProvider.future);
        if (needsOnboarding) {
          return const SplashAction.navigate(PostLoginOnboardingRoute());
        }
      }

      await _prefetchDashboardData();
      log('SplashController build: ${startWatch.elapsed}');
      return const SplashAction.navigate(HomeRoute());
    } catch (error, stackTrace) {
      await Sentry.captureException(error, stackTrace: stackTrace);
      return const SplashAction.navigate(RepeatersMapRoute());
    }
  }

  /// Prefetch all data the dashboard controller will need.
  /// Results are discarded — this only warms the provider and HTTP caches.
  Future<void> _prefetchDashboardData() async {
    try {
      await Future.wait([
        ref.read(favoriteRepeatersProvider.future),
        ref.read(getProfileProvider.future),
      ]);
      log('Dashboard prefetch: favorites, count, profile done');

      // Location + nearby repeaters
      final position = await ref.read(locationServiceProvider).getCurrentPositionOrDefault();
      final repeatersNearby = await ref.read(
        getRepeatersNearbyProvider(
          latitude: position.latitude,
          longitude: position.longitude,
        ).future,
      );
      // Pre-generate all icon combinations
      for (final repeater in repeatersNearby) {
        final accessModes = repeater.accesses.map((e) => e.mode).toSet().toList();
        await RepeaterModeHelper.generateRepeaterIconWithAccessModes(accessModes);
      }
      log('Dashboard prefetch: nearby repeaters done');
    } catch (e) {
      log('Dashboard prefetch failed: $e');
    }
  }

  Future<void> _ensureMinimumVersion(PackageInfo packageInfo) async {
    final installedVersion = packageInfo.version;
    final minVersionKey = Platform.isIOS ? 'min_version_app_store' : 'min_version_play_store';

    try {
      final minVersionParam = await ref.read(getParamByKeyProvider(minVersionKey).future);
      if (minVersionParam == null) return;

      final minVersion = minVersionParam.value;
      if (isVersionOutdated(installedVersion, minVersion)) {
        log('Versione installata ($installedVersion) è inferiore alla minima richiesta ($minVersion)');
        throw UpdateRequiredException(
          minVersion: minVersion,
          installedVersion: installedVersion,
        );
      }
    } on UpdateRequiredException {
      rethrow;
    } catch (error, stackTrace) {
      log('Errore durante il controllo versione: $error');
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
