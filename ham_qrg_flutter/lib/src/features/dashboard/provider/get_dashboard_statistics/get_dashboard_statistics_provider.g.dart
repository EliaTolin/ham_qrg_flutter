// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_dashboard_statistics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getDashboardStatistics)
final getDashboardStatisticsProvider = GetDashboardStatisticsProvider._();

final class GetDashboardStatisticsProvider extends $FunctionalProvider<
        AsyncValue<DashboardStatistics>,
        DashboardStatistics,
        FutureOr<DashboardStatistics>>
    with
        $FutureModifier<DashboardStatistics>,
        $FutureProvider<DashboardStatistics> {
  GetDashboardStatisticsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getDashboardStatisticsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getDashboardStatisticsHash();

  @$internal
  @override
  $FutureProviderElement<DashboardStatistics> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<DashboardStatistics> create(Ref ref) {
    return getDashboardStatistics(ref);
  }
}

String _$getDashboardStatisticsHash() =>
    r'19efa72fd45de40967fbdb12b7fa233c79ab6c45';
