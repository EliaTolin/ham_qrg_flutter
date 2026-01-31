// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(splashRepository)
final splashRepositoryProvider = SplashRepositoryProvider._();

final class SplashRepositoryProvider extends $FunctionalProvider<
        AsyncValue<SplashRepository>,
        SplashRepository,
        FutureOr<SplashRepository>>
    with $FutureModifier<SplashRepository>, $FutureProvider<SplashRepository> {
  SplashRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'splashRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$splashRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<SplashRepository> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<SplashRepository> create(Ref ref) {
    return splashRepository(ref);
  }
}

String _$splashRepositoryHash() => r'aee419dc19a333d2d52f44843cb149619990bea9';
