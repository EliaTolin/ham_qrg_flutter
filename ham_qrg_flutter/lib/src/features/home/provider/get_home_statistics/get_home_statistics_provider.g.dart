// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_home_statistics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getHomeStatistics)
final getHomeStatisticsProvider = GetHomeStatisticsProvider._();

final class GetHomeStatisticsProvider extends $FunctionalProvider<
        AsyncValue<HomeStatistics>, HomeStatistics, FutureOr<HomeStatistics>>
    with $FutureModifier<HomeStatistics>, $FutureProvider<HomeStatistics> {
  GetHomeStatisticsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getHomeStatisticsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getHomeStatisticsHash();

  @$internal
  @override
  $FutureProviderElement<HomeStatistics> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<HomeStatistics> create(Ref ref) {
    return getHomeStatistics(ref);
  }
}

String _$getHomeStatisticsHash() => r'd77d12fa9505d686c991ad0892d3f24ff8710040';
