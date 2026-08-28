import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/clients/analytics/analytics_client.dart';

void main() {
  // Gli identificatori finiscono in una colonna su cui si calcolano i tassi di
  // passaggio. Rinominarne uno per errore non rompe nulla a compilazione: rompe
  // il confronto storico, e ce se ne accorge settimane dopo. Questi test
  // bloccano il contratto scritto in contracts/analytics-events.md.
  group('AnalyticsEvent', () {
    test('should keep the ids agreed in the contract', () {
      expect(
        AnalyticsEvent.coveragePointSelected.id,
        'coverage_point_selected',
      );
      expect(AnalyticsEvent.coverageTeaserShown.id, 'coverage_teaser_shown');
      expect(AnalyticsEvent.coverageCtaTapped.id, 'coverage_cta_tapped');
      expect(AnalyticsEvent.coveragePaywallShown.id, 'coverage_paywall_shown');
      expect(
        AnalyticsEvent.coveragePurchaseCompleted.id,
        'coverage_purchase_completed',
      );
      expect(
        AnalyticsEvent.coveragePaywallDismissed.id,
        'coverage_paywall_dismissed',
      );
    });

    test('should cover the whole funnel, entry to outcome', () {
      // Sei passi: senza uno solo di essi il drop-off di quel tratto diventa
      // incalcolabile.
      expect(AnalyticsEvent.values, hasLength(6));
    });
  });

  group('AnalyticsSurface', () {
    test('should keep the ids agreed in the contract', () {
      expect(AnalyticsSurface.mapTeaser.id, 'map_teaser');
      expect(AnalyticsSurface.stationsList.id, 'stations_list');
      expect(AnalyticsSurface.reachButton.id, 'reach_button');
      expect(AnalyticsSurface.reachBadge.id, 'reach_badge');
    });

    test('should include the two pre-existing reachability surfaces (FR-066)',
        () {
      // Se qualcuno le togliesse, il nuovo teaser resterebbe senza termine di
      // paragone: si saprebbe quanto converte, non se converte meglio.
      expect(AnalyticsSurface.values, contains(AnalyticsSurface.reachButton));
      expect(AnalyticsSurface.values, contains(AnalyticsSurface.reachBadge));
    });
  });

  group('FR-067 — nessun dato sensibile negli eventi', () {
    test('should expose no free-form payload parameter', () {
      // La garanzia è nella firma di `track`: event ed surface sono enum
      // chiusi e l'unico dato libero è un intero. Non esiste alcun parametro
      // in cui una coordinata o un toponimo possano finire, quindi FR-067 non
      // dipende dalla disciplina di chi chiama il metodo.
      //
      // Questo test è un promemoria eseguibile: se un giorno `track` guadagna
      // una Map<String, dynamic> o una String libera, il codice qui sotto
      // smette di rappresentare il contratto e la riga va rivista insieme al
      // vincolo CHECK lato database.
      const ids = <String>{
        'coverage_point_selected',
        'coverage_teaser_shown',
        'coverage_cta_tapped',
        'coverage_paywall_shown',
        'coverage_purchase_completed',
        'coverage_paywall_dismissed',
      };
      expect(
        AnalyticsEvent.values.map((e) => e.id).toSet(),
        ids,
        reason: 'gli eventi ammessi sono esattamente quelli del contratto',
      );

      for (final surface in AnalyticsSurface.values) {
        // Nessun identificatore deve contenere dati di posizione.
        expect(
          RegExp('lat|lon|place|query|label').hasMatch(surface.id),
          isFalse,
        );
      }
    });
  });
}
