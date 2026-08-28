import 'package:hamqrg/clients/revenue_cat/impl/revenue_cat_client_impl.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:hamqrg/src/features/coverage_search/domain/coverage_result.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_breadth.dart';
import 'package:hamqrg/src/features/coverage_search/domain/search_point.dart';
import 'package:hamqrg/src/features/coverage_search/errors/coverage_search_exception.dart';
import 'package:hamqrg/src/features/repeaters/provider/get_reachable/get_reachable_repeaters_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'evaluate_point_provider.g.dart';

/// "Cosa raggiungo da lì?" — valuta la ricezione dal punto arbitrario scelto.
///
/// Riusa il motore già in uso per la reachability dalla posizione GPS: il punto
/// arbitrario ne sostituisce semplicemente le coordinate, e l'ampiezza scelta
/// ne alimenta il raggio.
///
/// **Non passa i filtri di modo.** `getRepeatersNearby` li accetterebbe, ma
/// FR-027 impone che calcolo e salvataggio comprendano sempre tutti i modi: il
/// filtro è una lente di presentazione. Passarli qui produrrebbe postazioni
/// salvate mutilate in modo irreversibile, e il difetto si manifesterebbe mesi
/// dopo, in campo, quando l'utente toglie il filtro e non trova nulla.
@riverpod
Future<CoverageEvaluation> evaluatePoint(
  Ref ref, {
  required SearchPoint point,
  required SearchBreadth breadth,
}) async {
  // Il gate precede qualunque I/O: per un utente non Pro nessuna richiesta
  // deve raggiungere il servizio di copertura (FR-014, verificato da SC-008).
  if (AppConfigs.reachabilityRequiresPro) {
    // Si interroga il client, non `isProProvider`: quello è uno StreamProvider
    // `keepAlive` il cui `.future` in questa versione di Riverpod NON si
    // risolve mai — resta in AsyncLoading a tempo indeterminato invece di dare
    // errore, e la valutazione resterebbe appesa per sempre. È anche la stessa
    // strada che segue `requirePro`, quindi il gate risponde alla medesima
    // fonte di verità del resto dell'app.
    final isPro = await ref.watch(revenueCatClientProvider).isPro();
    if (!isPro) throw const ProRequiredException();
  }

  final summary = await ref.watch(
    getReachableRepeatersProvider(
      latitude: point.latitude,
      longitude: point.longitude,
      radiusKm: breadth.radiusKm,
      candidateLimit: breadth.candidateLimit,
    ).future,
  );

  return CoverageEvaluation(
    point: point,
    breadth: breadth,
    computedAt: DateTime.now(),
    entries: [
      for (final entry in summary.entries)
        ResolvedCoverageEntry(
          repeater: entry.repeater,
          verdict: CoverageEntry(
            repeaterId: entry.repeater.id,
            dbm: entry.dbm,
            distanceKm: entry.distanceKm,
            reachable: entry.reachable,
          ),
        ),
    ],
  );
}
