// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repeaters_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// **`watch` e non `read`**: il datasource è costruito attorno a
/// `OfflineCacheGate`, che cattura connettività ed entitlement **al momento
/// della costruzione**. Letto con `read`, questo repository resterebbe
/// aggrappato per sempre alla prima istanza: se al primo avvio i flag erano
/// ancora sbagliati — il probe di rete che scade sotto la contesa dell'avvio
/// basta a dichiarare un falso offline — ogni chiamata continuerebbe a
/// fallire per tutta la sessione, e solo un riprova manuale (che dispone e
/// ricostruisce la catena) la rimetterebbe in piedi. Con `watch` il
/// repository si ricostruisce da sé quando i flag si assestano, e le query
/// che lo osservano ripartono da sole.

@ProviderFor(repeatersRepository)
final repeatersRepositoryProvider = RepeatersRepositoryProvider._();

/// **`watch` e non `read`**: il datasource è costruito attorno a
/// `OfflineCacheGate`, che cattura connettività ed entitlement **al momento
/// della costruzione**. Letto con `read`, questo repository resterebbe
/// aggrappato per sempre alla prima istanza: se al primo avvio i flag erano
/// ancora sbagliati — il probe di rete che scade sotto la contesa dell'avvio
/// basta a dichiarare un falso offline — ogni chiamata continuerebbe a
/// fallire per tutta la sessione, e solo un riprova manuale (che dispone e
/// ricostruisce la catena) la rimetterebbe in piedi. Con `watch` il
/// repository si ricostruisce da sé quando i flag si assestano, e le query
/// che lo osservano ripartono da sole.

final class RepeatersRepositoryProvider extends $FunctionalProvider<
    RepeatersRepository,
    RepeatersRepository,
    RepeatersRepository> with $Provider<RepeatersRepository> {
  /// **`watch` e non `read`**: il datasource è costruito attorno a
  /// `OfflineCacheGate`, che cattura connettività ed entitlement **al momento
  /// della costruzione**. Letto con `read`, questo repository resterebbe
  /// aggrappato per sempre alla prima istanza: se al primo avvio i flag erano
  /// ancora sbagliati — il probe di rete che scade sotto la contesa dell'avvio
  /// basta a dichiarare un falso offline — ogni chiamata continuerebbe a
  /// fallire per tutta la sessione, e solo un riprova manuale (che dispone e
  /// ricostruisce la catena) la rimetterebbe in piedi. Con `watch` il
  /// repository si ricostruisce da sé quando i flag si assestano, e le query
  /// che lo osservano ripartono da sole.
  RepeatersRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'repeatersRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$repeatersRepositoryHash();

  @$internal
  @override
  $ProviderElement<RepeatersRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RepeatersRepository create(Ref ref) {
    return repeatersRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RepeatersRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RepeatersRepository>(value),
    );
  }
}

String _$repeatersRepositoryHash() =>
    r'91983a46123551954c9325a14195867d9a5ec91c';
