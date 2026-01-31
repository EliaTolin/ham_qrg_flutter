// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repeaters_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(repeatersRepository)
final repeatersRepositoryProvider = RepeatersRepositoryProvider._();

final class RepeatersRepositoryProvider extends $FunctionalProvider<
    RepeatersRepository,
    RepeatersRepository,
    RepeatersRepository> with $Provider<RepeatersRepository> {
  RepeatersRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'repeatersRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$repeatersRepositoryHash();

  @$internal
  @override
  $ProviderElement<RepeatersRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RepeatersRepository create(Ref ref) {
    return repeatersRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RepeatersRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RepeatersRepository>(value),
    );
  }
}

String _$repeatersRepositoryHash() =>
    r'a447d08d2f96a998e80b5cb7a74990f83b65d0e5';
