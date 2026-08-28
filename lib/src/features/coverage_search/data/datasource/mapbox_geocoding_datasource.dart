import 'package:dio/dio.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:hamqrg/src/features/coverage_search/data/datasource/geocoding_datasource.dart';
import 'package:hamqrg/src/features/coverage_search/data/model/place_suggestion_model.dart';
import 'package:hamqrg/src/features/coverage_search/errors/coverage_search_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mapbox_geocoding_datasource.g.dart';

/// Geocodifica tramite Mapbox Geocoding v6, con il token già configurato per la
/// mappa: nessuna nuova dipendenza e nessuna nuova credenziale.
class MapboxGeocodingDatasource implements GeocodingDatasource {
  MapboxGeocodingDatasource(this._dio);

  final Dio _dio;

  /// Richiesta attualmente in volo. Mentre l'utente digita conta solo l'ultima:
  /// annullare le precedenti tiene i suggerimenti coerenti con ciò che è
  /// scritto nel campo ed evita di pagare risposte che nessuno leggerà.
  CancelToken? _inFlight;

  @override
  Future<List<PlaceSuggestionModel>> forward(
    String query, {
    required String language,
    int limit = 5,
  }) async {
    _inFlight?.cancel('superseded');
    final cancelToken = _inFlight = CancelToken();

    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/search/geocode/v6/forward',
        queryParameters: {
          'q': query,
          'limit': limit,
          'language': language,
          'access_token': AppConfigs.getMapboxAccessToken(),
        },
        cancelToken: cancelToken,
      );

      final features = response.data?['features'];
      if (features is! List) return const [];

      return features
          .whereType<Map<String, dynamic>>()
          .map(PlaceSuggestionModel.fromFeature)
          .nonNulls
          .toList();
    } on DioException catch (error) {
      // Una richiesta annullata perché superata da una più recente non è un
      // errore da mostrare: la successiva sta già arrivando.
      if (CancelToken.isCancel(error)) return const [];

      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.connectionError:
          throw const GeocodingUnavailableException();
        case DioExceptionType.badResponse:
        case DioExceptionType.badCertificate:
        case DioExceptionType.unknown:
        case DioExceptionType.cancel:
          throw GeocodingFailedException(error.response?.statusCode);
      }
    } finally {
      if (identical(_inFlight, cancelToken)) _inFlight = null;
    }
  }
}

@riverpod
GeocodingDatasource geocodingDatasource(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.mapbox.com',
      connectTimeout: const Duration(seconds: 8),
      // I suggerimenti devono comparire entro un secondo (SC-002): oltre pochi
      // secondi la risposta è comunque inutile, l'utente ha già ridigitato.
      receiveTimeout: const Duration(seconds: 8),
    ),
  );
  return MapboxGeocodingDatasource(dio);
}
