import 'package:hamqrg/src/features/authentication/data/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_google_provider.g.dart';

@riverpod
Future<bool> signInWithGoogle(Ref ref) async {
  final repository = await ref.read(authRepositoryProvider.future);
  final result = await repository.signinWithGoogle();
  return result;
}
