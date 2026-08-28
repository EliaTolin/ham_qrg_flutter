import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/src/features/coverage_search/domain/cached_repeater.dart';
import 'package:hamqrg/src/features/coverage_search/domain/coverage_result.dart';
import 'package:hamqrg/src/features/coverage_search/domain/hydrated_station.dart';
import 'package:hamqrg/src/features/coverage_search/domain/saved_station.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_breadth.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';

final _now = DateTime.utc(2026, 8, 26, 12);

const _point = SearchPoint(
  latitude: 46.4879,
  longitude: 11.8123,
  label: 'Passo Pordoi',
  origin: SearchPointOrigin.placeSearch,
);

Repeater _repeater(String id) => Repeater(
      id: id,
      createdAt: _now,
      updatedAt: _now,
      frequencyHz: 145000000,
      source: 'test',
    );

CachedRepeater _cached(String id, {required int daysAgo}) => CachedRepeater(
      repeater: _repeater(id),
      cachedAt: _now.subtract(Duration(days: daysAgo)),
    );

SavedStation _station(List<String> ids) => SavedStation(
      id: 'station-1',
      name: 'Pordoi',
      point: _point,
      breadth: SearchBreadth.quick,
      computedAt: _now.subtract(const Duration(days: 200)),
      lastRefreshedAt: _now.subtract(const Duration(days: 200)),
      entries: [
        for (final id in ids)
          CoverageEntry(
            repeaterId: id,
            dbm: -95,
            distanceKm: 12,
            reachable: true,
          ),
      ],
    );

void main() {
  group('CachedRepeater.isStaleAt (soglia 30 giorni)', () {
    test('should not be stale one day before the threshold', () {
      expect(_cached('a', daysAgo: 29).isStaleAt(_now), isFalse);
    });

    test('should not be stale exactly at the threshold', () {
      expect(_cached('a', daysAgo: 30).isStaleAt(_now), isFalse);
    });

    test('should be stale one day past the threshold', () {
      expect(_cached('a', daysAgo: 31).isStaleAt(_now), isTrue);
    });
  });

  group('HydratedStation.oldestDataAt', () {
    test('should report the OLDEST entry, not the station refresh date', () {
      // È il cuore dell'aggiornamento indiretto: la postazione è stata salvata
      // 200 giorni fa, ma due dei suoi ripetitori sono stati riaperti di
      // recente altrove nell'app e quindi aggiornati. La data onesta da
      // mostrare è quella della voce rimasta più indietro, non quella del
      // salvataggio — altrimenti si dichiarerebbe fresco un dato che non lo è.
      final hydrated = HydratedStation(
        station: _station(['a', 'b', 'c']),
        repeaters: {
          'a': _cached('a', daysAgo: 2),
          'b': _cached('b', daysAgo: 40),
          'c': _cached('c', daysAgo: 5),
        },
      );

      expect(hydrated.oldestDataAt, _now.subtract(const Duration(days: 40)));
      expect(hydrated.isStaleAt(_now), isTrue);
    });

    test('should not be stale when every entry is recent', () {
      final hydrated = HydratedStation(
        station: _station(['a', 'b']),
        repeaters: {
          'a': _cached('a', daysAgo: 1),
          'b': _cached('b', daysAgo: 10),
        },
      );

      expect(hydrated.isStaleAt(_now), isFalse);
    });

    test('should be null when nothing could be resolved', () {
      final hydrated = HydratedStation(
        station: _station(['a']),
        missingIds: {'a'},
      );
      expect(hydrated.oldestDataAt, isNull);
      expect(hydrated.isStaleAt(_now), isFalse);
    });
  });

  group('HydratedStation.entries', () {
    test('should keep the station order and skip unresolved entries', () {
      final hydrated = HydratedStation(
        station: _station(['a', 'b', 'c']),
        repeaters: {
          'a': _cached('a', daysAgo: 1),
          'c': _cached('c', daysAgo: 1),
        },
        missingIds: {'b'},
      );

      // Una voce irrisolta degrada da sola: la postazione resta consultabile
      // con le altre invece di fallire per intero.
      expect(hydrated.entries.map((e) => e.repeater.id), ['a', 'c']);
      expect(hydrated.missingIds, {'b'});
    });
  });

  group('SavedStation.reachableCount', () {
    test('should count only reachable entries', () {
      final station = _station(['a', 'b']).copyWith(
        entries: [
          const CoverageEntry(
            repeaterId: 'a',
            dbm: -90,
            distanceKm: 5,
            reachable: true,
          ),
          const CoverageEntry(
            repeaterId: 'b',
            dbm: -130,
            distanceKm: 60,
            reachable: false,
          ),
        ],
      );
      expect(station.reachableCount, 1);
    });
  });
}
