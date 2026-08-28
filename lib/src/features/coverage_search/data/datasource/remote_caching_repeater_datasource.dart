import 'package:hamqrg/src/features/coverage_search/data/datasource/repeater_cache_datasource.dart';
import 'package:hamqrg/src/features/coverage_search/data/model/cached_repeater_model.dart';
import 'package:hamqrg/src/features/coverage_search/domain/cached_repeater.dart';
import 'package:hamqrg/src/features/repeaters/data/mappers/repeaters_mappers.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';
import 'package:remote_caching/remote_caching.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_caching_repeater_datasource.g.dart';

/// Cache condivisa dei ripetitori su `remote_caching`.
///
/// ## Due invarianti che il compilatore non può imporre
///
/// **INV-1 — non chiamare mai `RemoteCaching.instance.clearCache()`.** Svuota
/// l'intera tabella e con essa l'offline di ogni postazione salvata. Per
/// invalidare un altro dominio si usa `clearCacheByPrefix` sul suo prefisso.
///
/// **INV-2 — ogni voce `repeater:` si scrive con [kNeverExpires].** Qui è
/// garantita per costruzione: [_write] è l'unico punto di scrittura e la
/// scadenza non è un suo parametro, quindi nessun chiamante può dimenticarla.
class RemoteCachingRepeaterDatasource implements RepeaterCacheDatasource {
  RemoteCachingRepeaterDatasource(this._cache);

  final RemoteCaching _cache;
  final _mapper = RepeatersMappers();

  String _keyFor(String repeaterId) => '$kRepeaterCachePrefix$repeaterId';

  @override
  Future<CachedRepeater?> readCached(String repeaterId) async {
    try {
      final model = await _cache.call<CachedRepeaterModel>(
        _keyFor(repeaterId),
        cacheExpiring: kNeverExpires,
        // Con una voce che non scade mai, `cacheFirst` restituisce sempre la
        // copia locale e questo `remote` non viene mai invocato. Se lo fosse,
        // significherebbe che la voce manca: si segnala con un'eccezione
        // catturata qui sotto, che diventa un `null`.
        remote: () async => throw const _CacheMiss(),
        fromJson: CachedRepeaterModel.fromJson,
      );
      return CachedRepeater(
        repeater: _mapper.fromModel(model.repeater),
        cachedAt: model.cachedAt,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Future<Repeater> readFresh(
    String repeaterId, {
    required Future<Repeater> Function() remote,
  }) async {
    final model = await _cache.call<CachedRepeaterModel>(
      _keyFor(repeaterId),
      cacheExpiring: kNeverExpires,
      // `networkFirst`: online prende il dato fresco e riscrive la voce — è
      // qui che una postazione salvata mesi fa si aggiorna da sola. Offline,
      // il pacchetto ricade sulla copia conservata.
      strategy: CacheStrategy.networkFirst,
      remote: () async => CachedRepeaterModel(
        repeater: _mapper.toModel(await remote()),
        cachedAt: DateTime.now(),
      ),
      fromJson: CachedRepeaterModel.fromJson,
    );
    return _mapper.fromModel(model.repeater);
  }

  @override
  Future<void> writeAll(List<Repeater> repeaters) async {
    for (final repeater in repeaters) {
      await _write(repeater);
    }
  }

  /// Unico punto di scrittura del prefisso `repeater:` (INV-2).
  Future<void> _write(Repeater repeater) async {
    final now = DateTime.now();
    await _cache.call<CachedRepeaterModel>(
      _keyFor(repeater.id),
      cacheExpiring: kNeverExpires,
      forceRefresh: true,
      remote: () async => CachedRepeaterModel(
        repeater: _mapper.toModel(repeater),
        cachedAt: now,
      ),
      fromJson: CachedRepeaterModel.fromJson,
    );
  }
}

/// Segnala che la voce non è in cache. Non esce mai dal datasource.
class _CacheMiss implements Exception {
  const _CacheMiss();
}

@Riverpod(keepAlive: true)
RepeaterCacheDatasource repeaterCacheDatasource(Ref ref) {
  return RemoteCachingRepeaterDatasource(RemoteCaching.instance);
}
