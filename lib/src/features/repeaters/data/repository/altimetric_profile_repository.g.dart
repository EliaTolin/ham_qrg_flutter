// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'altimetric_profile_repository.dart';

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

@ProviderFor(altimetricProfileRepository)
final altimetricProfileRepositoryProvider =
    AltimetricProfileRepositoryProvider._();

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

final class AltimetricProfileRepositoryProvider extends $FunctionalProvider<
    AltimetricProfileRepository,
    AltimetricProfileRepository,
    AltimetricProfileRepository> with $Provider<AltimetricProfileRepository> {
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
  AltimetricProfileRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'altimetricProfileRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$altimetricProfileRepositoryHash();

  @$internal
  @override
  $ProviderElement<AltimetricProfileRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AltimetricProfileRepository create(Ref ref) {
    return altimetricProfileRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AltimetricProfileRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AltimetricProfileRepository>(value),
    );
  }
}

String _$altimetricProfileRepositoryHash() =>
    r'09740c92ab2bef2ef2162c399902366d861da5b7';
