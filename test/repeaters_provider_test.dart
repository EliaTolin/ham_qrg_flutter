@Tags(['integration'])
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:hamqrg/src/features/repeaters/data/datasource/repeaters_supabase_datasource.dart';
import 'package:hamqrg/src/features/repeaters/data/repository/repeaters_repository.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeater_by_id/get_repeater_by_id_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeater_feedback_stats/get_repeater_feedback_stats_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeater_feedbacks/get_repeater_feedbacks_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeaters_feedback_stats_from_ids/get_repeaters_feedback_stats_from_ids_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeaters_in_bounds/get_repeaters_in_bounds_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_repeaters_nearby/get_repeaters_nearby_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_total_repeaters_count/get_total_repeaters_count_provider.dart';
import 'package:hamqrg/src/features/repeaters/provider/search_repeaters/search_repeaters_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

// ---------------------------------------------------------------------------
// Integration tests for repeaters providers.
//
// These tests hit the real Supabase database.
// Run with:  flutter test --tags integration
// ---------------------------------------------------------------------------

/// Casalgrande coordinates (Emilia-Romagna, RE)
const _casalgrandeLat = 44.5833;
const _casalgrandeLon = 10.7333;

late SupabaseClient _client;
late ProviderContainer _container;

/// ID of the first repeater found for Casalgrande — used by
/// getRepeaterById / feedbackStats tests.
late String _knownRepeaterId;

/// IDs of all Casalgrande repeaters.
late List<String> _knownRepeaterIds;

