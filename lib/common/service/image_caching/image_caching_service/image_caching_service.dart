import 'dart:convert';

import 'package:hamqrg/clients/storage/impl/shared_pref_storage_client/shared_pref_storage_client.dart';
import 'package:hamqrg/clients/storage/storage_client.dart';
import 'package:hamqrg/common/entity/image_entity.dart';
import 'package:hamqrg/common/service/image_caching/model/image_cached/image_cached.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_caching_service.g.dart';

class ImageCachingService {
  ImageCachingService({required this.storageClient});
  final StorageClient storageClient;

  Future<void> cacheImage({
    required String imageId,
    required String path,
    required String url,
    DateTime? expiring,
  }) async {
    final imageCached = ImageCached(
      expiresAt:
          expiring ?? DateTime.now().add(Duration(days: AppConfigs.defaultExpiresInSecondsImage())),
      url: url,
      path: path,
    );
    await storageClient.write(
      'image_cached_$imageId',
      jsonEncode(imageCached.toJson()),
    );
  }

  Future<ImageEntity?> getCachedImage(String imageId) async {
    final cachedImage = await storageClient.read('image_cached_$imageId');
    if (cachedImage == null) {
      return null;
    }
    final imageCached = ImageCached.fromJson(jsonDecode(cachedImage));
    if (imageCached.expiresAt.isBefore(DateTime.now())) {
      await deleteCachedImage(imageId);
      return null;
    }
    return ImageEntity(path: imageCached.path, url: imageCached.url);
  }

  Future<void> deleteCachedImage(String imageId) async {
    await storageClient.delete('image_cached_$imageId');
  }

  Future<void> deleteAllCachedImages() async {
    final allKeys = await storageClient.getAllKeys();
    for (final key in allKeys) {
      if (key.startsWith('image_cached_')) {
        await storageClient.delete(key);
      }
    }
  }
}

@riverpod
Future<ImageCachingService> imageCachingService(Ref ref) async {
  final storageClient = await ref.watch(sharedPrefStorageClientProvider.future);
  return ImageCachingService(storageClient: storageClient);
}
