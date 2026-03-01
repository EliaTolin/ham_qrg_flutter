// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_google_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(signInWithGoogle)
final signInWithGoogleProvider = SignInWithGoogleProvider._();

final class SignInWithGoogleProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  SignInWithGoogleProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'signInWithGoogleProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$signInWithGoogleHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return signInWithGoogle(ref);
  }
}

String _$signInWithGoogleHash() => r'07179dc15c17197d74f88c5911d72126c57c45c8';
