import 'package:ham_qrg/src/features/repeaters_map/data/repository/repeaters_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remove_favorite_repeater_provider.g.dart';

@riverpod
Future<void> removeFavoriteRepeater(
  Ref ref,
  String repeaterId,
) async {
  final repository = ref.read(repeatersRepositoryProvider);
  return repository.removeFavoriteRepeater(repeaterId);
}
