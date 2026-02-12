import 'package:hamqrg/src/features/authentication/data/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_user_id_from_email_provider.g.dart';

@riverpod
Future<String?> getUserIdFromEmail(Ref ref, String email) async {
  final authRepository = await ref.watch(authRepositoryProvider.future);
  return authRepository.getUserIdFromEmail(email);
}
