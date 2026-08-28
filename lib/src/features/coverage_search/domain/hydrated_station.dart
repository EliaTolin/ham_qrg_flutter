import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hamqrg/src/features/coverage_search/domain/cached_repeater.dart';
import 'package:hamqrg/src/features/coverage_search/domain/coverage_result.dart';
import 'package:hamqrg/src/features/coverage_search/domain/saved_station.dart';

part 'hydrated_station.freezed.dart';

/// Una postazione salvata con i suoi ripetitori risolti dalla cache condivisa.
///
/// Esiste solo a runtime: non viene mai serializzata, perché i ripetitori
/// arrivano dalla cache al momento del rendering — ed è questo che permette a
/// una postazione di ottobre di mostrare i dati aggiornati a febbraio.
@freezed
abstract class HydratedStation with _$HydratedStation {
  const factory HydratedStation({
    required SavedStation station,
    @Default(<String, CachedRepeater>{}) Map<String, CachedRepeater> repeaters,

    /// Voci non risolte. Si mostrano come "dato non disponibile offline"
    /// senza far fallire l'intera pagina: una postazione con un buco resta
    /// utile, una postazione che non si apre no.
    @Default(<String>{}) Set<String> missingIds,
  }) = _HydratedStation;

  const HydratedStation._();

  /// Le voci risolte, nell'ordine di segnale della postazione.
  List<ResolvedCoverageEntry> get entries => [
        for (final entry in station.entries)
          if (repeaters[entry.repeaterId] != null)
            ResolvedCoverageEntry(
              repeater: repeaters[entry.repeaterId]!.repeater,
              verdict: entry,
            ),
      ];

  /// La data del dato **più vecchio** fra i ripetitori risolti.
  ///
  /// Non `lastRefreshedAt`: con l'aggiornamento indiretto le voci divergono
  /// nel tempo, e l'unica data onesta da mostrare è quella della più vecchia.
  DateTime? get oldestDataAt {
    if (repeaters.isEmpty) return null;
    return repeaters.values
        .map((r) => r.cachedAt)
        .reduce((a, b) => a.isBefore(b) ? a : b);
  }

  bool isStaleAt(DateTime now) {
    final oldest = oldestDataAt;
    return oldest != null && repeaters.values.any((r) => r.isStaleAt(now));
  }
}
