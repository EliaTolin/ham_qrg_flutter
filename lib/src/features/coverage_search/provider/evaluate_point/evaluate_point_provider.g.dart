// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evaluate_point_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
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

@ProviderFor(evaluatePoint)
final evaluatePointProvider = EvaluatePointFamily._();

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

final class EvaluatePointProvider extends $FunctionalProvider<
        AsyncValue<CoverageEvaluation>,
        CoverageEvaluation,
        FutureOr<CoverageEvaluation>>
    with
        $FutureModifier<CoverageEvaluation>,
        $FutureProvider<CoverageEvaluation> {
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
  EvaluatePointProvider._(
      {required EvaluatePointFamily super.from,
      required ({
        SearchPoint point,
        SearchBreadth breadth,
      })
          super.argument})
      : super(
          retry: null,
          name: r'evaluatePointProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$evaluatePointHash();

  @override
  String toString() {
    return r'evaluatePointProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<CoverageEvaluation> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<CoverageEvaluation> create(Ref ref) {
    final argument = this.argument as ({
      SearchPoint point,
      SearchBreadth breadth,
    });
    return evaluatePoint(
      ref,
      point: argument.point,
      breadth: argument.breadth,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EvaluatePointProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$evaluatePointHash() => r'8dadf6701b8bbccbf585ce64f02d491b9ade48a5';

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

final class EvaluatePointFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<CoverageEvaluation>,
            ({
              SearchPoint point,
              SearchBreadth breadth,
            })> {
  EvaluatePointFamily._()
      : super(
          retry: null,
          name: r'evaluatePointProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

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

  EvaluatePointProvider call({
    required SearchPoint point,
    required SearchBreadth breadth,
  }) =>
      EvaluatePointProvider._(argument: (
        point: point,
        breadth: breadth,
      ), from: this);

  @override
  String toString() => r'evaluatePointProvider';
}
