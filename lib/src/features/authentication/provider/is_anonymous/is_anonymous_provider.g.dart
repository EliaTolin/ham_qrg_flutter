// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_anonymous_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(isAnonymous)
final isAnonymousProvider = IsAnonymousProvider._();

final class IsAnonymousProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  IsAnonymousProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'isAnonymousProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$isAnonymousHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return isAnonymous(ref);
  }
}

String _$isAnonymousHash() => r'cf7e449bc181fdb599b8996d50569da5580a2286';
