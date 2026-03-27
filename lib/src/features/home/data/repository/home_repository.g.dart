// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeRepository)
final homeRepositoryProvider = HomeRepositoryProvider._();

final class HomeRepositoryProvider extends $FunctionalProvider<
        AsyncValue<HomeRepository>, HomeRepository, FutureOr<HomeRepository>>
    with $FutureModifier<HomeRepository>, $FutureProvider<HomeRepository> {
  HomeRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'homeRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$homeRepositoryHash();

  @$internal
  @override
  $FutureProviderElement<HomeRepository> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<HomeRepository> create(Ref ref) {
    return homeRepository(ref);
  }
}

String _$homeRepositoryHash() => r'131018b436726133b2f0b0538de59ad1fe3a3e5f';
