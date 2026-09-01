import 'dart:async';

import 'package:hamqrg/src/features/coverage_search/data/repository/saved_stations_repository.dart';
import 'package:hamqrg/src/features/coverage_search/domain/coverage_result.dart';
import 'package:hamqrg/src/features/coverage_search/domain/saved_station.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';
import 'package:hamqrg/src/features/coverage_search/provider/evaluate_point/evaluate_point_provider.dart';
import 'package:hamqrg/src/features/coverage_search/provider/saved_stations_notifier/bulk_refresh_progress.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'saved_stations_notifier.g.dart';

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
@Riverpod(keepAlive: true)
class SavedStationsNotifier extends _$SavedStationsNotifier {
  @override
  Future<List<SavedStation>> build() async {
    final repository = await ref.watch(savedStationsRepositoryProvider.future);
    return repository.readAll();
  }

  /// Salva una valutazione appena eseguita.
  ///
  /// Se esiste già una postazione entro 200 m, la aggiorna invece di crearne
  /// una gemella — ma solo quando [replaceId] lo indica: la decisione se
  /// aggiornare o creare una voce distinta resta all'utente (FR-048).
  Future<void> save({
    required CoverageEvaluation evaluation,
    required String name,
    String? replaceId,
  }) async {
    final repository = await ref.read(savedStationsRepositoryProvider.future);
    final now = DateTime.now();

    final station = SavedStation(
      id: replaceId ?? _idFor(evaluation.point, now),
      name: name,
      point: evaluation.point,
      breadth: evaluation.breadth,
      computedAt: evaluation.computedAt,
      lastRefreshedAt: now,
      entries: evaluation.result.entries,
    );

    await repository.save(station, resolved: evaluation.entries);
    ref.invalidateSelf();
  }

  /// La postazione già presente entro 200 m dal punto, se c'è (FR-048).
  Future<SavedStation?> findDuplicate(SearchPoint point) async {
    final repository = await ref.read(savedStationsRepositoryProvider.future);
    return repository.findNear(point);
  }

  Future<void> rename(String id, String name) async {
    final repository = await ref.read(savedStationsRepositoryProvider.future);
    await repository.rename(id, name);
    ref.invalidateSelf();
  }

  Future<void> delete(String id) async {
    final repository = await ref.read(savedStationsRepositoryProvider.future);
    await repository.delete(id);
    ref.invalidateSelf();
  }

  /// Riesegue il calcolo su una postazione, mantenendone punto e ampiezza.
  ///
  /// In caso di errore la copia precedente resta **intatta**: meglio un dato
  /// vecchio di uno assente, soprattutto in campo.
  Future<bool> refresh(String id) async {
    final repository = await ref.read(savedStationsRepositoryProvider.future);
    final existing = await repository.read(id);
    if (existing == null) return false;

    try {
      final evaluation = await ref.read(
        evaluatePointProvider(
          point: existing.point,
          breadth: existing.breadth,
        ).future,
      );
      await repository.save(
        existing.copyWith(
          computedAt: evaluation.computedAt,
          lastRefreshedAt: DateTime.now(),
          entries: evaluation.result.entries,
        ),
        resolved: evaluation.entries,
      );
      ref.invalidateSelf();
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Aggiorna tutte le postazioni, una per volta (FR-052, FR-053).
  ///
  /// Emette l'avanzamento man mano, si può interrompere con `cancelBulkRefresh`, e ogni
  /// postazione che fallisce conserva la copia precedente ed entra nel
  /// riepilogo finale.
  Stream<BulkRefreshProgress> refreshAll() async* {
    final stations = state.value ?? const <SavedStation>[];
    var progress = BulkRefreshProgress(total: stations.length);
    yield progress;

    for (final station in stations) {
      if (_cancelRequested) {
        yield progress = progress.copyWith(cancelled: true);
        _cancelRequested = false;
        return;
      }

      final ok = await refresh(station.id);
      progress = progress.copyWith(
        done: progress.done + 1,
        failedNames:
            ok ? progress.failedNames : [...progress.failedNames, station.name],
      );
      yield progress;
    }
  }

  bool _cancelRequested = false;

  /// Chiede l'interruzione dell'aggiornamento massivo. La postazione in corso
  /// arriva a termine: interromperla a metà la lascerebbe in stato parziale.
  void cancelBulkRefresh() => _cancelRequested = true;

  /// Identificatore stabile: coordinate arrotondate più il momento di
  /// creazione, sufficiente a non collidere senza dipendere da un generatore.
  String _idFor(SearchPoint point, DateTime now) =>
      '${point.latitude.toStringAsFixed(4)}_'
      '${point.longitude.toStringAsFixed(4)}_'
      '${now.microsecondsSinceEpoch}';
}
