@Tags(['integration'])
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/src/features/coverage_search/data/datasource/mapbox_geocoding_datasource.dart';
import 'package:hamqrg/src/features/coverage_search/data/repository/coverage_search_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Geocodifica reale contro Mapbox v6.
///
/// Verifica ciò che un mock non potrebbe: che l'endpoint risponda nella forma
/// attesa e — soprattutto — che latitudine e longitudine non risultino
/// invertite. L'ordine GeoJSON è [lon, lat] e scambiarle non fa fallire nulla:
/// manda semplicemente il pin dall'altra parte del mondo.
void main() {
  late ProviderContainer container;
  late CoverageSearchRepository repository;

  setUp(() {
    container = ProviderContainer();
    repository = container.read(coverageSearchRepositoryProvider);
  });

  tearDown(() => container.dispose());

  group('geocodifica Mapbox', () {
    test('should resolve a well-known place to the expected coordinates',
        () async {
      final results =
          await repository.searchPlaces('Passo Pordoi', language: 'it');

      expect(results, isNotEmpty);
      final first = results.first;
      // Passo Pordoi: 46.49 N, 11.81 E. Tolleranza ampia perché il centroide
      // scelto da Mapbox può spostarsi, ma non di un grado.
      expect(first.latitude, closeTo(46.49, 0.2));
      expect(first.longitude, closeTo(11.81, 0.2));
      expect(first.label, isNotEmpty);
    });

    test(
        'should not swap latitude and longitude for a southern-hemisphere city',
        () async {
      // Sydney ha latitudine negativa e longitudine molto positiva: se le due
      // fossero invertite, la latitudine risulterebbe fuori intervallo.
      final results = await repository.searchPlaces('Sydney', language: 'en');

      expect(results, isNotEmpty);
      final first = results.first;
      expect(first.latitude, closeTo(-33.87, 1.0));
      expect(first.longitude, closeTo(151.21, 1.0));
      expect(first.latitude, inInclusiveRange(-90, 90));
      expect(first.longitude, inInclusiveRange(-180, 180));
    });

    test('should return a context that disambiguates homonyms', () async {
      final results = await repository.searchPlaces('Milano', language: 'it');

      expect(results, isNotEmpty);
      expect(
        results.any((r) => r.context != null && r.context!.isNotEmpty),
        isTrue,
      );
    });

    test('should still return fuzzy matches for a nonsense query', () async {
      // Comportamento verificato di Mapbox v6: NON restituisce quasi mai una
      // lista vuota. Su "...non esiste questo posto" aggancia il frammento
      // "posto" e propone Postoloprty, Poston, Postomino.
      //
      // Conseguenza di prodotto: lo stato vuoto "nessun risultato" si vede di
      // rado, e il vero fallimento da gestire non è l'assenza di suggerimenti
      // ma la loro irrilevanza. Per questo la via d'uscita — coordinate o
      // pressione prolungata sulla mappa — deve restare sempre visibile nel
      // pannello dei suggerimenti, non comparire solo quando la lista è vuota.
      final results = await repository.searchPlaces(
        'zzzqqqxxxwwwvvv non esiste questo posto',
        language: 'it',
      );

      expect(results, isNotEmpty);
    });

    test('should skip the network entirely for queries below 3 characters',
        () async {
      // Nessuna richiesta pagata per una query inutilizzabile (FR-002).
      expect(await repository.searchPlaces('Mi', language: 'it'), isEmpty);
      expect(await repository.searchPlaces('  ', language: 'it'), isEmpty);
    });

    test('should convert a suggestion into a search point', () async {
      final results = await repository.searchPlaces('Roma', language: 'it');
      expect(results, isNotEmpty);

      final suggestion = results.first;
      final point = suggestion.toSearchPoint();
      expect(point.latitude, suggestion.latitude);
      expect(point.longitude, suggestion.longitude);
      expect(point.label, suggestion.label);
    });

    test('should cancel superseded in-flight requests without throwing',
        () async {
      final datasource = container.read(geocodingDatasourceProvider);
      // Tre ricerche consecutive senza attendere: le prime due vengono
      // annullate e devono risolversi a lista vuota, non lanciare.
      final futures = <Future<List<dynamic>>>[
        datasource.forward('Mila', language: 'it'),
        datasource.forward('Milan', language: 'it'),
        datasource.forward('Milano', language: 'it'),
      ];
      final results = await Future.wait(futures);
      expect(results.last, isNotEmpty);
    });
  });
}
