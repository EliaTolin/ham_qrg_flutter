// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_caching_repeater_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(repeaterCacheDatasource)
final repeaterCacheDatasourceProvider = RepeaterCacheDatasourceProvider._();

final class RepeaterCacheDatasourceProvider extends $FunctionalProvider<
    RepeaterCacheDatasource,
    RepeaterCacheDatasource,
    RepeaterCacheDatasource> with $Provider<RepeaterCacheDatasource> {
  RepeaterCacheDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'repeaterCacheDatasourceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$repeaterCacheDatasourceHash();

  @$internal
  @override
  $ProviderElement<RepeaterCacheDatasource> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RepeaterCacheDatasource create(Ref ref) {
    return repeaterCacheDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RepeaterCacheDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RepeaterCacheDatasource>(value),
    );
  }
}

String _$repeaterCacheDatasourceHash() =>
    r'33f6fafe851f9453c34e69b5236189eacdcb96e0';
