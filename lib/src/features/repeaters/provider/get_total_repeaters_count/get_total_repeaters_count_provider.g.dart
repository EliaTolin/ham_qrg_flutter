// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_total_repeaters_count_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getTotalRepeatersCount)
final getTotalRepeatersCountProvider = GetTotalRepeatersCountProvider._();

final class GetTotalRepeatersCountProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  GetTotalRepeatersCountProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getTotalRepeatersCountProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getTotalRepeatersCountHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return getTotalRepeatersCount(ref);
  }
}

String _$getTotalRepeatersCountHash() =>
    r'48388247ce9a882abf6d6dca99b22e915c654518';
