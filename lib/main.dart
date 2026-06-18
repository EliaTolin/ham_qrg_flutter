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
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

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

  await _initRevenueCat();

  // Enable verbose logging for debugging (remove in production)
  await OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
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
      await revenueCatClient.login(currentUserId);
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
          unawaited(revenueCatClient.login(userId));
        }
      case AuthChangeEvent.signedOut:
        unawaited(revenueCatClient.logout());
      // ignore: no_default_cases
      default:
        break;
    }
  });
}
