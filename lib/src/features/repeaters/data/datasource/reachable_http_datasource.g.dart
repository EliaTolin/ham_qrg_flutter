// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reachable_http_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(reachableDatasource)
final reachableDatasourceProvider = ReachableDatasourceProvider._();

final class ReachableDatasourceProvider extends $FunctionalProvider<
    ReachableDatasource,
    ReachableDatasource,
    ReachableDatasource> with $Provider<ReachableDatasource> {
  ReachableDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'reachableDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$reachableDatasourceHash();

  @$internal
  @override
  $ProviderElement<ReachableDatasource> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ReachableDatasource create(Ref ref) {
    return reachableDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReachableDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReachableDatasource>(value),
    );
  }
}

String _$reachableDatasourceHash() =>
    r'faf5320aa0a7a2eda8461c16a92e9adb53cd1b79';
