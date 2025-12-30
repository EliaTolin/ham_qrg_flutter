// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_dashboard_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeDashboardDatasource)
final homeDashboardDatasourceProvider = HomeDashboardDatasourceProvider._();

final class HomeDashboardDatasourceProvider extends $FunctionalProvider<
    HomeDashboardDatasource,
    HomeDashboardDatasource,
    HomeDashboardDatasource> with $Provider<HomeDashboardDatasource> {
  HomeDashboardDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'homeDashboardDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$homeDashboardDatasourceHash();

  @$internal
  @override
  $ProviderElement<HomeDashboardDatasource> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomeDashboardDatasource create(Ref ref) {
    return homeDashboardDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeDashboardDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeDashboardDatasource>(value),
    );
  }
}

String _$homeDashboardDatasourceHash() =>
    r'2946e47ab43552136347538566b6b932d27dc9e5';
