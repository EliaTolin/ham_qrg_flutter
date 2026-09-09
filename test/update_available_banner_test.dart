import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/clients/package_info/package_info.dart';
import 'package:hamqrg/common/provider/update_available/update_available_provider.dart';
import 'package:hamqrg/common/widgets/banner/update_available_banner.dart';
import 'package:hamqrg/l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Il banner di nuova versione è un invito che vive in cima alla dashboard,
/// sopra contenuto vero: due sole cose lo renderebbero dannoso — occupare
/// spazio quando non c'è nulla da annunciare, e traboccare nelle lingue
/// lunghe, dove alla riga tocca stare accanto a bottone e chiusura.
void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  final packageInfo = PackageInfo(
    appName: 'HamQRG',
    packageName: 'it.auroradigital.hamqrg',
    version: '1.3.0',
    buildNumber: '54',
  );

  Future<void> pumpBanner(
    WidgetTester tester, {
    required String? version,
    Locale locale = const Locale('it'),
    double width = 320,
    double textScale = 1,
  }) async {
    tester.view.physicalSize = Size(width * 3, 900 * 3);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          availableUpdateVersionProvider.overrideWith((ref) async => version),
          packageInfoProvider.overrideWith((ref) async => packageInfo),
        ],
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: locale,
          builder: (context, child) => MediaQuery.withClampedTextScaling(
            minScaleFactor: textScale,
            maxScaleFactor: textScale,
            child: child!,
          ),
          home: const Scaffold(body: UpdateAvailableBanner()),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('senza aggiornamenti il banner non occupa spazio',
      (tester) async {
    await pumpBanner(tester, version: null);

    expect(find.byType(TextButton), findsNothing);
    expect(
      tester.getSize(find.byType(UpdateAvailableBanner)).height,
      0,
    );
  });

  testWidgets('con una versione nuova mostra numero, azione e chiusura',
      (tester) async {
    await pumpBanner(tester, version: '1.4.0');

    expect(find.textContaining('1.4.0'), findsOneWidget);
    expect(find.byType(TextButton), findsOneWidget);
    expect(find.byIcon(Icons.close), findsOneWidget);
  });

  // Le lingue più lunghe, sullo schermo più stretto e col testo ingrandito:
  // l'etichetta va a capo, non trabocca.
  for (final locale in const [Locale('de'), Locale('hu'), Locale('pl')]) {
    for (final textScale in const [1.0, 1.3]) {
      testWidgets(
        'nessun traboccamento in ${locale.languageCode} '
        'a 320dp con testo ×$textScale',
        (tester) async {
          await pumpBanner(
            tester,
            version: '1.4.0',
            locale: locale,
            textScale: textScale,
          );

          expect(tester.takeException(), isNull);
        },
      );
    }
  }
}
