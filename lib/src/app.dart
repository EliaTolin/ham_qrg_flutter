import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamqrg/common/service/messaging/cluster_spot_notification_handler.dart';
import 'package:hamqrg/l10n/app_localizations.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/profile/provider/locale_notifier/locale_notifier.dart';
import 'package:hamqrg/src/features/profile/provider/theme_mode_notifier/theme_mode_notifier.dart';
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
