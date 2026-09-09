import 'package:in_app_review/in_app_review.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_review_client.g.dart';

/// Accesso al prompt di recensione nativo dello store.
///
/// Esiste come astrazione e non come uso diretto di [InAppReview] perché
/// quest'ultima ha un costruttore privato e una sola istanza statica: senza
/// questa interfaccia nessun test potrebbe verificare *quando* il prompt viene
/// chiesto, che è l'unica cosa che conta davvero (il prompt in sé lo disegna
/// il sistema operativo).
abstract class AppReviewClient {
  /// `true` se il dispositivo è in grado di mostrare il prompt.
  Future<bool> isAvailable();

  /// Chiede al sistema di mostrare il prompt.
  ///
  /// Non garantisce nulla: iOS e Android possono ignorarlo silenziosamente se
  /// la quota è esaurita o se l'utente ha disattivato la funzione.
  Future<void> requestReview();
}

class InAppReviewClient implements AppReviewClient {
  const InAppReviewClient(this._inAppReview);

  final InAppReview _inAppReview;

  @override
  Future<bool> isAvailable() => _inAppReview.isAvailable();

  @override
  Future<void> requestReview() => _inAppReview.requestReview();
}

@riverpod
AppReviewClient appReviewClient(Ref ref) {
  return InAppReviewClient(InAppReview.instance);
}
