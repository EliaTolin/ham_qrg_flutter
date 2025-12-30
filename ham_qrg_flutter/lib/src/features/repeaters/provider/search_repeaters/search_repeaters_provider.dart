import 'package:ham_qrg/src/features/repeaters/data/repository/repeaters_repository.dart';
import 'package:ham_qrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_repeaters_provider.g.dart';

@riverpod
Future<List<Repeater>> searchRepeaters(
  Ref ref, {
  required String query,
  int limit = 100,
  List<RepeaterMode>? modes,
}) async {
  if (query.trim().isEmpty) {
    return [];
  }

  final repository = ref.read(repeatersRepositoryProvider);
  return repository.searchRepeaters(
    query: query.trim(),
    limit: limit,
    modes: modes,
  );
}
