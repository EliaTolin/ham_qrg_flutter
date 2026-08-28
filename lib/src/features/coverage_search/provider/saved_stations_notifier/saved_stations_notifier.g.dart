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

@ProviderFor(SavedStationsNotifier)
final savedStationsProvider = SavedStationsNotifierProvider._();

/// Le postazioni salvate, con le operazioni che le modificano.
///
/// Nessun metodo qui rimuove una postazione se non [delete], invocato solo su
/// azione esplicita dell'utente (FR-051). In particolare un salvataggio che
/// fallisce per spazio esaurito propaga l'errore: **non** libera spazio
/// cancellando postazioni esistenti.
final class SavedStationsNotifierProvider
    extends $AsyncNotifierProvider<SavedStationsNotifier, List<SavedStation>> {
  /// Le postazioni salvate, con le operazioni che le modificano.
  ///
  /// Nessun metodo qui rimuove una postazione se non [delete], invocato solo su
  /// azione esplicita dell'utente (FR-051). In particolare un salvataggio che
  /// fallisce per spazio esaurito propaga l'errore: **non** libera spazio
  /// cancellando postazioni esistenti.
  SavedStationsNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'savedStationsProvider',
          isAutoDispose: true,
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
    r'c5e83f08ca7ee666c59e8491587328a8b2e85b4f';

/// Le postazioni salvate, con le operazioni che le modificano.
///
/// Nessun metodo qui rimuove una postazione se non [delete], invocato solo su
/// azione esplicita dell'utente (FR-051). In particolare un salvataggio che
/// fallisce per spazio esaurito propaga l'errore: **non** libera spazio
/// cancellando postazioni esistenti.

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
