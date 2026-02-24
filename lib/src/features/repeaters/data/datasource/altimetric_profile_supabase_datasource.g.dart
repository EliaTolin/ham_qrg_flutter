// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'altimetric_profile_supabase_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(altimetricProfileSupabaseDatasource)
final altimetricProfileSupabaseDatasourceProvider =
    AltimetricProfileSupabaseDatasourceProvider._();

final class AltimetricProfileSupabaseDatasourceProvider
    extends $FunctionalProvider<AltimetricProfileDatasource,
        AltimetricProfileDatasource, AltimetricProfileDatasource>
    with $Provider<AltimetricProfileDatasource> {
  AltimetricProfileSupabaseDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'altimetricProfileSupabaseDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() =>
      _$altimetricProfileSupabaseDatasourceHash();

  @$internal
  @override
  $ProviderElement<AltimetricProfileDatasource> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AltimetricProfileDatasource create(Ref ref) {
    return altimetricProfileSupabaseDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AltimetricProfileDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AltimetricProfileDatasource>(value),
    );
  }
}

String _$altimetricProfileSupabaseDatasourceHash() =>
    r'6f7e86a4e436509eb887ff8e8f9ca1c97d1fd936';
