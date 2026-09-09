import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:hamqrg/clients/package_info/package_info.dart';
import 'package:hamqrg/common/provider/offline_status_notifier/offline_status_notifier.dart';
import 'package:hamqrg/common/service/in_app_rating/in_app_rating_service.dart';
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
import 'package:hamqrg/src/features/repeaters/provider/get_total_repeaters_count/get_total_repeaters_count_provider.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:hamqrg/src/features/splashscreen/errors/update_required_exception.dart';
import 'package:hamqrg/src/features/subscriptions/provider/is_pro/is_pro_provider.dart';
import 'package:hamqrg/src/features/subscriptions/provider/offline_cache_lifecycle/offline_cache_lifecycle_provider.dart';
import 'package:hamqrg/src/features/subscriptions/provider/sync_revenue_cat_attributes/sync_revenue_cat_attributes_provider.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'splash_controller.g.dart';

@riverpod
class SplashController extends _$SplashController {
  /// Remote steps must never block the splash: offline (no timeout on the
  /// Supabase HTTP client) a request can hang for minutes.
  static const _networkStepTimeout = Duration(seconds: 4);
  static const _prefetchTimeout = Duration(seconds: 6);

  Talker get _talker => ref.read(talkerServiceProvider);

  @override
  Future<SplashAction?> build() async {
    final talker = _talker;
    try {
      talker.info('[Splash] build() start');
      final startWatch = Stopwatch()..start();

      // Conta l'avvio: è il segnale su cui si decide se e quando chiedere la
      // recensione (vedi InAppRatingService). Non blocca nulla e non lancia.
      await ref.read(inAppRatingServiceProvider).registerAppLaunch();

      // Resolve connectivity and entitlement BEFORE any data call: the cached
      // datasources read both flags synchronously (`.value ?? false`), so an
      // unresolved stream would make the very first fetches run as
      // "free & online" — bypassing the offline cache — and their failure
      // would stick (repositories read datasources with `ref.read`, so a
      // later flag flip re-triggers nothing).
      talker.info('[Splash] step: resolveOfflineFlags');
      // Listener attivi (il controller è osservato dalla pagina): senza,
      // Riverpod 3 non farebbe nemmeno partire lo stream e `.future` sotto
      // scadrebbe sempre — vedi test/is_pro_provider_test.dart.
      ref
        ..listen(isProProvider, (_, __) {})
        ..listen(offlineStatusProvider, (_, __) {});
      try {
        // 6s: il probe di raggiungibilità interno dura fino a 3s — l'attesa
        // qui deve essere più lunga, altrimenti scade un attimo prima del
        // probe e i primi datasource nascono con lo stato sbagliato.
        await ref
            .read(offlineStatusProvider.future)
            .timeout(const Duration(seconds: 6));
      } catch (_) {
        talker.warning('[Splash] connectivity check not resolved — skipped');
      }
      try {
        // First emission is bounded internally (live check capped at 5s with
        // fallback on the persisted entitlement).
        await ref
            .read(isProProvider.future)
            .timeout(const Duration(seconds: 7));
      } catch (_) {
        talker.warning('[Splash] entitlement check not resolved — skipped');
      }

      // Offline (backend irraggiungibile secondo il probe): ogni passo di
      // rete della splash è inutile e costerebbe il suo timeout — si salta
      // tutto e si arriva alla home, che serve i dati dalla cache.
      final isOffline = ref.read(offlineStatusProvider).value ?? false;
      if (isOffline) {
        talker.info('[Splash] offline: skipping network steps');
      }

      var userId = await ref.read(getUserIdProvider.future);
      if (userId == null && !isOffline) {
        talker.info('[Splash] step: anonymousSignIn');
        // Il riferimento alla richiesta si tiene: `timeout` ferma l'attesa,
        // non la richiesta, e ciò che succede dopo conta (vedi sotto).
        final signIn = ref.read(anonymousSignInProvider.future);
        // Vale per questa build soltanto: se la splash viene smontata prima
        // che il login arrivi, il seguito trova la porta chiusa invece di
        // invalidare attraverso un `Ref` che non esiste più.
        var stale = false;
        ref.onDispose(() => stale = true);
        try {
          // Era l'ultimo passo di rete della splash senza limite di tempo, e
          // il client Supabase non ne ha uno suo: con la rete su ma il backend
          // irraggiungibile (captive portal, DNS che non risponde) l'attesa
          // teneva ferma la splash per minuti.
          userId = await signIn.timeout(_networkStepTimeout);
          _refreshAuthDependentProviders();
        } catch (error, stackTrace) {
          // Senza sessione si parte lo stesso: le pagine mostrano il loro
          // errore con il riprova, e il prossimo avvio ritenta. Fermare qui
          // l'avvio sarebbe il danno peggiore fra i due.
          talker.warning('[Splash] anonymousSignIn skipped: $error');
          unawaited(Sentry.captureException(error, stackTrace: stackTrace));
          // Il caso peggiore non è il login fallito: è il login **riuscito in
          // ritardo**. Il timeout ha mollato l'attesa, ma la richiesta va
          // avanti e la sessione Supabase nasce lo stesso — solo dopo. Senza
          // questo seguito le invalidazioni non verrebbero eseguite mai:
          // l'app resterebbe con una sessione attiva e `getUserIdProvider`
          // congelato sul `null` letto prima, cioè lo stato peggiore dei tre
          // (peggio del login fallito, perché nessuno ritenta).
          unawaited(
            signIn.then<void>(
              (_) {
                if (stale) return;
                talker
                    .info('[Splash] anonymousSignIn landed late — refreshing');
                _refreshAuthDependentProviders();
              },
              // Già segnalato sopra: qui interessa solo il caso riuscito.
              onError: (Object _) {},
            ),
          );
        }
      }
      talker.info('[Splash] userId resolved: $userId');

      // Mount the reactive RevenueCat attribute sync (keepAlive) and the
      // Pro-lapse watcher ONLY NOW: the sync watches getProfileProvider, so
      // mounting it earlier would build the whole profile chain either as
      // "free & online" (flags unresolved: no cache, bare 6s timeout) or
      // without a session at all (first install) and — being keepAlive —
      // freeze that error for the entire session.
      ref
        ..read(syncRevenueCatAttributesProvider)
        ..read(offlineCacheLifecycleProvider);

      if (userId != null && !isOffline) {
        talker.info('[Splash] step: OneSignal.login');
        try {
          await OneSignal.login(userId).timeout(_networkStepTimeout);
        } catch (error) {
          // Push login must never block startup (offline, OneSignal outage).
          talker.warning('[Splash] OneSignal.login skipped: $error');
        }
      }

      talker.info('[Splash] step: packageInfo');
      final packageInfo = await ref.read(packageInfoProvider.future);

      try {
        if (!isOffline) {
          talker.info('[Splash] step: ensureMinimumVersion');
          await _ensureMinimumVersion(packageInfo);
        }
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
      final needsFirstLaunchOnboarding =
          await ref.read(needsOnboardingProvider.future);
      if (needsFirstLaunchOnboarding) {
        talker.info('[Splash] -> OnboardingRoute');
        return const SplashAction.navigate(OnboardingRoute());
      }

      // Check if user is not anonymous and needs post-login onboarding
      talker.info('[Splash] step: isAnonymous');
      final isAnonymous = await ref.read(isAnonymousProvider.future);
      if (!isAnonymous && !isOffline) {
        talker.info('[Splash] step: checkNeedsPostLoginOnboarding');
        try {
          final needsOnboarding = await ref
              .read(checkNeedsPostLoginOnboardingProvider.future)
              .timeout(_networkStepTimeout);
          if (needsOnboarding) {
            talker.info('[Splash] -> PostLoginOnboardingRoute');
            return const SplashAction.navigate(PostLoginOnboardingRoute());
          }
        } on TimeoutException {
          talker.warning(
            '[Splash] postLogin onboarding check timed out — skipped',
          );
        } catch (error, stackTrace) {
          // Offline the profile fetch fails: skip instead of blocking the
          // app — the check runs again at the next launch.
          talker.handle(
            error,
            stackTrace,
            '[Splash] postLogin onboarding check failed — skipped',
          );
          unawaited(Sentry.captureException(error, stackTrace: stackTrace));
        }
      }

      talker.info('[Splash] step: prefetchDashboardData');
      await _prefetchDashboardData().timeout(
        _prefetchTimeout,
        onTimeout: () =>
            talker.warning('[Splash] prefetch timed out — continuing'),
      );
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

  /// Rilegge tutto ciò che dipende dalla sessione.
  ///
  /// La sessione anonima nasce DOPO che `getUserIdProvider` ha già risolto
  /// `null`: senza invalidare, ogni provider auth-dipendente resta congelato
  /// su quel `null` (`getProfile` lancia «User ID is null») per tutta la
  /// sessione — al primo avvio dopo l'installazione la pagina profilo va in
  /// errore fino al riavvio dell'app.
  void _refreshAuthDependentProviders() {
    ref
      ..invalidate(getUserIdProvider)
      ..invalidate(isAnonymousProvider)
      ..invalidate(getProfileProvider)
      ..invalidate(checkNeedsPostLoginOnboardingProvider);
  }

  /// Prefetch all data the dashboard controller will need.
  /// Results are discarded — this only warms the provider and HTTP caches.
  Future<void> _prefetchDashboardData() async {
    final talker = _talker;
    try {
      // Il conteggio totale sta qui perché è sul percorso critico della home
      // — il controller lo aspetta prima di poter disegnare — ed era l'unica
      // delle sue quattro letture che nessuno precaricava: da solo teneva la
      // home sullo spinner un quarto di secondo dopo che tutto il resto era
      // già pronto.
      talker.info('[Splash] prefetch: favorites + profile + count');
      await Future.wait([
        ref.read(favoriteRepeatersProvider.future),
        ref.read(getProfileProvider.future),
        ref.read(getTotalRepeatersCountProvider.future),
      ]);

      // Location + nearby repeaters
      talker.info('[Splash] prefetch: currentPosition');
      final position =
          await ref.read(locationServiceProvider).getCurrentPositionOrDefault();
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
      // Warm the list-tab variant too (100 km radius → different cache key)
      // so Pro users get an offline-ready list even if they never open the
      // tab while online. Quiet: a failure must not abort the prefetch.
      if (ref.read(isProProvider).value ?? false) {
        await ref
            .read(
              getRepeatersNearbyProvider(
                latitude: position.latitude,
                longitude: position.longitude,
                radiusKm: 100,
              ).future,
            )
            .then<void>((_) {}, onError: (Object _) {});
      }
      // Pre-generate all icon combinations
      for (final repeater in repeatersNearby) {
        final accessModes =
            repeater.accesses.map((e) => e.mode).toSet().toList();
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
    final minVersionKey =
        Platform.isIOS ? 'min_version_app_store' : 'min_version_play_store';

    try {
      final minVersionParam = await ref
          .read(getParamByKeyProvider(minVersionKey).future)
          .timeout(_networkStepTimeout);
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
    } on TimeoutException {
      // Offline: the check is skipped, not blocking — it runs again online.
      talker.warning('[Splash] minVersion check timed out — skipped');
    } catch (error, stackTrace) {
      talker.handle(error, stackTrace, '[Splash] minVersion check failed');
      unawaited(Sentry.captureException(error, stackTrace: stackTrace));
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
