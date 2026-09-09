// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_available_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Versione pubblicata sullo store, se è più recente di quella installata e
/// l'utente non l'ha già messa da parte. `null` quando non c'è nulla da dire.
///
/// Lo stesso numero fa anche da gettone della chiusura: mettere via il banner
/// nasconde *quella* versione, non l'invito in sé — alla release successiva
/// torna da solo.
///
/// La lettura è automatica, senza parametri da tenere aggiornati a mano:
/// `upgrader` interroga l'API di ricerca di Apple su iOS e la scheda pubblica
/// del Play Store su Android. Sono due fonti che possono tacere — la scheda
/// Android non sempre espone un numero di versione, e le build sui canali di
/// test non sono pubbliche — e quando tacciono il banner semplicemente non
/// compare. È la direzione giusta in cui sbagliare: un invito mancato non
/// rompe nulla, un invito sbagliato manda l'utente a cercare un
/// aggiornamento che non esiste.

@ProviderFor(availableUpdateVersion)
final availableUpdateVersionProvider = AvailableUpdateVersionProvider._();

/// Versione pubblicata sullo store, se è più recente di quella installata e
/// l'utente non l'ha già messa da parte. `null` quando non c'è nulla da dire.
///
/// Lo stesso numero fa anche da gettone della chiusura: mettere via il banner
/// nasconde *quella* versione, non l'invito in sé — alla release successiva
/// torna da solo.
///
/// La lettura è automatica, senza parametri da tenere aggiornati a mano:
/// `upgrader` interroga l'API di ricerca di Apple su iOS e la scheda pubblica
/// del Play Store su Android. Sono due fonti che possono tacere — la scheda
/// Android non sempre espone un numero di versione, e le build sui canali di
/// test non sono pubbliche — e quando tacciono il banner semplicemente non
/// compare. È la direzione giusta in cui sbagliare: un invito mancato non
/// rompe nulla, un invito sbagliato manda l'utente a cercare un
/// aggiornamento che non esiste.

final class AvailableUpdateVersionProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  /// Versione pubblicata sullo store, se è più recente di quella installata e
  /// l'utente non l'ha già messa da parte. `null` quando non c'è nulla da dire.
  ///
  /// Lo stesso numero fa anche da gettone della chiusura: mettere via il banner
  /// nasconde *quella* versione, non l'invito in sé — alla release successiva
  /// torna da solo.
  ///
  /// La lettura è automatica, senza parametri da tenere aggiornati a mano:
  /// `upgrader` interroga l'API di ricerca di Apple su iOS e la scheda pubblica
  /// del Play Store su Android. Sono due fonti che possono tacere — la scheda
  /// Android non sempre espone un numero di versione, e le build sui canali di
  /// test non sono pubbliche — e quando tacciono il banner semplicemente non
  /// compare. È la direzione giusta in cui sbagliare: un invito mancato non
  /// rompe nulla, un invito sbagliato manda l'utente a cercare un
  /// aggiornamento che non esiste.
  AvailableUpdateVersionProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'availableUpdateVersionProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$availableUpdateVersionHash();

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    return availableUpdateVersion(ref);
  }
}

String _$availableUpdateVersionHash() =>
    r'ec468faa4a2e0279e88d83f10b0c6a3cb348bdd5';
