import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:ham_qrg/clients/package_info/package_info.dart';
import 'package:ham_qrg/common/utils/version_utils.dart';
import 'package:ham_qrg/config/app_configs.dart';
import 'package:ham_qrg/router/app_router.dart';
import 'package:ham_qrg/src/features/authentication/provider/anonymous_signin/anonymous_signin_provider.dart';
import 'package:ham_qrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:ham_qrg/src/features/params/provider/get_params/get_params_provider.dart';
import 'package:ham_qrg/src/features/splashscreen/errors/update_required_exception.dart';
import 'package:ham_qrg/src/features/splashscreen/provider/get_has_seen_onboarding/get_has_seen_onboarding_provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'splash_controller.g.dart';

@riverpod
class SplashController extends _$SplashController {
  @override
  Future<SplashAction?> build() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final hasSeenOnboarding = await ref.read(getHasSeenOnboardingProvider.future);
      var userId = await ref.read(getUserIdProvider.future);
      userId ??= await ref.read(anonymousSignInProvider.future);
      final targetRoute = hasSeenOnboarding ? const HomeRoute() : const OnboardingRoute();
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

      return SplashAction.navigate(targetRoute);
    } catch (error, stackTrace) {
      await Sentry.captureException(error, stackTrace: stackTrace);
      return const SplashAction.navigate(RepeatersMapRoute());
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
