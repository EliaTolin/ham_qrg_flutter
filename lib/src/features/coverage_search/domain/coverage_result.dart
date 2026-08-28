import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_breadth.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';
import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/domain/repeater/repeater.dart';

part 'coverage_result.freezed.dart';

/// Il verdetto su un singolo ripetitore per un dato punto.
///
/// Tiene il solo `repeaterId` e non l'entità: i dati operativi del ripetitore
/// sono gli stessi per tutti e vivono una volta sola nella cache condivisa,
/// mentre il verdetto è specifico di questo punto e non ha senso altrove.
/// È ciò che rende una postazione salvata ~18 KB invece di ~400 KB.
@freezed
abstract class CoverageEntry with _$CoverageEntry {
  const factory CoverageEntry({
    required String repeaterId,
    required double dbm,
    required double distanceKm,
    required bool reachable,
  }) = _CoverageEntry;
}

/// Esito di una valutazione di copertura da un punto.
///
/// Contiene **sempre tutti i modi di accesso** (FR-027): i filtri della mappa
/// sono una lente di presentazione, non un vincolo sul calcolo. Filtrare qui
/// produrrebbe postazioni salvate mutilate in modo irreversibile.
@freezed
abstract class CoverageResult with _$CoverageResult {
  const factory CoverageResult({
    required SearchPoint point,
    required SearchBreadth breadth,
    required DateTime computedAt,
    @Default(<CoverageEntry>[]) List<CoverageEntry> entries,
  }) = _CoverageResult;

  const CoverageResult._();

  /// Quanti ripetitori risultano effettivamente raggiungibili.
  int get reachableCount => entries.where((e) => e.reachable).length;
}

/// Una voce di risultato con il ripetitore risolto, pronta per la UI.
///
/// Vive solo a runtime: non viene mai serializzata, perché il ripetitore
/// arriva dalla cache condivisa al momento del rendering.
@freezed
abstract class ResolvedCoverageEntry with _$ResolvedCoverageEntry {
  const factory ResolvedCoverageEntry({
    required Repeater repeater,
    required CoverageEntry verdict,
  }) = _ResolvedCoverageEntry;

  const ResolvedCoverageEntry._();

  /// I modi di accesso offerti dal ripetitore.
  Set<AccessMode> get modes => repeater.accesses.map((a) => a.mode).toSet();

  /// Se il ripetitore va mostrato con i filtri [selected] attivi.
  /// Un insieme vuoto significa "nessun filtro", quindi mostra tutto.
  bool matchesModes(Set<AccessMode> selected) =>
      selected.isEmpty || modes.any(selected.contains);
}

/// Applica i filtri di modo alla **sola presentazione** (FR-028) e riporta
/// quante voci raggiungibili sono state nascoste, così che una lista filtrata
/// non venga scambiata per una lista vuota (FR-030).
@freezed
abstract class FilteredEntries with _$FilteredEntries {
  const factory FilteredEntries({
    required List<ResolvedCoverageEntry> visible,
    required int hiddenReachableCount,
  }) = _FilteredEntries;
}

/// Estensione di comodo per applicare la lente dei modi.
extension CoverageLens on List<ResolvedCoverageEntry> {
  FilteredEntries filteredBy(Set<AccessMode> selected) {
    if (selected.isEmpty) {
      return FilteredEntries(visible: this, hiddenReachableCount: 0);
    }
    final visible = where((e) => e.matchesModes(selected)).toList();
    final hidden = where(
      (e) => e.verdict.reachable && !e.matchesModes(selected),
    ).length;
    return FilteredEntries(visible: visible, hiddenReachableCount: hidden);
  }
}

/// Una valutazione appena eseguita: il verdetto leggero da salvare **e** i
/// ripetitori risolti pronti per la UI.
///
/// Tiene insieme le due forme perché in questo momento — e solo in questo — i
/// ripetitori sono già in memoria: salvarli in cache e mostrarli sono due usi
/// dello stesso dato, non due letture separate.
@freezed
abstract class CoverageEvaluation with _$CoverageEvaluation {
  const factory CoverageEvaluation({
    required SearchPoint point,
    required SearchBreadth breadth,
    required DateTime computedAt,
    @Default(<ResolvedCoverageEntry>[]) List<ResolvedCoverageEntry> entries,
  }) = _CoverageEvaluation;

  const CoverageEvaluation._();

  int get reachableCount => entries.where((e) => e.verdict.reachable).length;

  /// La forma leggera da persistere in una postazione salvata.
  CoverageResult get result => CoverageResult(
        point: point,
        breadth: breadth,
        computedAt: computedAt,
        entries: entries.map((e) => e.verdict).toList(),
      );

  /// I ripetitori da scrivere nella cache condivisa al salvataggio, così che la
  /// postazione sia autosufficiente offline dal primo istante.
  List<Repeater> get repeaters => entries.map((e) => e.repeater).toList();
}
