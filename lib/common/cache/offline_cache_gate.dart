import 'package:hamqrg/common/errors/offline_exception.dart';
import 'package:remote_caching/remote_caching.dart';

/// Politica condivisa dei decorator offline-first dei datasource.
///
/// Racchiude le due decisioni che ogni decorator prendeva per conto suo:
///
/// 1. **Guard sulla chiamata remota** ([remote]): offline fallisce subito con
///    [OfflineException] — così il fallback network-first scatta all'istante
///    invece di aspettare un timeout — e online, se [remoteTimeout] è
///    impostato, la chiamata ha comunque un tetto (il client HTTP di Supabase
///    non ne ha uno proprio).
/// 2. **Cache network-first solo per i Pro** ([cached], [cachedNullable]):
///    online il dato è sempre fresco e riscrive la voce, offline
///    `remote_caching` ricade sulla copia locale anche scaduta. I free user
///    bypassano la cache e tengono il comportamento di sempre (più il guard).
///
/// I flag sono catturati alla costruzione: il datasource si ricostruisce al
/// cambio di connettività o entitlement (vedi `OfflineCacheGateRef`).
class OfflineCacheGate {
  const OfflineCacheGate({
    required this.isPro,
    required this.isOffline,
    this.remoteTimeout,
  });

  final bool isPro;
  final bool isOffline;

  /// Tetto di tempo per le chiamate passate da [remote]; `null` = nessuno
  /// (servizi che legittimamente impiegano minuti, come il coverage).
  final Duration? remoteTimeout;

  /// Chiamata remota con guard offline e [remoteTimeout].
  Future<T> remote<T>(Future<T> Function() call) async {
    if (isOffline) throw const OfflineException();
    final timeout = remoteTimeout;
    return timeout == null ? call() : call().timeout(timeout);
  }

  /// Come [remote] ma senza tetto di tempo: per operazioni lunghe per natura
  /// (upload di file) anche quando il gate ne impone uno alle altre.
  Future<T> remoteUnbounded<T>(Future<T> Function() call) async {
    if (isOffline) throw const OfflineException();
    return call();
  }

  /// Lettura con cache network-first per i Pro; per i free delega soltanto
  /// (con il guard di [remote]).
  Future<T> cached<T>({
    required String key,
    required Duration ttl,
    required Future<T> Function() fetch,
    required T Function(Object? json) fromJson,
  }) {
    if (!isPro) return remote(fetch);
    return RemoteCaching.instance.call<T>(
      key,
      cacheDuration: ttl,
      strategy: CacheStrategy.networkFirst,
      remote: () => remote(fetch),
      fromJson: fromJson,
    );
  }

  /// Variante per risultati nullabili: un `null` non è distinguibile da una
  /// voce assente, quindi il valore viaggia dentro una busta `{'value': ...}`.
  Future<T?> cachedNullable<T>({
    required String key,
    required Duration ttl,
    required Future<T?> Function() fetch,
    required Object? Function(T value) encode,
    required T Function(Object? json) decode,
  }) async {
    if (!isPro) return remote(fetch);
    final box = await RemoteCaching.instance.call<Map<String, dynamic>>(
      key,
      cacheDuration: ttl,
      strategy: CacheStrategy.networkFirst,
      remote: () async {
        final value = await remote(fetch);
        return <String, dynamic>{
          'value': value == null ? null : encode(value),
        };
      },
      fromJson: (json) => Map<String, dynamic>.from(json! as Map),
    );
    final raw = box['value'];
    return raw == null ? null : decode(raw);
  }
}
