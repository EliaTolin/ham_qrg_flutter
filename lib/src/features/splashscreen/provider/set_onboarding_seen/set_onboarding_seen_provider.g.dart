// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_onboarding_seen_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(setOnboardingSeen)
final setOnboardingSeenProvider = SetOnboardingSeenProvider._();

final class SetOnboardingSeenProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  SetOnboardingSeenProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'setOnboardingSeenProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$setOnboardingSeenHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return setOnboardingSeen(ref);
  }
}

String _$setOnboardingSeenHash() => r'6e7a6828fb5378c969e10f9fac27e7174b79da2d';
