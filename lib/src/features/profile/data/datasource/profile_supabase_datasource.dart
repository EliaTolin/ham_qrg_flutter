import 'dart:io';

import 'package:hamqrg/clients/supabase/supabase_client/supabase_client.dart';
import 'package:hamqrg/log/talker_service/talker_service.dart';
import 'package:hamqrg/src/features/profile/data/datasource/profile_datasource.dart';
import 'package:hamqrg/src/features/profile/data/model/profile_model/profile_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'profile_supabase_datasource.g.dart';

class ProfileSupabaseDatasource implements ProfileDatasource {
  ProfileSupabaseDatasource(this._client, this._talker);
  final SupabaseClient _client;
  final Talker _talker;

  void _logTiming(String method, Stopwatch sw, {String? extra}) {
    final ms = sw.elapsedMilliseconds;
    final emoji = ms < 200
        ? '🟢'
        : ms < 400
            ? '🟡'
            : '🔴';
    final detail = extra != null ? ' ($extra)' : '';
    _talker.log('$emoji [$method] ${ms}ms$detail');
  }

  @override
  Future<ProfileModel> getProfile(String userId) async {
    final sw = Stopwatch()..start();
    try {
      final data =
          await _client.from('profiles').select().eq('id', userId).single();
      _logTiming('getProfile', sw, extra: '✅ found');
      return ProfileModel.fromJson(data);
    } catch (error, stackTrace) {
      _logTiming('getProfile', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error fetching profile');
      rethrow;
    }
  }

  @override
  Future<void> updateProfile(ProfileModel user) async {
    final sw = Stopwatch()..start();
    try {
      await _client.from('profiles').update(user.toJson()).eq('id', user.id);
      _logTiming('updateProfile', sw);
    } catch (error, stackTrace) {
      _logTiming('updateProfile', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error updating profile');
      rethrow;
    }
  }

  @override
  Future<void> uploadPropics(String userId, File image) async {
    final sw = Stopwatch()..start();
    try {
      final fileName =
          '/public/$userId-${DateTime.now().millisecondsSinceEpoch}';
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
          .update({'propic': fileName}).eq('id', userId);
      _logTiming('uploadPropics', sw);
    } catch (error, stackTrace) {
      _logTiming('uploadPropics', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error uploading propic');
      rethrow;
    }
  }

  @override
  Future<String> getImagePropicUrl(String path) async {
    final sw = Stopwatch()..start();
    try {
      final url =
          await _client.storage.from('propics').createSignedUrl(path, 60);
      _logTiming('getImagePropicUrl', sw);
      return url;
    } catch (error, stackTrace) {
      _logTiming('getImagePropicUrl', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error getting propic url');
      rethrow;
    }
  }

  @override
  Future<void> deleteImagePropic(String userId) async {
    final sw = Stopwatch()..start();
    try {
      final profile = await getProfile(userId);
      if (profile.propic != null) {
        await _client.storage.from('propics').remove([profile.propic!]);
        await _client
            .from('profiles')
            .update({'propic': null}).eq('id', userId);
      }
      _logTiming('deleteImagePropic', sw);
    } catch (error, stackTrace) {
      _logTiming('deleteImagePropic', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error deleting propic');
      rethrow;
    }
  }
}

@riverpod
ProfileDatasource profileSupabaseDatasource(Ref ref) {
  return ProfileSupabaseDatasource(
    ref.read(supabaseClientProvider),
    ref.read(talkerServiceProvider),
  );
}
