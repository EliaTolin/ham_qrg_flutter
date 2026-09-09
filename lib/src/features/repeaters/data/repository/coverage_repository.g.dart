// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coverage_repository.dart';

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

@ProviderFor(coverageRepository)
final coverageRepositoryProvider = CoverageRepositoryProvider._();

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

final class CoverageRepositoryProvider extends $FunctionalProvider<
    CoverageRepository,
    CoverageRepository,
    CoverageRepository> with $Provider<CoverageRepository> {
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
  CoverageRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'coverageRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$coverageRepositoryHash();

  @$internal
  @override
  $ProviderElement<CoverageRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CoverageRepository create(Ref ref) {
    return coverageRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CoverageRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CoverageRepository>(value),
    );
  }
}

String _$coverageRepositoryHash() =>
    r'f33fcae425a81e4787415ed8dd79e1fe93c254e3';
