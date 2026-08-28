import 'package:hamqrg/src/features/coverage_search/data/repository/recent_searches_repository.dart';
import 'package:hamqrg/src/features/coverage_search/domain/recent_search.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recent_searches_provider.g.dart';

/// Ricerche recenti, riproposte quando la barra è vuota (FR-010).
@riverpod
Future<List<RecentSearch>> recentSearches(Ref ref) async {
  final repository = await ref.watch(recentSearchesRepositoryProvider.future);
  return repository.readAll();
}
