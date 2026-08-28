@Tags(['integration'])
@Timeout(Duration(minutes: 6))
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/clients/revenue_cat/impl/revenue_cat_client_impl.dart';
import 'package:hamqrg/clients/revenue_cat/revenue_cat_client.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:hamqrg/src/features/coverage_search/domain/coverage_result.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_breadth.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';
import 'package:hamqrg/src/features/coverage_search/errors/coverage_search_exception.dart';
import 'package:hamqrg/src/features/coverage_search/provider/evaluate_point/evaluate_point_provider.dart';
import 'package:hamqrg/src/features/repeaters/data/datasource/repeaters_supabase_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/repository/repeaters_repository.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeaters_nearby/get_repeaters_nearby_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

// ---------------------------------------------------------------------------
// Valutazione della ricezione da un punto arbitrario, contro Supabase e il
// servizio di copertura reali.
//
// Le valutazioni si eseguono UNA volta in setUpAll e i test leggono il
// risultato: ciascuna costa decine di secondi di propagazione sul terreno, e
// rifarla per ogni asserzione porterebbe la suite fuori da qualunque timeout.
//
// NB: qui non si fa override di `getUserIdProvider`. Importarlo trascinerebbe
// auth_repository → supabase_auth_ui → font_awesome_flutter, che non compila
// con questo SDK Flutter. La valutazione non ha bisogno dell'id utente.
//
// Run with:  flutter test --tags integration
// ---------------------------------------------------------------------------

/// Casalgrande (RE): area con ripetitori censiti, la stessa degli altri test.
const _casalgrande = SearchPoint(
  latitude: 44.5833,
  longitude: 10.7333,
  label: 'Casalgrande',
  origin: SearchPointOrigin.placeSearch,
);

/// Atlantico centrale: nessun ripetitore censito entro qualunque raggio.
const _openOcean = SearchPoint(
  latitude: 30,
  longitude: -40,
  label: '30.00000, -40.00000',
  origin: SearchPointOrigin.mapLongPress,
);

late SupabaseClient _client;
late ProviderContainer _proContainer;

late CoverageEvaluation _quick;
late CoverageEvaluation _ocean;
late Duration _quickDuration;
late int _quickCandidates;
late int _extendedCandidates;

/// Cliente RevenueCat finto.
///
/// Si sostituisce QUESTO e non `isProProvider` perché in questa versione di
/// Riverpod l'override di uno `StreamProvider` generato con `keepAlive: true`
/// non emette mai: `.future` resta appeso a tempo indefinito invece di dare
/// errore, e il test si presenta come una lentezza di rete che non esiste.
/// Sostituire la dipendenza reale è anche il seam più onesto: è esattamente
/// da lì che l'app legge l'entitlement.
class _FakeRevenueCatClient implements RevenueCatClient {
  _FakeRevenueCatClient({required this.pro});

  final bool pro;

  @override
  Future<bool> isPro() async => pro;

  @override
  Stream<bool> proStatusChanges() => Stream.value(pro);

  @override
  Future<void> configure() async {}

  @override
  Future<void> login(String userId) async {}

  @override
  Future<void> logout() async {}

  @override
  Future<void> setUserAttributes({
    String? email,
    String? displayName,
    Map<String, String?> custom = const {},
  }) async {}

  @override
  Future<bool> restorePurchases() async => pro;

  @override
  Future<bool> presentPaywall({String? offeringId}) async => false;

  @override
  Future<bool> presentPaywallIfNeeded() async => pro;
}

ProviderContainer _containerFor({required bool isPro}) {
  final repository = RepeatersRepository(
    RepeatersSupabaseDatasource(_client, TalkerFlutter.init()),
  );
  return ProviderContainer(
    // Come in main.dart: nessun retry. Senza questo, un errore che arriva in
    // due secondi viene ripetuto con backoff e si presenta come un blocco di
    // minuti, nascondendo la causa vera.
    retry: (retryCount, error) => null,
    overrides: [
      repeatersRepositoryProvider.overrideWithValue(repository),
      revenueCatClientProvider
          .overrideWithValue(_FakeRevenueCatClient(pro: isPro)),
    ],
  );
}

