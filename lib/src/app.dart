import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamqrg/l10n/app_localizations.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:hamqrg/src/features/profile/provider/theme_mode_notifier/theme_mode_notifier.dart';
import 'package:hamqrg/themes/app_theme.dart';

class HamQRG extends ConsumerWidget {
  const HamQRG({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.read(appRouterProvider);
    final themeMode = ref.watch(themeModeProvider).value;
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
      title: 'HamQRG',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode ?? ThemeMode.system,
    );
  }
}
