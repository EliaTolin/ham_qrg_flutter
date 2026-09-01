// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_stations_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Le postazioni salvate, con le operazioni che le modificano.
///
/// Nessun metodo qui rimuove una postazione se non [delete], invocato solo su
/// azione esplicita dell'utente (FR-051). In particolare un salvataggio che
/// fallisce per spazio esaurito propaga l'errore: **non** libera spazio
/// cancellando postazioni esistenti.
///
/// **`keepAlive` non è un'ottimizzazione: è una condizione di correttezza.**
/// Il salvataggio dalla mappa è un flusso a più passi con un dialog in mezzo —
/// l'utente digita un nome, e nel frattempo passano secondi. Con la
/// distruzione automatica, chi ottiene il notifier con un `ref.read` senza
/// osservarlo se lo ritrova distrutto prima di poter chiamare [save], e il
/// salvataggio muore su un `Ref` già smontato senza che nulla lo segnali. La
/// lista è piccola e serve a più pagine: tenerla viva costa nulla e toglie di
/// mezzo un'intera classe di fallimenti silenziosi.

@ProviderFor(SavedStationsNotifier)
final savedStationsProvider = SavedStationsNotifierProvider._();

/// Le postazioni salvate, con le operazioni che le modificano.
///
/// Nessun metodo qui rimuove una postazione se non [delete], invocato solo su
/// azione esplicita dell'utente (FR-051). In particolare un salvataggio che
/// fallisce per spazio esaurito propaga l'errore: **non** libera spazio
/// cancellando postazioni esistenti.
///
/// **`keepAlive` non è un'ottimizzazione: è una condizione di correttezza.**
/// Il salvataggio dalla mappa è un flusso a più passi con un dialog in mezzo —
/// l'utente digita un nome, e nel frattempo passano secondi. Con la
/// distruzione automatica, chi ottiene il notifier con un `ref.read` senza
/// osservarlo se lo ritrova distrutto prima di poter chiamare [save], e il
/// salvataggio muore su un `Ref` già smontato senza che nulla lo segnali. La
/// lista è piccola e serve a più pagine: tenerla viva costa nulla e toglie di
/// mezzo un'intera classe di fallimenti silenziosi.
final class SavedStationsNotifierProvider
    extends $AsyncNotifierProvider<SavedStationsNotifier, List<SavedStation>> {
  /// Le postazioni salvate, con le operazioni che le modificano.
  ///
  /// Nessun metodo qui rimuove una postazione se non [delete], invocato solo su
  /// azione esplicita dell'utente (FR-051). In particolare un salvataggio che
  /// fallisce per spazio esaurito propaga l'errore: **non** libera spazio
  /// cancellando postazioni esistenti.
  ///
  /// **`keepAlive` non è un'ottimizzazione: è una condizione di correttezza.**
  /// Il salvataggio dalla mappa è un flusso a più passi con un dialog in mezzo —
  /// l'utente digita un nome, e nel frattempo passano secondi. Con la
  /// distruzione automatica, chi ottiene il notifier con un `ref.read` senza
  /// osservarlo se lo ritrova distrutto prima di poter chiamare [save], e il
  /// salvataggio muore su un `Ref` già smontato senza che nulla lo segnali. La
  /// lista è piccola e serve a più pagine: tenerla viva costa nulla e toglie di
  /// mezzo un'intera classe di fallimenti silenziosi.
  SavedStationsNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'savedStationsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$savedStationsNotifierHash();

  @$internal
  @override
  SavedStationsNotifier create() => SavedStationsNotifier();
}

String _$savedStationsNotifierHash() =>
    r'8eb380a4175d89eb6cb53cc2891ed977c4e17364';

/// Le postazioni salvate, con le operazioni che le modificano.
///
/// Nessun metodo qui rimuove una postazione se non [delete], invocato solo su
/// azione esplicita dell'utente (FR-051). In particolare un salvataggio che
/// fallisce per spazio esaurito propaga l'errore: **non** libera spazio
/// cancellando postazioni esistenti.
///
/// **`keepAlive` non è un'ottimizzazione: è una condizione di correttezza.**
/// Il salvataggio dalla mappa è un flusso a più passi con un dialog in mezzo —
/// l'utente digita un nome, e nel frattempo passano secondi. Con la
/// distruzione automatica, chi ottiene il notifier con un `ref.read` senza
/// osservarlo se lo ritrova distrutto prima di poter chiamare [save], e il
/// salvataggio muore su un `Ref` già smontato senza che nulla lo segnali. La
/// lista è piccola e serve a più pagine: tenerla viva costa nulla e toglie di
/// mezzo un'intera classe di fallimenti silenziosi.

abstract class _$SavedStationsNotifier
    extends $AsyncNotifier<List<SavedStation>> {
  FutureOr<List<SavedStation>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<SavedStation>>, List<SavedStation>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<SavedStation>>, List<SavedStation>>,
        AsyncValue<List<SavedStation>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
