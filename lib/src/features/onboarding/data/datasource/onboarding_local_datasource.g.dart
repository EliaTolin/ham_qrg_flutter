// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_local_datasource.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(onboardingLocalDatasource)
final onboardingLocalDatasourceProvider = OnboardingLocalDatasourceProvider._();

final class OnboardingLocalDatasourceProvider extends $FunctionalProvider<
        AsyncValue<OnboardingDatasource>,
        OnboardingDatasource,
        FutureOr<OnboardingDatasource>>
    with
        $FutureModifier<OnboardingDatasource>,
        $FutureProvider<OnboardingDatasource> {
  OnboardingLocalDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'onboardingLocalDatasourceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$onboardingLocalDatasourceHash();

  @$internal
  @override
  $FutureProviderElement<OnboardingDatasource> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<OnboardingDatasource> create(Ref ref) {
    return onboardingLocalDatasource(ref);
  }
}

String _$onboardingLocalDatasourceHash() =>
    r'3ce30961e19e3273d3c9ae3b381192622b73bb62';
