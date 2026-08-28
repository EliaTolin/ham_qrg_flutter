@Tags(['integration'])
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// ---------------------------------------------------------------------------
// Verifica lo schema e la RLS di `analytics_events` contro il database reale.
//
// Esiste perché un fallimento qui è invisibile in produzione: il client scrive
// gli eventi in fire-and-forget (FR-068), quindi una policy sbagliata non
// produce alcun errore a schermo — solo un funnel vuoto scoperto settimane dopo.
// ---------------------------------------------------------------------------

late SupabaseClient _client;

void main() {
  setUpAll(() async {
    _client = SupabaseClient(
      AppConfigs.getSupabaseUrl(),
      AppConfigs.getSupabaseKey(),
    );
    await _client.auth.signInAnonymously();
  });

  tearDownAll(() async {
    await _client.auth.signOut();
    await _client.dispose();
  });

  group('analytics_events', () {
    test('should accept an event from an anonymous user', () async {
      await _client.from('analytics_events').insert({
        'user_id': _client.auth.currentUser?.id,
        'event': 'coverage_teaser_shown',
        'surface': 'map_teaser',
        'props': {'count': 3},
      });
    });

    test('should accept an event with no user attribution', () async {
      await _client.from('analytics_events').insert({
        'event': 'coverage_point_selected',
        'surface': 'map_teaser',
      });
    });

    test('should refuse to attribute an event to another user', () async {
      expect(
        () => _client.from('analytics_events').insert({
          'user_id': '00000000-0000-0000-0000-000000000000',
          'event': 'coverage_cta_tapped',
          'surface': 'stations_list',
        }),
        throwsA(isA<PostgrestException>()),
      );
    });

    test('should not expose events to the client (insert-only)', () async {
      final rows = await _client.from('analytics_events').select();
      // Nessuna policy di SELECT: la RLS filtra tutto, la lettura resta
      // possibile solo lato servizio con la chiave secret.
      expect(rows, isEmpty);
    });

    test('should reject props carrying coordinates or place names (FR-067)',
        () async {
      for (final forbidden in [
        {'lat': 46.4879},
        {'lon': 11.8123},
        {'latitude': 46.4879},
        {'label': 'Passo Pordoi'},
        {'query': 'Passo Pordoi'},
      ]) {
        expect(
          () => _client.from('analytics_events').insert({
            'event': 'coverage_point_selected',
            'surface': 'map_teaser',
            'props': forbidden,
          }),
          throwsA(isA<PostgrestException>()),
          reason: 'props $forbidden dovrebbe essere rifiutato dal CHECK',
        );
      }
    });
  });
}
