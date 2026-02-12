import 'package:hamqrg/src/features/authentication/data/datasource/auth_datasource.dart';
import 'package:hamqrg/src/features/authentication/data/datasource/auth_supabase_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository(this.authDatasource);
  final AuthDatasource authDatasource;

  Future<void> changePassword(String password) {
    return authDatasource.changePassword(password);
  }

  Future<void> deleteAccount() {
    return authDatasource.deleteAccount();
  }

  String? getUserId() {
    final userId = authDatasource.getUserId();
    return userId;
  }

  Future<String?> getUserIdFromEmail(String email) {
    return authDatasource.getUserIdFromEmail(email);
  }

  Future<void> logout() {
    return authDatasource.logout();
  }

  Future<bool> signinWithGoogle() {
    return authDatasource.signInGoogle();
  }

  Future<bool> signWithApple() {
    return authDatasource.signWithApple();
  }

  Future<String> anonymousSignIn() {
    return authDatasource.anonymousSignIn();
  }

  Future<bool> isAnonymous() {
    return authDatasource.isAnonymous();
  }
}

@riverpod
Future<AuthRepository> authRepository(Ref ref) async {
  final authDatasource = await ref.watch(authSupabaseDatasourceProvider.future);
  return AuthRepository(authDatasource);
}
