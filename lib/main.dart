import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamqrg/clients/revenue_cat/impl/revenue_cat_client_impl.dart';
import 'package:hamqrg/clients/revenue_cat/revenue_cat_client.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:hamqrg/src/app.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:remote_caching/remote_caching.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  SentryWidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    Sentry.captureException(details.exception, stackTrace: details.stack);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    Sentry.captureException(error, stackTrace: stack);
    return true;
  };

  await Supabase.initialize(
    url: AppConfigs.getSupabaseUrl(),
    publishableKey: AppConfigs.getSupabaseKey(),
  );

  MapboxOptions.setAccessToken(AppConfigs.getMapboxAccessToken());

  await _initRemoteCaching();

  await _initRevenueCat();

  // `verbose` era acceso ovunque, release compresa, e sommergeva la console:
  // le righe che servono a capire un avvio andato storto — `[Splash]`,
  // `[Dashboard]` — finivano in mezzo a centinaia di righe del SDK push, che
  // di quell'avvio non dicono nulla. In debug restano gli avvisi veri, in
  // release non si stampa niente.
  await OneSignal.Debug.setLogLevel(
    kDebugMode ? OSLogLevel.warn : OSLogLevel.none,
  );
  // Initialize with your OneSignal App ID
  await OneSignal.initialize(AppConfigs.getOneSignalAppId());
  // Use this method to prompt for push notifications.
  // We recommend removing this method after testing and instead use In-App Messages to prompt for notification permission.
  await OneSignal.Notifications.requestPermission(false);

  await SentryFlutter.init(
    (options) {
      options
        ..dsn =
            'https://ac0e0ee4b693d04dc57ba63e8d1b5f29@o4508342166224896.ingest.de.sentry.io/4510584835342416'
        ..sendDefaultPii = true
        ..enableLogs = true
        ..tracesSampleRate = 1.0
        // ignore: experimental_member_use
        ..profilesSampleRate = 1.0;
    },
    appRunner: () {
      runApp(
        ProviderScope(
          retry: (retryCount, error) => null,
          child: SentryWidget(
            child: const HamQRG(),
          ),
        ),
      );
    },
  );
}

/// Initializes the shared repeater cache backing offline consultation of saved
/// coverage stations.
///
/// [RemoteCaching.init] also runs `DELETE FROM cache WHERE expires_at < now`,
/// which is exactly why every `repeater:` entry is written with the
/// never-expires sentinel: an expiring entry would be physically dropped here
/// on the next launch, taking a saved station's offline data with it.
///
/// The one-year `defaultCacheDuration` is defence in depth, not the real
/// expiry: should a write ever forget the sentinel, the entry survives a year
/// instead of the package default of one hour.
///
/// ## Why `databasePath` is passed explicitly
///
/// The package forces `databaseFactoryFfi` on every platform, so an omitted
/// path resolves through sqflite_common_ffi to
/// `./.dart_tool/sqflite_common_ffi/databases` — a development-tooling
/// location relative to the process working directory. On desktop and in
/// tests that happens to be writable; on iOS and Android it is not, so
/// creating it throws and the cache never initializes. Every later `call()`
/// then throws `StateError`, and saved stations lose their offline data
/// without a single visible error. The documents directory is the writable,
/// backed-up location this data belongs in.
///
/// Never throws: a cache failure must not block startup — offline consultation
/// degrades, the app still runs. It is reported, not hidden.
Future<void> _initRemoteCaching() async {
  try {
    final documents = await getApplicationDocumentsDirectory();
    await RemoteCaching.instance.init(
      databasePath: documents.path,
      defaultCacheDuration: const Duration(days: 365),
    );
  } catch (error, stackTrace) {
    await Sentry.captureException(error, stackTrace: stackTrace);
  }
}

/// Configures RevenueCat and keeps its customer linked to the Supabase user,
/// so Pro entitlements follow the account across devices and sessions.
///
/// Never throws: a misconfigured key must not block app startup — the failure
/// is reported and Pro simply stays unavailable.
Future<void> _initRevenueCat() async {
  final RevenueCatClient revenueCatClient = RevenueCatClientImpl();

  try {
    await revenueCatClient.configure();

    final currentUserId = Supabase.instance.client.auth.currentUser?.id;
    if (currentUserId != null) {
      await _linkRevenueCatIdentity(revenueCatClient, currentUserId);
    }

    if (kDebugMode) {
      // Startup snapshot of the Pro entitlement, for diagnostics.
      debugPrint('[RevenueCat] startup user=$currentUserId');
      await revenueCatClient.isPro();
    }
  } catch (error, stackTrace) {
    await Sentry.captureException(error, stackTrace: stackTrace);
    return;
  }

  // Keep RevenueCat in sync with future auth changes.
  Supabase.instance.client.auth.onAuthStateChange.listen((data) {
    final userId = data.session?.user.id;
    switch (data.event) {
      case AuthChangeEvent.signedIn:
      case AuthChangeEvent.userUpdated:
        if (userId != null) {
          unawaited(_linkRevenueCatIdentity(revenueCatClient, userId));
        }
      case AuthChangeEvent.signedOut:
        unawaited(revenueCatClient.logout());
      // ignore: no_default_cases
      default:
        break;
    }
  });
}

/// Links the RevenueCat customer to [userId] and attaches the user's email,
/// sequenced AFTER [RevenueCatClient.login] so the attribute lands on the
/// correct customer. Name/surname/callsign are pushed reactively once the
/// profile is loaded (see `syncRevenueCatAttributesProvider`).
Future<void> _linkRevenueCatIdentity(
  RevenueCatClient client,
  String userId,
) async {
  await client.login(userId);
  final email = Supabase.instance.client.auth.currentUser?.email;
  if (email != null && email.isNotEmpty) {
    await client.setUserAttributes(email: email);
  }
}
