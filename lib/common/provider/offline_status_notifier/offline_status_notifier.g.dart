// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_status_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Stato offline dell'app: `true` quando il backend non è raggiungibile.
///
/// **A dire come stanno le cose è un solo segnale: il probe.** Una richiesta
/// leggera all'endpoint di health di Supabase, con timeout stretto. Qualunque
/// risposta HTTP conta come raggiungibile — anche 401 o 404 — perché la
/// domanda è solo "risponde o no"; solo l'assenza di risposta è offline.
///
/// `connectivity_plus` dice **quando** riprovare, mai **cosa** è vero. È una
/// distinzione pagata: la sua istantanea può riportare `none` su una rete che
/// funziona benissimo — succede sul simulatore iOS, e sui primi millisecondi
/// dopo il lancio mentre lo stack di rete si sta ancora alzando. Finché quel
/// `none` valeva come verdetto immediato, sovrascriveva un probe appena
/// riuscito e metteva l'intera app in modalità offline: la splash saltava
/// tutti i passi di rete, i datasource fallivano all'istante con
/// `OfflineException`, e la home si disegnava vuota su una connessione
/// perfetta. Il segnale dell'interfaccia non ha alcun modo di sapere se il
/// backend risponde; il probe sì, e costa una richiesta.
///
/// Letto sincrono dai datasource come `.value ?? false`; la splash lo risolve
/// (`.future`) prima di qualsiasi chiamata dati, così il primo fetch parte già
/// con lo stato giusto. [refresh] forza una rivalutazione.

@ProviderFor(OfflineStatusNotifier)
final offlineStatusProvider = OfflineStatusNotifierProvider._();

/// Stato offline dell'app: `true` quando il backend non è raggiungibile.
///
/// **A dire come stanno le cose è un solo segnale: il probe.** Una richiesta
/// leggera all'endpoint di health di Supabase, con timeout stretto. Qualunque
/// risposta HTTP conta come raggiungibile — anche 401 o 404 — perché la
/// domanda è solo "risponde o no"; solo l'assenza di risposta è offline.
///
/// `connectivity_plus` dice **quando** riprovare, mai **cosa** è vero. È una
/// distinzione pagata: la sua istantanea può riportare `none` su una rete che
/// funziona benissimo — succede sul simulatore iOS, e sui primi millisecondi
/// dopo il lancio mentre lo stack di rete si sta ancora alzando. Finché quel
/// `none` valeva come verdetto immediato, sovrascriveva un probe appena
/// riuscito e metteva l'intera app in modalità offline: la splash saltava
/// tutti i passi di rete, i datasource fallivano all'istante con
/// `OfflineException`, e la home si disegnava vuota su una connessione
/// perfetta. Il segnale dell'interfaccia non ha alcun modo di sapere se il
/// backend risponde; il probe sì, e costa una richiesta.
///
/// Letto sincrono dai datasource come `.value ?? false`; la splash lo risolve
/// (`.future`) prima di qualsiasi chiamata dati, così il primo fetch parte già
/// con lo stato giusto. [refresh] forza una rivalutazione.
final class OfflineStatusNotifierProvider
    extends $AsyncNotifierProvider<OfflineStatusNotifier, bool> {
  /// Stato offline dell'app: `true` quando il backend non è raggiungibile.
  ///
  /// **A dire come stanno le cose è un solo segnale: il probe.** Una richiesta
  /// leggera all'endpoint di health di Supabase, con timeout stretto. Qualunque
  /// risposta HTTP conta come raggiungibile — anche 401 o 404 — perché la
  /// domanda è solo "risponde o no"; solo l'assenza di risposta è offline.
  ///
  /// `connectivity_plus` dice **quando** riprovare, mai **cosa** è vero. È una
  /// distinzione pagata: la sua istantanea può riportare `none` su una rete che
  /// funziona benissimo — succede sul simulatore iOS, e sui primi millisecondi
  /// dopo il lancio mentre lo stack di rete si sta ancora alzando. Finché quel
  /// `none` valeva come verdetto immediato, sovrascriveva un probe appena
  /// riuscito e metteva l'intera app in modalità offline: la splash saltava
  /// tutti i passi di rete, i datasource fallivano all'istante con
  /// `OfflineException`, e la home si disegnava vuota su una connessione
  /// perfetta. Il segnale dell'interfaccia non ha alcun modo di sapere se il
  /// backend risponde; il probe sì, e costa una richiesta.
  ///
  /// Letto sincrono dai datasource come `.value ?? false`; la splash lo risolve
  /// (`.future`) prima di qualsiasi chiamata dati, così il primo fetch parte già
  /// con lo stato giusto. [refresh] forza una rivalutazione.
  OfflineStatusNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'offlineStatusProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$offlineStatusNotifierHash();

  @$internal
  @override
  OfflineStatusNotifier create() => OfflineStatusNotifier();
}

String _$offlineStatusNotifierHash() =>
    r'09edcdef1fd1884a5320b76974a1fa909f3da91b';

/// Stato offline dell'app: `true` quando il backend non è raggiungibile.
///
/// **A dire come stanno le cose è un solo segnale: il probe.** Una richiesta
/// leggera all'endpoint di health di Supabase, con timeout stretto. Qualunque
/// risposta HTTP conta come raggiungibile — anche 401 o 404 — perché la
/// domanda è solo "risponde o no"; solo l'assenza di risposta è offline.
///
/// `connectivity_plus` dice **quando** riprovare, mai **cosa** è vero. È una
/// distinzione pagata: la sua istantanea può riportare `none` su una rete che
/// funziona benissimo — succede sul simulatore iOS, e sui primi millisecondi
/// dopo il lancio mentre lo stack di rete si sta ancora alzando. Finché quel
/// `none` valeva come verdetto immediato, sovrascriveva un probe appena
/// riuscito e metteva l'intera app in modalità offline: la splash saltava
/// tutti i passi di rete, i datasource fallivano all'istante con
/// `OfflineException`, e la home si disegnava vuota su una connessione
/// perfetta. Il segnale dell'interfaccia non ha alcun modo di sapere se il
/// backend risponde; il probe sì, e costa una richiesta.
///
/// Letto sincrono dai datasource come `.value ?? false`; la splash lo risolve
/// (`.future`) prima di qualsiasi chiamata dati, così il primo fetch parte già
/// con lo stato giusto. [refresh] forza una rivalutazione.

abstract class _$OfflineStatusNotifier extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<bool>, bool>,
        AsyncValue<bool>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
