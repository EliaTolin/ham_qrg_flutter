import 'package:hamqrg/clients/storage/impl/shared_pref_storage_client/shared_pref_storage_client.dart';
import 'package:hamqrg/clients/storage/storage_client.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_breadth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_breadth_repository.g.dart';

/// Chiave dell'ultima ampiezza scelta dall'utente.
const String kSearchBreadthKey = 'coverage_search.breadth';

/// Ricorda l'ampiezza di ricerca fra una sessione e l'altra (FR-026).
///
/// Vive separata da `CoverageSearchRepository` perché lo `StorageClient` si
/// ottiene in modo asincrono: fonderle costringerebbe anche la geocodifica,
/// che è sincrona, a passare da un `FutureProvider` senza alcun beneficio.
class SearchBreadthRepository {
  SearchBreadthRepository(this._storage);

  final StorageClient _storage;

  Future<SearchBreadth> read() async {
    final raw = await _storage.read(kSearchBreadthKey);
    return SearchBreadth.fromName(raw);
  }

  Future<void> write(SearchBreadth breadth) =>
      _storage.write(kSearchBreadthKey, breadth.name);
}

@riverpod
Future<SearchBreadthRepository> searchBreadthRepository(Ref ref) async {
  final storage = await ref.watch(sharedPrefStorageClientProvider.future);
  return SearchBreadthRepository(storage);
}
