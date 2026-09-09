// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reachable_repository.dart';

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

@ProviderFor(reachableRepository)
final reachableRepositoryProvider = ReachableRepositoryProvider._();

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

final class ReachableRepositoryProvider extends $FunctionalProvider<
    ReachableRepository,
    ReachableRepository,
    ReachableRepository> with $Provider<ReachableRepository> {
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
  ReachableRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'reachableRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$reachableRepositoryHash();

  @$internal
  @override
  $ProviderElement<ReachableRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ReachableRepository create(Ref ref) {
    return reachableRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReachableRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReachableRepository>(value),
    );
  }
}

String _$reachableRepositoryHash() =>
    r'20ceca4c87b81835c8105f0bf9814136b057998c';
