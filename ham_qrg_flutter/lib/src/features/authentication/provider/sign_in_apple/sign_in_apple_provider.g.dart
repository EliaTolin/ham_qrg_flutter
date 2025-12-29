// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_apple_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(signInWithApple)
final signInWithAppleProvider = SignInWithAppleProvider._();

final class SignInWithAppleProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  SignInWithAppleProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'signInWithAppleProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$signInWithAppleHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return signInWithApple(ref);
  }
}

String _$signInWithAppleHash() => r'4a5cd4b7136d538bf1a341d8f1428f3cfc87ae9b';
