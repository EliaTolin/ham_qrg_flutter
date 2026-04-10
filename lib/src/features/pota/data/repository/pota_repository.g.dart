// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pota_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(potaRepository)
final potaRepositoryProvider = PotaRepositoryProvider._();

final class PotaRepositoryProvider
    extends $FunctionalProvider<PotaRepository, PotaRepository, PotaRepository>
    with $Provider<PotaRepository> {
  PotaRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'potaRepositoryProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$potaRepositoryHash();

  @$internal
  @override
  $ProviderElement<PotaRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PotaRepository create(Ref ref) {
    return potaRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PotaRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PotaRepository>(value),
    );
  }
}

String _$potaRepositoryHash() => r'095c685f67faea938cf59e84c585e1ebe7e92473';
