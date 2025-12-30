import 'package:ham_qrg/src/features/repeaters_map/data/repository/repeaters_repository.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_favorite_repeaters_provider.g.dart';

@riverpod
Future<List<Repeater>> getFavoriteRepeaters(Ref ref) async {
  final repository = ref.read(repeatersRepositoryProvider);
  return repository.getFavoriteRepeaters();
}