void main() {
  setUpAll(() async {
    _client = SupabaseClient(
      AppConfigs.getSupabaseUrl(),
      AppConfigs.getSupabaseKey(),
    );
    await _client.auth.signInAnonymously();

    _proContainer = _containerFor(isPro: true);

    // `listen` e non solo `read`: senza un ascoltatore Riverpod smonta il
    // provider appena la lettura è schedulata, mentre la build asincrona è
    // ancora in volo. Nell'app lo tiene montato il widget che lo osserva.
    final quickProvider = evaluatePointProvider(
      point: _casalgrande,
      breadth: SearchBreadth.quick,
    );
    _proContainer.listen(quickProvider, (_, __) {});

    final startedAt = DateTime.now();
    _quick = await _proContainer.read(quickProvider.future);
    _quickDuration = DateTime.now().difference(startedAt);
    // ignore: avoid_print
    print('[timing] valutazione rapida (80 km): '
        '${_quickDuration.inSeconds}s su ${_quick.entries.length} candidati');

    // Il confronto fra ampiezze si fa sui CANDIDATI, non rieseguendo la
    // propagazione a 150 km: quella è una query Supabase da millisecondi,
    // mentre la propagazione su un'area quattro volte più grande richiede
    // minuti su terreno non ancora in cache.
    _quickCandidates = (await _proContainer.read(
      getRepeatersNearbyProvider(
        latitude: _casalgrande.latitude,
        longitude: _casalgrande.longitude,
        radiusKm: SearchBreadth.quick.radiusKm,
        limit: SearchBreadth.quick.candidateLimit,
      ).future,
    ))
        .length;
    _extendedCandidates = (await _proContainer.read(
      getRepeatersNearbyProvider(
        latitude: _casalgrande.latitude,
        longitude: _casalgrande.longitude,
        radiusKm: SearchBreadth.extended.radiusKm,
        limit: SearchBreadth.extended.candidateLimit,
      ).future,
    ))
        .length;

    final oceanProvider = evaluatePointProvider(
      point: _openOcean,
      breadth: SearchBreadth.quick,
    );
    _proContainer.listen(oceanProvider, (_, __) {});
    _ocean = await _proContainer.read(oceanProvider.future);
  });

  tearDownAll(() async {
    _proContainer.dispose();
    await _client.auth.signOut();
    await _client.dispose();
  });

  group('evaluatePointProvider — utente Pro', () {
    test('should evaluate an arbitrary point and keep it in the result', () {
      expect(_quick.entries, isNotEmpty);
      expect(_quick.point, _casalgrande);
      expect(_quick.breadth, SearchBreadth.quick);
    });

    test('should carry repeater, distance and verdict on every entry', () {
      for (final entry in _quick.entries) {
        expect(entry.repeater.id, isNotEmpty);
        expect(entry.verdict.repeaterId, entry.repeater.id);
        expect(entry.verdict.distanceKm, greaterThanOrEqualTo(0));
      }
    });

    test('should rank by descending predicted signal (FR-017)', () {
      final signals = _quick.entries.map((e) => e.verdict.dbm).toList();
      final sorted = [...signals]..sort((a, b) => b.compareTo(a));
      expect(signals, sorted);
    });

    test('should count only the entries that are actually reachable', () {
      expect(
        _quick.reachableCount,
        _quick.entries.where((e) => e.verdict.reachable).length,
      );
      expect(_quick.reachableCount, lessThanOrEqualTo(_quick.entries.length));
    });

    test('should include every access mode, ignoring any map filter (FR-027)',
        () {
      // La valutazione non accetta filtri di modo: in un'area popolata il
      // risultato deve contenere più modi distinti. Se un giorno qualcuno
      // passasse `accessModes` al provider, questo test se ne accorge.
      final modes = _quick.entries.expand((e) => e.modes).toSet();
      expect(modes.length, greaterThan(1));
    });

    test('should widen the candidate set as breadth grows', () {
      // ignore: avoid_print
      print('[breadth] candidati 80 km: $_quickCandidates · '
          '150 km: $_extendedCandidates');
      expect(_extendedCandidates, greaterThan(_quickCandidates));
    });

    test('should keep breadth as part of the result identity', () {
      expect(_quick.breadth, SearchBreadth.quick);
      expect(_quick.result.breadth, SearchBreadth.quick);
    });

    test('should return an empty evaluation where no repeater exists at all',
        () {
      // Nessun ripetitore censito: caso diverso da "censiti ma non
      // raggiungibili", e la UI deve distinguerli (FR-021).
      expect(_ocean.entries, isEmpty);
      expect(_ocean.reachableCount, 0);
    });

    test('should produce a light result carrying only repeater references', () {
      final result = _quick.result;
      expect(result.entries.length, _quick.entries.length);
      expect(result.reachableCount, _quick.reachableCount);
      // Il payload dei ripetitori esce dal risultato e va nella cache condivisa.
      expect(_quick.repeaters.length, _quick.entries.length);
    });
  });

  group('evaluatePointProvider — utente non Pro', () {
    late ProviderContainer container;

    setUp(() => container = _containerFor(isPro: false));
    tearDown(() => container.dispose());

    test('should refuse before issuing any coverage request (FR-014)',
        () async {
      await expectLater(
        container.read(
          evaluatePointProvider(
            point: _casalgrande,
            breadth: SearchBreadth.quick,
          ).future,
        ),
        throwsA(isA<ProRequiredException>()),
      );
    });
  });
}
