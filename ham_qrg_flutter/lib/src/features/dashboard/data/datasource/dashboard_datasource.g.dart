// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dashboardDatasource)
final dashboardDatasourceProvider = DashboardDatasourceProvider._();

final class DashboardDatasourceProvider extends $FunctionalProvider<
    DashboardDatasource,
    DashboardDatasource,
    DashboardDatasource> with $Provider<DashboardDatasource> {
  DashboardDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'dashboardDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$dashboardDatasourceHash();

  @$internal
  @override
  $ProviderElement<DashboardDatasource> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DashboardDatasource create(Ref ref) {
    return dashboardDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DashboardDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DashboardDatasource>(value),
    );
  }
}

String _$dashboardDatasourceHash() =>
    r'a784e551b2ca7af6be34b09444ac03547abeb66c';
