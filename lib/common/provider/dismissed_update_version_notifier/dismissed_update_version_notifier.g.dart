// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dismissed_update_version_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Ultima versione per cui l'utente ha chiuso il banner di aggiornamento.
///
/// Vive sul dispositivo come le altre preferenze di presentazione: chiudere
/// il banner nasconde *quella* versione, non l'invito in sé — alla release
/// successiva il banner torna, perché il confronto è sul numero di versione
/// e non su un flag booleano.

@ProviderFor(DismissedUpdateVersionNotifier)
final dismissedUpdateVersionProvider =
    DismissedUpdateVersionNotifierProvider._();

/// Ultima versione per cui l'utente ha chiuso il banner di aggiornamento.
///
/// Vive sul dispositivo come le altre preferenze di presentazione: chiudere
/// il banner nasconde *quella* versione, non l'invito in sé — alla release
/// successiva il banner torna, perché il confronto è sul numero di versione
/// e non su un flag booleano.
final class DismissedUpdateVersionNotifierProvider
    extends $AsyncNotifierProvider<DismissedUpdateVersionNotifier, String?> {
  /// Ultima versione per cui l'utente ha chiuso il banner di aggiornamento.
  ///
  /// Vive sul dispositivo come le altre preferenze di presentazione: chiudere
  /// il banner nasconde *quella* versione, non l'invito in sé — alla release
  /// successiva il banner torna, perché il confronto è sul numero di versione
  /// e non su un flag booleano.
  DismissedUpdateVersionNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'dismissedUpdateVersionProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$dismissedUpdateVersionNotifierHash();

  @$internal
  @override
  DismissedUpdateVersionNotifier create() => DismissedUpdateVersionNotifier();
}

String _$dismissedUpdateVersionNotifierHash() =>
    r'7d871045154a771dc5d28887b93209c349551c60';

/// Ultima versione per cui l'utente ha chiuso il banner di aggiornamento.
///
/// Vive sul dispositivo come le altre preferenze di presentazione: chiudere
/// il banner nasconde *quella* versione, non l'invito in sé — alla release
/// successiva il banner torna, perché il confronto è sul numero di versione
/// e non su un flag booleano.

abstract class _$DismissedUpdateVersionNotifier
    extends $AsyncNotifier<String?> {
  FutureOr<String?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<String?>, String?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<String?>, String?>,
        AsyncValue<String?>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
