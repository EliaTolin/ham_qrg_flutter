import 'dart:convert';

import 'package:hamqrg/clients/storage/impl/shared_pref_storage_client/shared_pref_storage_client.dart';
import 'package:hamqrg/clients/storage/storage_client.dart';
import 'package:hamqrg/src/features/coverage_search/domain/recent_search.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recent_searches_repository.g.dart';

/// Chiave della cronologia locale delle ricerche.
const String kRecentSearchesKey = 'coverage_search.recent';

/// Cronologia locale delle ricerche (FR-010).
///
/// Non è un dato dell'utente da proteggere come le postazioni salvate: se si
/// perde, si perde una scorciatoia. Per questo ogni errore di lettura degrada a
/// lista vuota invece di propagarsi.
class RecentSearchesRepository {
  RecentSearchesRepository(this._storage);

  final StorageClient _storage;

  Future<List<RecentSearch>> readAll() async {
    final raw = await _storage.read(kRecentSearchesKey);
    if (raw == null || raw.isEmpty) return const [];

    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return const [];
      return decoded
          .whereType<Map<String, dynamic>>()
          .map(RecentSearch.fromJson)
          .nonNulls
          .toList();
    } on FormatException {
      return const [];
    }
  }

  /// Registra [point] in testa alla cronologia.
  ///
  /// Un punto già presente viene spostato in testa invece che duplicato: due
  /// voci identiche sprecherebbero lo spazio limitato del pannello. Il
  /// confronto usa la stessa soglia di prossimità del duplicato fra postazioni,
  /// così che due tocchi sullo stesso posto non producano due righe.
  Future<void> record(SearchPoint point, {required DateTime now}) async {
    final existing = await readAll();
    final deduplicated =
        existing.where((r) => !r.toSearchPoint().isSamePlace(point)).toList();

    final updated = [
      RecentSearch.fromPoint(point, usedAt: now),
      ...deduplicated,
    ].take(kMaxRecentSearches).toList();

    await _storage.write(
      kRecentSearchesKey,
      jsonEncode(updated.map((r) => r.toJson()).toList()),
    );
  }

  Future<void> clear() => _storage.delete(kRecentSearchesKey);
}

@riverpod
Future<RecentSearchesRepository> recentSearchesRepository(Ref ref) async {
  final storage = await ref.watch(sharedPrefStorageClientProvider.future);
  return RecentSearchesRepository(storage);
}
