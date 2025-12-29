// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repeaters_supabase_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(repeatersSupabaseDatasource)
final repeatersSupabaseDatasourceProvider =
    RepeatersSupabaseDatasourceProvider._();

final class RepeatersSupabaseDatasourceProvider extends $FunctionalProvider<
    RepeatersDatasource,
    RepeatersDatasource,
    RepeatersDatasource> with $Provider<RepeatersDatasource> {
  RepeatersSupabaseDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'repeatersSupabaseDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$repeatersSupabaseDatasourceHash();

  @$internal
  @override
  $ProviderElement<RepeatersDatasource> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RepeatersDatasource create(Ref ref) {
    return repeatersSupabaseDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RepeatersDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RepeatersDatasource>(value),
    );
  }
}

String _$repeatersSupabaseDatasourceHash() =>
    r'7049c568efdef118c5a609acba4dc7087a09bf51';
