// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anonymous_signin_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(anonymousSignIn)
final anonymousSignInProvider = AnonymousSignInProvider._();

final class AnonymousSignInProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  AnonymousSignInProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'anonymousSignInProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$anonymousSignInHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return anonymousSignIn(ref);
  }
}

String _$anonymousSignInHash() => r'62fda44f640b898715c3faa3ce0852620f39a76f';
