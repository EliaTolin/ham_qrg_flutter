import 'dart:io';

import 'package:hamqrg/common/service/image_caching/image_caching_service/image_caching_service.dart';
import 'package:hamqrg/src/features/profile/data/datasource/profile_datasource.dart';
import 'package:hamqrg/src/features/profile/data/datasource/profile_supabase_datasource.dart';
import 'package:hamqrg/src/features/profile/data/mappers/profile_mappers.dart';
import 'package:hamqrg/src/features/profile/domain/profile/profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_repository.g.dart';

class ProfileRepository {
  ProfileRepository(this._profileDatasource, this.imageCachingService);
  final ImageCachingService imageCachingService;
  final ProfileDatasource _profileDatasource;

  Future<void> updateProfile(Profile profile) async {
    return _profileDatasource.updateProfile(ProfileMappers().toModel(profile));
  }

  Future<Profile> getProfile(String userId) async {
    return ProfileMappers().fromModel(await _profileDatasource.getProfile(userId));
  }

  Future<void> uploadPropics(String userId, File image) async {
    await imageCachingService.deleteCachedImage(userId);
    return _profileDatasource.uploadPropics(userId, image);
  }

  Future<String> getImagePropicUrl(String userId) async {
    final cachedUrl = await imageCachingService.getCachedImage(userId);
    if (cachedUrl != null) {
      return cachedUrl.url;
    }
    final propic = await _profileDatasource.getImagePropicUrl(userId);
    await imageCachingService.cacheImage(
      imageId: userId,
      url: propic,
      path: 'propic',
    );
    return propic;
  }

  Future<void> deleteImagePropic(String userId) async {
    await imageCachingService.deleteCachedImage(userId);
    return _profileDatasource.deleteImagePropic(userId);
  }
}

@riverpod
Future<ProfileRepository> profileRepository(Ref ref) async {
  final datasource = ref.read(profileSupabaseDatasourceProvider);
  final imageCachingService = await ref.read(imageCachingServiceProvider.future);
  return ProfileRepository(datasource, imageCachingService);
}
