import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:hamqrg/src/app.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
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

  await SentryFlutter.init(
    (options) {
      options
        ..dsn =
            'https://ac0e0ee4b693d04dc57ba63e8d1b5f29@o4508342166224896.ingest.de.sentry.io/4510584835342416'
        ..sendDefaultPii = true
        ..enableLogs = true
        ..tracesSampleRate = 1.0
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
