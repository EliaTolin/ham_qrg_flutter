// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_cache_lifecycle_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
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

@ProviderFor(offlineCacheLifecycle)
final offlineCacheLifecycleProvider = OfflineCacheLifecycleProvider._();

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

final class OfflineCacheLifecycleProvider
    extends $FunctionalProvider<void, void, void> with $Provider<void> {
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
  OfflineCacheLifecycleProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'offlineCacheLifecycleProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$offlineCacheLifecycleHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return offlineCacheLifecycle(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$offlineCacheLifecycleHash() =>
    r'5d603b4d323476294dedab91dcef570cb8cb088a';
