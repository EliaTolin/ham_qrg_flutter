// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pota_api_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(potaDatasource)
final potaDatasourceProvider = PotaDatasourceProvider._();

final class PotaDatasourceProvider
    extends $FunctionalProvider<PotaDatasource, PotaDatasource, PotaDatasource>
    with $Provider<PotaDatasource> {
  PotaDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'potaDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$potaDatasourceHash();

  @$internal
  @override
  $ProviderElement<PotaDatasource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PotaDatasource create(Ref ref) {
    return potaDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PotaDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PotaDatasource>(value),
    );
  }
}

String _$potaDatasourceHash() => r'918687c72cc5753af68deda8560dee95c16fc04b';
