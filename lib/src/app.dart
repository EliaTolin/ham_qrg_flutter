import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamqrg/common/provider/offline_status_notifier/offline_status_notifier.dart';
import 'package:hamqrg/common/service/messaging/cluster_spot_notification_handler.dart';
import 'package:hamqrg/l10n/app_localizations.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/profile/provider/locale_notifier/locale_notifier.dart';
import 'package:hamqrg/src/features/profile/provider/theme_mode_notifier/theme_mode_notifier.dart';
import 'package:hamqrg/src/features/subscriptions/provider/is_pro/is_pro_provider.dart';
import 'package:hamqrg/themes/app_theme.dart';

class HamQRG extends ConsumerStatefulWidget {
  const HamQRG({super.key});

  @override
  ConsumerState<HamQRG> createState() => _HamQRGState();
}

class _HamQRGState extends ConsumerState<HamQRG> {
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = ref.read(appRouterProvider);
    setupClusterSpotNotificationHandlers(_appRouter);
  }

  @override
  Widget build(BuildContext context) {
    // Riverpod 3 sospende i provider privi di un listener ATTIVO: lo stream
    // dell'entitlement non emetterebbe nemmeno il primo valore, `.future`
    // resterebbe appeso e ogni lettura sincrona (`.value ?? false`) darebbe
    // "free" — i datasource nascerebbero senza cache. Il root widget è
    // sempre montato e visibile: i suoi listener tengono vivi entrambi i
    // flag per tutta la vita dell'app (vedi test/is_pro_provider_test.dart).
    ref
      ..listen(isProProvider, (_, __) {})
      ..listen(offlineStatusProvider, (_, __) {});

    final appRouter = _appRouter;
    final themeMode = ref.watch(themeModeProvider).value;
    final appLocale = ref.watch(localeProvider).value;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(
        deepLinkTransformer: (uri) {
          log('uri: $uri');
          return SynchronousFuture(
            uri.replace(
              path: uri.path.replaceFirst('/app-deeplink', ''),
            ),
          );
        },
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: appLocale,
      title: 'HamQRG',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode ?? ThemeMode.system,
    );
  }
}
