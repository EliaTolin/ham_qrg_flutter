// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sota_api_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sotaDatasource)
final sotaDatasourceProvider = SotaDatasourceProvider._();

final class SotaDatasourceProvider
    extends $FunctionalProvider<SotaDatasource, SotaDatasource, SotaDatasource>
    with $Provider<SotaDatasource> {
  SotaDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'sotaDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sotaDatasourceHash();

  @$internal
  @override
  $ProviderElement<SotaDatasource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SotaDatasource create(Ref ref) {
    return sotaDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SotaDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SotaDatasource>(value),
    );
  }
}

String _$sotaDatasourceHash() => r'fd5dc0c6471d10ca1f5facdcbd4b401da2d15285';
