// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_needs_onboarding_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(checkNeedsPostLoginOnboarding)
final checkNeedsPostLoginOnboardingProvider =
    CheckNeedsPostLoginOnboardingProvider._();

final class CheckNeedsPostLoginOnboardingProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  CheckNeedsPostLoginOnboardingProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'checkNeedsPostLoginOnboardingProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$checkNeedsPostLoginOnboardingHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return checkNeedsPostLoginOnboarding(ref);
  }
}

String _$checkNeedsPostLoginOnboardingHash() =>
    r'48f6c2b5fe26f06719e968756e9200e56d8a4841';
