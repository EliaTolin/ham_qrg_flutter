// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'param_supabase_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(paramSupabaseDatasource)
final paramSupabaseDatasourceProvider = ParamSupabaseDatasourceProvider._();

final class ParamSupabaseDatasourceProvider extends $FunctionalProvider<
    ParamDatasource,
    ParamDatasource,
    ParamDatasource> with $Provider<ParamDatasource> {
  ParamSupabaseDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'paramSupabaseDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$paramSupabaseDatasourceHash();

  @$internal
  @override
  $ProviderElement<ParamDatasource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ParamDatasource create(Ref ref) {
    return paramSupabaseDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ParamDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ParamDatasource>(value),
    );
  }
}

String _$paramSupabaseDatasourceHash() =>
    r'c90de061cf2d9d6059f12247cdee35e9724fe6a4';
