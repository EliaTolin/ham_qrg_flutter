import 'package:ham_qrg/src/features/repeaters_map/data/repository/repeaters_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_favorite_repeater_provider.g.dart';

@riverpod
Future<void> addFavoriteRepeater(
  Ref ref,
  String repeaterId,
) async {
  final repository = ref.read(repeatersRepositoryProvider);
  return repository.addFavoriteRepeater(repeaterId);
}
