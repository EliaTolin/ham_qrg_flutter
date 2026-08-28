import 'dart:convert';

import 'package:hamqrg/clients/storage/impl/shared_pref_storage_client/shared_pref_storage_client.dart';
import 'package:hamqrg/clients/storage/storage_client.dart';
import 'package:hamqrg/src/features/coverage_search/data/datasource/saved_stations_datasource.dart';
import 'package:hamqrg/src/features/coverage_search/data/model/saved_station_model.dart';
import 'package:hamqrg/src/features/coverage_search/errors/coverage_search_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'prefs_saved_stations_datasource.g.dart';

/// Chiave dell'indice: la sola lista degli id, ordinata dalla più recente.
const String kStationsIndexKey = 'coverage_search.stations.index';

/// Prefisso delle chiavi dei singoli record.
const String kStationKeyPrefix = 'coverage_search.station.';

/// Postazioni salvate su archivio chiave-valore.
///
/// Indice e record stanno su chiavi separate per due motivi: la lista si legge
/// senza deserializzare ogni postazione, e un record corrotto non porta giù
/// l'intero elenco.
class PrefsSavedStationsDatasource implements SavedStationsDatasource {
  PrefsSavedStationsDatasource(this._storage);

  final StorageClient _storage;

  String _keyFor(String id) => '$kStationKeyPrefix$id';

  @override
  Future<List<String>> readIndex() async {
    final raw = await _storage.read(kStationsIndexKey);
    if (raw == null || raw.isEmpty) return const [];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return const [];
      return decoded.whereType<String>().toList();
    } on FormatException {
      return const [];
    }
  }

  @override
  Future<SavedStationModel?> read(String id) async {
    final raw = await _storage.read(_keyFor(id));
    if (raw == null || raw.isEmpty) return null;
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) return null;
      return SavedStationModel.fromJson(decoded);
    } on FormatException {
      return null;
    }
  }

  @override
  Future<void> write(SavedStationModel station) async {
    final id = station.station.id;

    // Prima il record, poi l'indice: se la scrittura del record fallisce per
    // spazio esaurito, l'indice non resta con un id che punta al nulla.
    final wroteRecord = await _storage.write(
      _keyFor(id),
      jsonEncode(station.toJson()),
    );
    if (!wroteRecord) throw const StationSaveFailedException();

    // Copia modificabile: `readIndex` può restituire una lista costante.
    final index = [...await readIndex()]..remove(id);
    final updated = [id, ...index];
    final wroteIndex = await _storage.write(
      kStationsIndexKey,
      jsonEncode(updated),
    );
    if (!wroteIndex) throw const StationSaveFailedException();
  }

  @override
  Future<void> delete(String id) async {
    final index = [...await readIndex()]..remove(id);
    await _storage.write(kStationsIndexKey, jsonEncode(index));
    await _storage.delete(_keyFor(id));
  }
}

@riverpod
Future<SavedStationsDatasource> savedStationsDatasource(Ref ref) async {
  final storage = await ref.watch(sharedPrefStorageClientProvider.future);
  return PrefsSavedStationsDatasource(storage);
}
