import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Perché il flusso d'acquisto non deve ricostruire l'albero di navigazione.
///
/// `_onProPurchased` chiudeva con `router.replaceAll([HomeRoute()])` per
/// rimontare i gate Pro. Questo test mostra il prezzo di quella scelta: il
/// dettaglio ripetitore — la pagina da cui l'utente ha comprato — viene
/// smontato, e con esso muore la navigazione che doveva seguire l'acquisto:
///
/// ```dart
/// if (AppConfigs.coverageRequiresPro && !await requirePro(...)) return;
/// if (!context.mounted) return;                       // ← scatta qui
/// await context.router.push(RepeaterCoverageRoute(...));
/// ```
///
/// L'utente pagava per aprire la mappa di copertura e restava sulla tab
/// iniziale senza averla vista. In produzione, nove acquisti su dieci non
/// hanno mai raggiunto la funzione pagata.
///
/// Il `replaceAll` non serviva: nessun gate cattura `isProProvider` al build,
/// li osservano tutti con `ref.watch`. Il test resta a presidio — se qualcuno
/// rimette una ricostruzione dell'albero nel percorso d'acquisto, qui si vede
/// cosa comporta.
///
/// Il router riproduce la nidificazione reale di `app_router.dart`:
/// root → HomeRoute → EmptyShellRoute('MainRouter') → dashboard | dettaglio.
BuildContext? detailContext;

final _homePage = PageInfo('HomeRoute', builder: (_) => const AutoRouter());
const _mainShell = PageInfo.emptyShell('MainRouter');
final _dashboardPage = PageInfo(
  'DashboardRoute',
  builder: (_) => const Scaffold(body: Text('dashboard')),
);
final _detailPage = PageInfo(
  'RepeaterDetailRoute',
  builder: (_) => Builder(
    builder: (context) {
      detailContext = context;
      return const Scaffold(body: Text('detail'));
    },
  ),
);

class _HomeRoute extends PageRouteInfo<void> {
  const _HomeRoute() : super('HomeRoute');
}

class _DetailRoute extends PageRouteInfo<void> {
  const _DetailRoute() : super('RepeaterDetailRoute');
}

class _TestRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: _homePage,
          initial: true,
          children: [
            AutoRoute(
              page: _mainShell,
              children: [
                AutoRoute(
                  path: 'dashboard',
                  page: _dashboardPage,
                  initial: true,
                ),
                AutoRoute(path: 'repeater', page: _detailPage),
              ],
            ),
          ],
        ),
      ];
}

void main() {
  testWidgets(
    'replaceAll([HomeRoute()]) smonterebbe il dettaglio da cui si è comprato',
    (tester) async {
      final router = _TestRouter();
      await tester
          .pumpWidget(MaterialApp.router(routerConfig: router.config()));
      await tester.pumpAndSettle();

      // L'utente apre il dettaglio di un ripetitore e tocca la promo card.
      unawaited(router.push(const _DetailRoute()));
      await tester.pumpAndSettle();
      expect(find.text('detail'), findsOneWidget);
      expect(detailContext!.mounted, isTrue, reason: "prima dell'acquisto");

      // Acquisto riuscito → _onProPurchased → replaceAll([HomeRoute()]).
      await router.replaceAll([const _HomeRoute()]);
      await tester.pumpAndSettle();

      // Il dettaglio è sparito dallo stack: resta solo HomeRoute.
      expect(router.stackData.map((e) => e.name), ['HomeRoute']);
      expect(find.text('detail'), findsNothing);

      // E questa è la guardia di `coverage_promo_card._open`: con il context
      // smontato, `context.router.push(RepeaterCoverageRoute(...))` non viene
      // mai eseguita. L'utente ha pagato per aprire la copertura e resta
      // sulla tab iniziale senza averla vista.
      expect(detailContext!.mounted, isFalse, reason: "dopo l'acquisto");
    },
  );
}
