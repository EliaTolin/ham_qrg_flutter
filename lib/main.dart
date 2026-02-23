import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    anonKey: AppConfigs.getSupabaseKey(),
  );

  MapboxOptions.setAccessToken(AppConfigs.getMapboxAccessToken());

  // Enable verbose logging for debugging (remove in production)
  await OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  // Initialize with your OneSignal App ID
  OneSignal.initialize(AppConfigs.getOneSignalAppId());
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
