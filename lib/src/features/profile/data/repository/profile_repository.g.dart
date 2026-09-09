// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_repository.dart';

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

@ProviderFor(profileRepository)
final profileRepositoryProvider = ProfileRepositoryProvider._();

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

final class ProfileRepositoryProvider extends $FunctionalProvider<
        AsyncValue<ProfileRepository>,
        ProfileRepository,
        FutureOr<ProfileRepository>>
    with
        $FutureModifier<ProfileRepository>,
        $FutureProvider<ProfileRepository> {
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
  ProfileRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'profileRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$profileRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<ProfileRepository> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<ProfileRepository> create(Ref ref) {
    return profileRepository(ref);
  }
}

String _$profileRepositoryHash() => r'781a66270c7405e6c35d3a5073d18dceaa1b2ee9';
