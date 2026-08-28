import 'package:hamqrg/src/features/coverage_search/domain/coverage_result.dart';
import 'package:hamqrg/src/features/coverage_search/domain/saved_station.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_breadth.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';

/// Forma persistita di una postazione salvata.
///
/// Serializzata a mano e non con `json_serializable`: il record contiene enum
/// e una lista di voci compatte, e la mappatura esplicita rende ovvio quanto
/// poco pesa — ~60 byte per ripetitore, che è ciò che permette di conservarla
/// in un archivio chiave-valore invece che in un database.
class SavedStationModel {
  const SavedStationModel({required this.station});

  final SavedStation station;

  Map<String, dynamic> toJson() => {
        'id': station.id,
        'name': station.name,
        'latitude': station.point.latitude,
        'longitude': station.point.longitude,
        'label': station.point.label,
        'origin': station.point.origin.name,
        if (station.point.context != null) 'context': station.point.context,
        'breadth': station.breadth.name,
        'computedAt': station.computedAt.toIso8601String(),
        'lastRefreshedAt': station.lastRefreshedAt.toIso8601String(),
        'entries': [
          for (final e in station.entries)
            {
              'id': e.repeaterId,
              'dbm': e.dbm,
              'km': e.distanceKm,
              'ok': e.reachable,
            },
        ],
      };

  /// Ricostruisce il record, restituendo `null` se è illeggibile.
  ///
  /// Un record corrotto non deve impedire di aprire la lista: si salta quella
  /// voce e le altre restano consultabili.
  static SavedStationModel? fromJson(Map<String, dynamic> json) {
    try {
      final entries = <CoverageEntry>[];
      for (final raw in (json['entries'] as List? ?? const [])) {
        final map = raw as Map<String, dynamic>;
        entries.add(
          CoverageEntry(
            repeaterId: map['id'] as String,
            dbm: (map['dbm'] as num).toDouble(),
            distanceKm: (map['km'] as num).toDouble(),
            reachable: map['ok'] as bool,
          ),
        );
      }

      return SavedStationModel(
        station: SavedStation(
          id: json['id'] as String,
          name: json['name'] as String,
          point: SearchPoint(
            latitude: (json['latitude'] as num).toDouble(),
            longitude: (json['longitude'] as num).toDouble(),
            label: json['label'] as String,
            origin: SearchPointOrigin.values.firstWhere(
              (o) => o.name == json['origin'],
              orElse: () => SearchPointOrigin.mapLongPress,
            ),
            context: json['context'] as String?,
          ),
          breadth: SearchBreadth.fromName(json['breadth'] as String?),
          computedAt: DateTime.parse(json['computedAt'] as String),
          lastRefreshedAt: DateTime.parse(json['lastRefreshedAt'] as String),
          entries: entries,
        ),
      );
    } catch (_) {
      return null;
    }
  }
}