void main() {
  setUpAll(() async {
    _client = SupabaseClient(
      AppConfigs.getSupabaseUrl(),
      AppConfigs.getSupabaseKey(),
    );
    await _client.auth.signInAnonymously();
    final anonymousUserId = _client.auth.currentUser?.id;

    final talker = TalkerFlutter.init();

    // Real datasource → repository wired into the provider container.
    final datasource = RepeatersSupabaseDatasource(_client, talker);
    final repository = RepeatersRepository(datasource);

    _container = ProviderContainer(
      overrides: [
        repeatersRepositoryProvider.overrideWithValue(repository),
        getUserIdProvider.overrideWith((_) async => anonymousUserId),
      ],
    );

    // Seed: find known repeater IDs from Casalgrande for later tests.
    final casalgrandeRepeaters = await _container.read(
      searchRepeatersProvider(query: 'Casalgrande').future,
    );
    _knownRepeaterIds = casalgrandeRepeaters.map((r) => r.id).toList();
    _knownRepeaterId = _knownRepeaterIds.first;
  });

  tearDownAll(() async {
    _container.dispose();
    await _client.auth.signOut();
    await _client.dispose();
  });

  // =========================================================================
  // searchRepeatersProvider
  // =========================================================================
  group('searchRepeatersProvider', () {
    test('returns repeaters for "Casalgrande"', () async {
      final results = await _container.read(
        searchRepeatersProvider(query: 'Casalgrande').future,
      );

      expect(results, isNotEmpty);
      for (final r in results) {
        final matchesLocality =
            r.locality?.toLowerCase().contains('casalgrande') ?? false;
        final matchesName =
            r.name?.toLowerCase().contains('casalgrande') ?? false;
        expect(matchesLocality || matchesName, isTrue);
      }
    });

    test('returns both ATV and Analog for Casalgrande', () async {
      final results = await _container.read(
        searchRepeatersProvider(query: 'Casalgrande').future,
      );

      final allModes = results
          .expand((r) => r.accesses.map((a) => a.mode))
          .toSet();
      expect(allModes, contains(AccessMode.atv));
      expect(allModes, contains(AccessMode.analog));
    });

    test('filter by ANALOG returns only analog', () async {
      final results = await _container.read(
        searchRepeatersProvider(
          query: 'Casalgrande',
          accessModes: [AccessMode.analog],
        ).future,
      );

      expect(results, isNotEmpty);
      for (final r in results) {
        expect(
          r.accesses.any((a) => a.mode == AccessMode.analog),
          isTrue,
          reason: '${r.callsign} should have ANALOG access',
        );
      }
    });

    test('filter by ATV returns only ATV', () async {
      final results = await _container.read(
        searchRepeatersProvider(
          query: 'Casalgrande',
          accessModes: [AccessMode.atv],
        ).future,
      );

      expect(results, isNotEmpty);
      for (final r in results) {
        expect(
          r.accesses.any((a) => a.mode == AccessMode.atv),
          isTrue,
          reason: '${r.callsign} should have ATV access',
        );
      }
    });

    test('filter narrows results', () async {
      final all = await _container.read(
        searchRepeatersProvider(query: 'Casalgrande').future,
      );
      final atvOnly = await _container.read(
        searchRepeatersProvider(
          query: 'Casalgrande',
          accessModes: [AccessMode.atv],
        ).future,
      );

      expect(atvOnly.length, lessThan(all.length));
    });

    test('non-matching filter returns empty', () async {
      final results = await _container.read(
        searchRepeatersProvider(
          query: 'Casalgrande',
          accessModes: [AccessMode.dstar],
        ).future,
      );

      expect(results, isEmpty);
    });

    test('case-insensitive search', () async {
      final upper = await _container.read(
        searchRepeatersProvider(query: 'CASALGRANDE').future,
      );
      final lower = await _container.read(
        searchRepeatersProvider(query: 'casalgrande').future,
      );

      expect(upper.length, lower.length);
    });

    test('empty query returns empty list', () async {
      final results = await _container.read(
        searchRepeatersProvider(query: '').future,
      );

      expect(results, isEmpty);
    });

    test('non-existent query returns empty', () async {
      final results = await _container.read(
        searchRepeatersProvider(query: 'ZzNonExistent999').future,
      );

      expect(results, isEmpty);
    });
  });

  // =========================================================================
  // getRepeatersNearbyProvider
  // =========================================================================
  group('getRepeatersNearbyProvider', () {
    test('returns nearby repeaters for Casalgrande', () async {
      final results = await _container.read(
        getRepeatersNearbyProvider(
          latitude: _casalgrandeLat,
          longitude: _casalgrandeLon,
        ).future,
      );

      expect(results, isNotEmpty);
    });

    test('results include distance', () async {
      final results = await _container.read(
        getRepeatersNearbyProvider(
          latitude: _casalgrandeLat,
          longitude: _casalgrandeLon,
          radiusKm: 10,
        ).future,
      );

      expect(results, isNotEmpty);
      for (final r in results) {
        expect(r.distanceMeters, isNotNull);
        expect(r.distanceMeters, lessThanOrEqualTo(10000));
      }
    });

    test('results have accesses', () async {
      final results = await _container.read(
        getRepeatersNearbyProvider(
          latitude: _casalgrandeLat,
          longitude: _casalgrandeLon,
          radiusKm: 10,
        ).future,
      );

      for (final r in results) {
        expect(r.accesses, isNotEmpty);
      }
    });

    test('filter by mode works', () async {
      final all = await _container.read(
        getRepeatersNearbyProvider(
          latitude: _casalgrandeLat,
          longitude: _casalgrandeLon,
        ).future,
      );
      final analogOnly = await _container.read(
        getRepeatersNearbyProvider(
          latitude: _casalgrandeLat,
          longitude: _casalgrandeLon,
          accessModes: [AccessMode.analog],
        ).future,
      );

      expect(analogOnly.length, lessThanOrEqualTo(all.length));
      for (final r in analogOnly) {
        expect(r.accesses.any((a) => a.mode == AccessMode.analog), isTrue);
      }
    });

    test('small radius returns fewer results', () async {
      final wide = await _container.read(
        getRepeatersNearbyProvider(
          latitude: _casalgrandeLat,
          longitude: _casalgrandeLon,
        ).future,
      );
      final narrow = await _container.read(
        getRepeatersNearbyProvider(
          latitude: _casalgrandeLat,
          longitude: _casalgrandeLon,
          radiusKm: 5,
        ).future,
      );

      expect(narrow.length, lessThanOrEqualTo(wide.length));
    });
  });

  // =========================================================================
  // getRepeatersInBoundsProvider
  // =========================================================================
  group('getRepeatersInBoundsProvider', () {
    test('returns repeaters in Casalgrande bounding box', () async {
      final results = await _container.read(
        getRepeatersInBoundsProvider(
          lat1: _casalgrandeLat - 0.05,
          lon1: _casalgrandeLon - 0.05,
          lat2: _casalgrandeLat + 0.05,
          lon2: _casalgrandeLon + 0.05,
        ).future,
      );

      expect(results, isNotEmpty);
    });

    test('results have accesses', () async {
      final results = await _container.read(
        getRepeatersInBoundsProvider(
          lat1: _casalgrandeLat - 0.05,
          lon1: _casalgrandeLon - 0.05,
          lat2: _casalgrandeLat + 0.05,
          lon2: _casalgrandeLon + 0.05,
        ).future,
      );

      for (final r in results) {
        expect(r.accesses, isNotEmpty);
      }
    });

    test('filter by mode works', () async {
      final all = await _container.read(
        getRepeatersInBoundsProvider(
          lat1: _casalgrandeLat - 0.1,
          lon1: _casalgrandeLon - 0.1,
          lat2: _casalgrandeLat + 0.1,
          lon2: _casalgrandeLon + 0.1,
        ).future,
      );
      final atvOnly = await _container.read(
        getRepeatersInBoundsProvider(
          lat1: _casalgrandeLat - 0.1,
          lon1: _casalgrandeLon - 0.1,
          lat2: _casalgrandeLat + 0.1,
          lon2: _casalgrandeLon + 0.1,
          accessModes: [AccessMode.atv],
        ).future,
      );

      expect(atvOnly.length, lessThanOrEqualTo(all.length));
      for (final r in atvOnly) {
        expect(r.accesses.any((a) => a.mode == AccessMode.atv), isTrue);
      }
    });

    test('empty bounding box returns empty', () async {
      // Middle of the ocean
      final results = await _container.read(
        getRepeatersInBoundsProvider(
          lat1: -60,
          lon1: -170,
          lat2: -59,
          lon2: -169,
        ).future,
      );

      expect(results, isEmpty);
    });
  });

  // =========================================================================
  // getTotalRepeatersCountProvider
  // =========================================================================
  group('getTotalRepeatersCountProvider', () {
    test('returns a positive count', () async {
      final count = await _container.read(
        getTotalRepeatersCountProvider.future,
      );

      expect(count, greaterThan(0));
    });
  });

  // =========================================================================
  // getRepeaterByIdProvider
  // =========================================================================
  group('getRepeaterByIdProvider', () {
    test('returns repeater for known ID', () async {
      final repeater = await _container.read(
        getRepeaterByIdProvider(_knownRepeaterId).future,
      );

      expect(repeater, isNotNull);
      expect(repeater!.id, _knownRepeaterId);
      expect(repeater.accesses, isNotEmpty);
    });

    test('returns null for unknown ID', () async {
      final repeater = await _container.read(
        getRepeaterByIdProvider('00000000-0000-0000-0000-000000000000').future,
      );

      expect(repeater, isNull);
    });

    test('accesses include mode and source', () async {
      final repeater = await _container.read(
        getRepeaterByIdProvider(_knownRepeaterId).future,
      );

      for (final access in repeater!.accesses) {
        expect(access.id, isNotEmpty);
        expect(access.source, isNotEmpty);
      }
    });
  });

  // =========================================================================
  // getRepeaterFeedbackStatsProvider
  // =========================================================================
  group('getRepeaterFeedbackStatsProvider', () {
    test('returns stats or null for known repeater', () async {
      final stats = await _container.read(
        getRepeaterFeedbackStatsProvider(_knownRepeaterId).future,
      );

      // May be null if no feedbacks, that's OK
      if (stats != null) {
        expect(stats.repeaterId, _knownRepeaterId);
        expect(stats.likesTotal, greaterThanOrEqualTo(0));
        expect(stats.downTotal, greaterThanOrEqualTo(0));
      }
    });

    test('returns null for non-existent repeater', () async {
      final stats = await _container.read(
        getRepeaterFeedbackStatsProvider(
          '00000000-0000-0000-0000-000000000000',
        ).future,
      );

      expect(stats, isNull);
    });
  });

  // =========================================================================
  // getRepeatersFeedbackStatsFromIdsProvider
  // =========================================================================
  group('getRepeatersFeedbackStatsFromIdsProvider', () {
    test('returns map for known IDs', () async {
      final statsMap = await _container.read(
        getRepeatersFeedbackStatsFromIdsProvider(_knownRepeaterIds).future,
      );

      expect(statsMap, isA<Map<String, dynamic>>());
      // Each key should be one of our known IDs
      for (final key in statsMap.keys) {
        expect(_knownRepeaterIds, contains(key));
      }
    });

    test('returns empty map for empty list', () async {
      final statsMap = await _container.read(
        getRepeatersFeedbackStatsFromIdsProvider([]).future,
      );

      expect(statsMap, isEmpty);
    });

    test('returns empty map for non-existent IDs', () async {
      final statsMap = await _container.read(
        getRepeatersFeedbackStatsFromIdsProvider(
          ['00000000-0000-0000-0000-000000000000'],
        ).future,
      );

      expect(statsMap, isEmpty);
    });
  });

  // =========================================================================
  // getRepeaterFeedbacksProvider
  // =========================================================================
  group('getRepeaterFeedbacksProvider', () {
    test('returns feedbacks list for known repeater', () async {
      final feedbacks = await _container.read(
        getRepeaterFeedbacksProvider(repeaterId: _knownRepeaterId).future,
      );

      // May be empty, but should not throw
      expect(feedbacks, isA<List>());
    });

    test('limit restricts results', () async {
      final feedbacks = await _container.read(
        getRepeaterFeedbacksProvider(
          repeaterId: _knownRepeaterId,
          limit: 1,
        ).future,
      );

      expect(feedbacks.length, lessThanOrEqualTo(1));
    });

    test('returns empty for non-existent repeater', () async {
      final feedbacks = await _container.read(
        getRepeaterFeedbacksProvider(
          repeaterId: '00000000-0000-0000-0000-000000000000',
        ).future,
      );

      expect(feedbacks, isEmpty);
    });
  });
}
