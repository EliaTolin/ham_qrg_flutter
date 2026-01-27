import 'dart:developer';
import 'dart:io';

import 'package:hamqrg/clients/supabase/supabase_client/supabase_client.dart';
import 'package:hamqrg/src/features/profile/data/datasource/profile_datasource.dart';
import 'package:hamqrg/src/features/profile/data/model/profile_model/profile_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'profile_supabase_datasource.g.dart';

class ProfileSupabaseDatasource implements ProfileDatasource {
  ProfileSupabaseDatasource(this._client);
  final SupabaseClient _client;

  @override
  Future<ProfileModel> getProfile(String userId) async {
    try {
      final data = await _client.from('profiles').select().eq('id', userId).single();
      return ProfileModel.fromJson(data);
    } catch (e) {
      log('Error to fetch profile: $e');
      rethrow;
    }
  }

  @override
  Future<void> updateProfile(ProfileModel user) async {
    try {
      await _client.from('profiles').update(user.toJson()).eq('id', user.id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> uploadPropics(String userId, File image) async {
    try {
      final fileName = '/public/$userId-${DateTime.now().millisecondsSinceEpoch}';
      final profile = await getProfile(userId);
      if (profile.propic != null) {
        await _client.storage.from('propics').remove([profile.propic!]);
      }
      await _client.storage.from('propics').upload(
            fileName,
            image,
            fileOptions: const FileOptions(upsert: true),
          );
      await _client
          .from('profiles')
          .update({'propic': fileName})
          .eq('id', userId)
          .onError((error, stackTrace) {
            log('$error', stackTrace: stackTrace);
            if (error is Exception) {
              throw error;
            }
          });
    } catch (e) {
      log('$e');
      rethrow;
    }
  }

  @override
  Future<String> getImagePropicUrl(String path) {
    try {
      return _client.storage.from('propics').createSignedUrl(path, 60);
    } catch (e) {
      log('Error to get propic: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteImagePropic(String userId) async {
    try {
      final profile = await getProfile(userId);
      if (profile.propic != null) {
        await _client.storage.from('propics').remove([profile.propic!]);
        await _client.from('profiles').update({'propic': null}).eq('id', userId);
      }
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
ProfileDatasource profileSupabaseDatasource(Ref ref) {
  return ProfileSupabaseDatasource(ref.read(supabaseClientProvider));
}
