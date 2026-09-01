import 'dart:io';
import 'package:hamqrg/common/cache/offline_cache_gate.dart';
import 'package:hamqrg/src/features/profile/data/datasource/profile_datasource.dart';
import 'package:hamqrg/src/features/profile/data/model/profile_model/profile_model.dart';
import 'package:remote_caching/remote_caching.dart';

/// Decorator offline-first di [ProfileDatasource].
///
/// Stesso schema di `CachedRepeatersDatasource`: corto-circuito + timeout su
/// ogni chiamata remota per tutti, cache network-first di [getProfile] per i
/// Pro (chiave `profile:v1:<userId>`). Le scritture delegano e invalidano il
/// prefisso, così la rilettura successiva non serve un profilo stantio.
class CachedProfileDatasource implements ProfileDatasource {
  CachedProfileDatasource({
    required ProfileDatasource inner,
    required OfflineCacheGate gate,
  })  : _inner = inner,
        _gate = gate;

  final ProfileDatasource _inner;
  final OfflineCacheGate _gate;

  /// 6s: come CachedRepeatersDatasource — su rete degradata la ricaduta
  /// sulla cache deve arrivare in tempi tollerabili per la UI.
  static const remoteTimeout = Duration(seconds: 6);
  static const _profileTtl = Duration(days: 30);

  @override
  Future<ProfileModel> getProfile(String userId) => _gate.cached(
        key: 'profile:v1:$userId',
        ttl: _profileTtl,
        fetch: () => _inner.getProfile(userId),
        fromJson: (json) =>
            ProfileModel.fromJson(json! as Map<String, dynamic>),
      );

  @override
  Future<void> updateProfile(ProfileModel user) async {
    await _gate.remote(() => _inner.updateProfile(user));
    await RemoteCaching.instance.clearCacheByPrefix('profile:v1:${user.id}');
  }

  @override
  Future<void> uploadPropics(String userId, File image) async {
    // Nessun timeout: l'upload di una foto su una connessione lenta può
    // legittimamente superare il tetto imposto alle altre chiamate.
    await _gate.remoteUnbounded(() => _inner.uploadPropics(userId, image));
    await RemoteCaching.instance.clearCacheByPrefix('profile:v1:$userId');
  }

  @override
  Future<String> getImagePropicUrl(String path) {
    // L'URL firmato ha già la sua cache in `ImageCachingService` (repository).
    return _gate.remote(() => _inner.getImagePropicUrl(path));
  }

  @override
  Future<void> deleteImagePropic(String userId) async {
    await _gate.remote(() => _inner.deleteImagePropic(userId));
    await RemoteCaching.instance.clearCacheByPrefix('profile:v1:$userId');
  }
}
