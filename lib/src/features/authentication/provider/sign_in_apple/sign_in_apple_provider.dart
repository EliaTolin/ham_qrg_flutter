import 'package:hamqrg/src/features/authentication/data/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_apple_provider.g.dart';

@riverpod
Future<bool> signInWithApple(Ref ref) async {
  final repository = await ref.read(authRepositoryProvider.future);
  final result = await repository.signWithApple();
  return result;
}
