import 'package:ham_qrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:ham_qrg/src/features/repeaters/data/repository/repeaters_repository.dart';
import 'package:ham_qrg/src/features/repeaters/provider/get_favorite_repeaters/get_favorite_repeaters_provider.dart';
import 'package:ham_qrg/src/features/repeaters/provider/get_favorite_repeaters_ids/get_favorite_repeaters_ids_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_favorite_repeater_provider.g.dart';

@riverpod
Future<void> addFavoriteRepeater(
  Ref ref,
  String repeaterId,
) async {
  final userId = await ref.watch(getUserIdProvider.future);
  if (userId == null) {
    throw Exception('User not authenticated');
  }
  final repository = ref.read(repeatersRepositoryProvider);
  await repository.addFavoriteRepeater(userId, repeaterId);
  ref.invalidate(getFavoriteRepeatersProvider);
  ref.invalidate(getFavoriteRepeatersIdsProvider);
}
