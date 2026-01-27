import 'package:hamqrg/src/features/authentication/data/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'change_password_provider.g.dart';

@riverpod
Future<void> changePassword(Ref ref, String password) async {
  final authRepository = await ref.read(authRepositoryProvider.future);
  return authRepository.changePassword(password);
}
