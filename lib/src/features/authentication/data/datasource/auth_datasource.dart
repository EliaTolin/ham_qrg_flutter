abstract class AuthDatasource {
  String? getUserId();
  Future<void> logout();
  Future<void> deleteAccount();
  Future<String?> getUserIdFromEmail(String email);
  Future<void> changePassword(String password);
  Future<bool> signInGoogle();
  Future<bool> signWithApple();
  Future<String> anonymousSignIn();
  Future<bool> isAnonymous();
}
