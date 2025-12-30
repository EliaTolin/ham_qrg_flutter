import 'package:ham_qrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:ham_qrg/src/features/repeaters_map/data/repository/repeaters_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remove_favorite_repeater_provider.g.dart';

@riverpod
Future<void> removeFavoriteRepeater(
  Ref ref,
  String repeaterId,
) async {
  final userId = await ref.watch(getUserIdProvider.future);
  if (userId == null) {
    throw Exception('User not authenticated');
  }
  final repository = ref.read(repeatersRepositoryProvider);
  return repository.removeFavoriteRepeater(userId, repeaterId);
}
