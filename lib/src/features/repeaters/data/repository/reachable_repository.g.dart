// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reachable_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(reachableRepository)
final reachableRepositoryProvider = ReachableRepositoryProvider._();

final class ReachableRepositoryProvider extends $FunctionalProvider<
    ReachableRepository,
    ReachableRepository,
    ReachableRepository> with $Provider<ReachableRepository> {
  ReachableRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'reachableRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$reachableRepositoryHash();

  @$internal
  @override
  $ProviderElement<ReachableRepository> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ReachableRepository create(Ref ref) {
    return reachableRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReachableRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReachableRepository>(value),
    );
  }
}

String _$reachableRepositoryHash() =>
    r'eb627fdb1d9f4078f517414a7110ad4cb5bad896';
