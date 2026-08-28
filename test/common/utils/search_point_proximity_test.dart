import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';

SearchPoint _point(double lat, double lon) => SearchPoint(
      latitude: lat,
      longitude: lon,
      label: 'test',
      origin: SearchPointOrigin.mapLongPress,
    );

void main() {
  group('SearchPoint.distanceMetersTo', () {
    test('should be zero for the same coordinates', () {
      final p = _point(46.4879, 11.8123);
      expect(p.distanceMetersTo(p), closeTo(0, 0.001));
    });

    test('should be symmetric', () {
      final a = _point(46.4879, 11.8123);
      final b = _point(45.4642, 9.1900);
      expect(
        a.distanceMetersTo(b),
        closeTo(b.distanceMetersTo(a), 0.001),
      );
    });

    test('should match a known distance (Milano → Roma ≈ 477 km)', () {
      final milano = _point(45.4642, 9.1900);
      final roma = _point(41.9028, 12.4964);
      expect(milano.distanceMetersTo(roma), closeTo(477000, 5000));
    });

    test('should handle antimeridian crossing without inflating distance', () {
      // Due punti a cavallo del 180° distano poche decine di km, non ~40.000.
      final west = _point(0, 179.9);
      final east = _point(0, -179.9);
      expect(west.distanceMetersTo(east), lessThan(30000));
    });

    test('should handle antipodes', () {
      final a = _point(0, 0);
      final b = _point(0, 180);
      expect(a.distanceMetersTo(b), closeTo(20015000, 50000));
    });
  });

  group('SearchPoint.isSamePlace (soglia 200 m)', () {
    test('should treat identical points as the same place', () {
      final p = _point(46.4879, 11.8123);
      expect(p.isSamePlace(p), isTrue);
    });

    test('should treat a point ~100 m away as the same place', () {
      final a = _point(46.4879, 11.8123);
      // ~111 m a nord: 0.001° di latitudine ≈ 111 m.
      final b = _point(46.4889, 11.8123);
      expect(a.distanceMetersTo(b), lessThan(kSamePlaceThresholdMeters));
      expect(a.isSamePlace(b), isTrue);
    });

    test('should treat a point ~333 m away as a different place', () {
      final a = _point(46.4879, 11.8123);
      final b = _point(46.4909, 11.8123);
      expect(a.distanceMetersTo(b), greaterThan(kSamePlaceThresholdMeters));
      expect(a.isSamePlace(b), isFalse);
    });

    test('should be symmetric', () {
      final a = _point(46.4879, 11.8123);
      final b = _point(46.4889, 11.8123);
      expect(a.isSamePlace(b), b.isSamePlace(a));
    });

    test('should treat far-apart points as different places', () {
      expect(
        _point(45.4642, 9.1900).isSamePlace(_point(41.9028, 12.4964)),
        isFalse,
      );
    });

    test('should ignore label and origin when comparing', () {
      const a = SearchPoint(
        latitude: 46.4879,
        longitude: 11.8123,
        label: 'Passo Pordoi',
        origin: SearchPointOrigin.placeSearch,
      );
      const b = SearchPoint(
        latitude: 46.4879,
        longitude: 11.8123,
        label: '46.48790, 11.81230',
        origin: SearchPointOrigin.coordinates,
      );
      expect(a.isSamePlace(b), isTrue);
    });
  });
}
