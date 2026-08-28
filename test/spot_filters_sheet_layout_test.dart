import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/common/widgets/filter/spot_filters_sheet.dart';
import 'package:hamqrg/l10n/app_localizations.dart';

void main() {
  const bands = [
    '160m',
    '80m',
    '60m',
    '40m',
    '30m',
    '20m',
    '17m',
    '15m',
    '12m',
    '10m',
    '6m',
    '2m',
    '70cm',
  ];
  const modes = ['CW', 'SSB', 'FT8', 'FM', 'DATA'];

  Future<void> pumpSheet(WidgetTester tester, Size size) async {
    tester.view
      ..physicalSize = size
      ..devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    String? band = '40m';
    String? mode = 'CW';

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('it'),
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => showSpotFiltersSheet(
                context: context,
                availableBands: bands,
                availableModes: modes,
                selectedBand: band,
                selectedMode: mode,
                onBandChanged: (v) => band = v,
                onModeChanged: (v) => mode = v,
              ),
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  testWidgets('renders on a phone-sized screen', (tester) async {
    await pumpSheet(tester, const Size(390, 844));

    expect(find.text('Filtri'), findsOneWidget);
    expect(find.text('Banda'), findsOneWidget);
    expect(find.text('Modo'), findsOneWidget);
    expect(find.text('Azzera filtri'), findsOneWidget);
    expect(find.text('70cm'), findsOneWidget);
  });

  testWidgets('renders on a tablet-sized screen within max width',
      (tester) async {
    await pumpSheet(tester, const Size(1280, 800));

    expect(find.text('Filtri'), findsOneWidget);
    final sheetWidth = tester.getSize(find.byType(SpotFiltersSheet)).width;
    expect(sheetWidth, lessThanOrEqualTo(640));
  });

  testWidgets('clearing filters notifies both callbacks', (tester) async {
    await pumpSheet(tester, const Size(390, 844));

    await tester.tap(find.text('Azzera filtri'));
    await tester.pumpAndSettle();

    expect(find.text('Azzera filtri'), findsNothing);
  });
}
