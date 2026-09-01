import 'dart:async';

import 'package:hamqrg/src/features/repeaters/service/coverage_image_cache.dart';
import 'package:hamqrg/src/features/subscriptions/provider/is_pro/is_pro_provider.dart';
import 'package:remote_caching/remote_caching.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'offline_cache_lifecycle_provider.g.dart';

/// Sorveglia l'entitlement Pro e, alla transizione osservata `true → false`
/// (scadenza abbonamento, o logout da un account Pro), svuota le cache
/// offline riservate ai Pro: chi smette di pagare non continua a consultare
/// dati Pro dal disco.
///
/// Reagisce SOLO a una transizione osservata — mai al primo valore — così il
/// `false` transitorio dei primi frame (stream non ancora emesso) non
/// cancella nulla.
///
/// Non tocca `repeater:v1:` (postazioni salvate — dato utente, invariante
/// INV-1 in CLAUDE.md) e non usa mai `clearCache()`.
///
/// Montato dalla splash con `ref.read` (keepAlive).
@Riverpod(keepAlive: true)
void offlineCacheLifecycle(Ref ref) {
  ref.listen(isProProvider, (previous, next) {
    final wasPro = previous?.value ?? false;
    final isProNow = next.value ?? false;
    if (wasPro && !isProNow) {
      unawaited(_clearProCaches(ref.read(coverageImageCacheProvider)));
    }
  });
}

Future<void> _clearProCaches(CoverageImageCache imageCache) async {
  // La cache non è mai una dipendenza dura: se non è inizializzata la
  // pulizia semplicemente non ha nulla da pulire.
  try {
    final cache = RemoteCaching.instance;
    await cache.clearCacheByPrefix('repeaters:v1:');
    await cache.clearCacheByPrefix('favorites:v1:');
    await cache.clearCacheByPrefix('feedback:v1:');
    await cache.clearCacheByPrefix('profile:v1:');
    await cache.clearCacheByPrefix('pro:v1:');
    await imageCache.clearAll();
  } catch (_) {
    // Ignorato: al prossimo avvio con Pro attivo la cache si ripopola.
  }
}
