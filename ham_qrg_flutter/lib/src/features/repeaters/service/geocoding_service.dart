import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'geocoding_service.g.dart';

class GeocodingResult {
  const GeocodingResult({
    required this.placeName,
    required this.latitude,
    required this.longitude,
  });

  final String placeName;
  final double latitude;
  final double longitude;
}

class GeocodingService {
  GeocodingService(this._dio);

  final Dio _dio;

  static const _baseUrl = 'https://api.mapbox.com/geocoding/v5/mapbox.places';

  /// Reverse geocoding: converts coordinates to a place name.
  Future<GeocodingResult?> reverseGeocode({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '$_baseUrl/$longitude,$latitude.json',
        queryParameters: {
          'access_token': AppConfigs.getMapboxAccessToken(),
          'types': 'place,locality',
          'limit': 1,
        },
      );

      final features = response.data?['features'] as List<dynamic>?;
      if (features == null || features.isEmpty) {
        return null;
      }

      final feature = features.first as Map<String, dynamic>;
      final placeName = feature['place_name'] as String?;
      final center = feature['center'] as List<dynamic>?;

      if (placeName == null || center == null || center.length < 2) {
        return null;
      }

      return GeocodingResult(
        placeName: _extractCityName(placeName),
        latitude: (center[1] as num).toDouble(),
        longitude: (center[0] as num).toDouble(),
      );
    } catch (e, stackTrace) {
      log('Reverse geocoding error: $e', stackTrace: stackTrace);
      return null;
    }
  }

  /// Forward geocoding: searches for places matching a query.
  /// Returns a list of suggestions for autocomplete.
  Future<List<GeocodingResult>> searchPlaces(String query) async {
    if (query.trim().isEmpty) {
      return [];
    }

    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '$_baseUrl/${Uri.encodeComponent(query)}.json',
        queryParameters: {
          'access_token': AppConfigs.getMapboxAccessToken(),
          'types': 'place,locality,neighborhood',
          'autocomplete': 'true',
          'limit': 5,
        },
      );

      final features = response.data?['features'] as List<dynamic>?;
      if (features == null || features.isEmpty) {
        return [];
      }

      return features.map((feature) {
        final f = feature as Map<String, dynamic>;
        final placeName = f['place_name'] as String? ?? '';
        final center = f['center'] as List<dynamic>;

        return GeocodingResult(
          placeName: _extractCityName(placeName),
          latitude: (center[1] as num).toDouble(),
          longitude: (center[0] as num).toDouble(),
        );
      }).toList();
    } catch (e, stackTrace) {
      log('Forward geocoding error: $e', stackTrace: stackTrace);
      return [];
    }
  }

  /// Extracts a short city name from a full place name.
  /// e.g., "Rome, Lazio, Italy" -> "Rome"
  String _extractCityName(String fullName) {
    final parts = fullName.split(',');
    if (parts.isEmpty) return fullName;
    return parts.first.trim();
  }
}

@riverpod
GeocodingService geocodingService(Ref ref) {
  return GeocodingService(Dio());
}
