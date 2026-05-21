// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sota_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sotaRepository)
final sotaRepositoryProvider = SotaRepositoryProvider._();

final class SotaRepositoryProvider
    extends $FunctionalProvider<SotaRepository, SotaRepository, SotaRepository>
    with $Provider<SotaRepository> {
  SotaRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'sotaRepositoryProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sotaRepositoryHash();

  @$internal
  @override
  $ProviderElement<SotaRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SotaRepository create(Ref ref) {
    return sotaRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SotaRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SotaRepository>(value),
    );
  }
}

String _$sotaRepositoryHash() => r'a0af34cc1bfc32b8b0abd7b7cc9eb994a7001456';
