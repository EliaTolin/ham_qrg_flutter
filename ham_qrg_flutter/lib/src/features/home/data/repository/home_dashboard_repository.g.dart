// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_dashboard_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeDashboardRepository)
final homeDashboardRepositoryProvider = HomeDashboardRepositoryProvider._();

final class HomeDashboardRepositoryProvider extends $FunctionalProvider<
    HomeDashboardRepository,
    HomeDashboardRepository,
    HomeDashboardRepository> with $Provider<HomeDashboardRepository> {
  HomeDashboardRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'homeDashboardRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$homeDashboardRepositoryHash();

  @$internal
  @override
  $ProviderElement<HomeDashboardRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomeDashboardRepository create(Ref ref) {
    return homeDashboardRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeDashboardRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeDashboardRepository>(value),
    );
  }
}

String _$homeDashboardRepositoryHash() =>
    r'b5559f941fd381e00d7c47245ee2fe8bb003e3dc';
