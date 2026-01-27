import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hamqrg/clients/supabase/supabase_client/supabase_client.dart';
import 'package:hamqrg/src/features/authentication/data/datasource/auth_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

part 'auth_supabase_datasource.g.dart';

class AuthSupabaseDatasource implements AuthDatasource {
  AuthSupabaseDatasource(this.supabaseClient);
  final SupabaseClient supabaseClient;
  @override
  Future<void> changePassword(String password) async {
    await supabaseClient.auth.updateUser(UserAttributes(password: password));
  }

  @override
  Future<void> deleteAccount() async {
    final userId = supabaseClient.auth.currentUser?.id;
    if (userId == null) {
      throw Exception();
    }
    await supabaseClient.from('profiles').update(
      {'deleted_at': DateTime.now().toIso8601String()},
    ).eq('id', userId);
    return;
  }

  @override
  String? getUserId() {
    return supabaseClient.auth.currentUser?.id;
  }

  @override
  Future<String?> getUserIdFromEmail(String email) async {
    try {
      final data = await supabaseClient.rpc('get_user_id_by_email', params: {'email': email});

      if (data is List) {
        final parsedData = data.map((e) => Map<String, String>.from(e as Map)).toList();

        return parsedData[0]['id'];
      } else {
        throw Exception('Invalid data format');
      }
    } on Exception catch (e) {
      log('get_user_id_by_email error: $e');
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await supabaseClient.auth.signOut();
  }

  @override
  Future<bool> signInGoogle() async {
    const webClientId = '45512016232-j0l5f9b3tnf1hp2p60c3pn6g473h0nqv.apps.googleusercontent.com';
    const iosClientId = '45512016232-48r7t9ek849c1dm2mkghlqv1o3l883kj.apps.googleusercontent.com';

    final googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );

    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      throw Exception('Google Sign-In canceled by user.');
    }

    final googleAuth = await googleUser.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null || idToken == null) {
      throw Exception('Authentication failed: Missing token.');
    }

    try {
      // Sign in or create account using Supabase
      final response = await supabaseClient.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      if (response.user == null) {
        throw Exception('Failed to sign in with Google.');
      }

      log('User signed in successfully: ${response.user}');

      final user = response.user;
      if (user == null) {
        throw Exception('Signin con Google non riuscito.');
      }

      // Metadati robusti
      final meta = user.userMetadata ?? {};
      final fullName =
          (meta['full_name'] ?? meta['name'] ?? googleUser.displayName ?? '').toString().trim();
      final parts = fullName.split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
      final firstName = parts.isNotEmpty ? parts.first : null;
      final lastName = parts.length > 1 ? parts.sublist(1).join(' ') : null;

      // Wait trigger to update/insert the profile
      await Future.delayed(const Duration(milliseconds: 500));

      await supabaseClient.from('profiles').update({
        if (firstName != null) 'first_name': firstName,
        if (lastName != null) 'last_name': lastName,
        'updated_at': DateTime.now().toIso8601String(),
      }).eq('id', user.id);
      return true;
    } catch (e) {
      log('Error during Google Sign-In: $e');
      return false;
    }
  }

  @override
  Future<bool> signWithApple() async {
    final rawNonce = supabaseClient.auth.generateRawNonce();
    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: hashedNonce,
    );

    final idToken = credential.identityToken;
    if (idToken == null) {
      throw const AuthException(
        'Could not find ID Token from generated credential.',
      );
    }

    final result = await supabaseClient.auth.signInWithIdToken(
      provider: OAuthProvider.apple,
      idToken: idToken,
      nonce: rawNonce,
    );

    final userId = result.user?.id;
    if (userId == null) {
      throw Exception('Signin con Apple non riuscito.');
    }

    if (credential.familyName != null && credential.givenName != null) {
      await supabaseClient.from('profiles').update({
        'first_name': credential.givenName,
        'last_name': credential.familyName,
      }).eq('id', userId);
    }

    return true;
  }

  @override
  Future<String> anonymousSignIn() async {
    try {
      final response = await supabaseClient.auth.signInAnonymously();
      if (response.user == null) {
        throw Exception('Anonymous Sign-In failed');
      }
      final userId = response.user!.id;
      return userId;
    } catch (e, st) {
      await Sentry.captureException(e, stackTrace: st);
      rethrow;
    }
  }

  @override
  Future<bool> isAnonymous() async {
    final user = supabaseClient.auth.currentUser;
    return user?.isAnonymous ?? false;
  }
}

@riverpod
Future<AuthSupabaseDatasource> authSupabaseDatasource(Ref ref) async {
  final supabaseClient = ref.read(supabaseClientProvider);
  return AuthSupabaseDatasource(supabaseClient);
}
