// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repeaters_with_active_spots_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RepeatersWithActiveSpots)
final repeatersWithActiveSpotsProvider = RepeatersWithActiveSpotsProvider._();

final class RepeatersWithActiveSpotsProvider
    extends $AsyncNotifierProvider<RepeatersWithActiveSpots, Set<String>> {
  RepeatersWithActiveSpotsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'repeatersWithActiveSpotsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$repeatersWithActiveSpotsHash();

  @$internal
  @override
  RepeatersWithActiveSpots create() => RepeatersWithActiveSpots();
}

String _$repeatersWithActiveSpotsHash() =>
    r'dd94363a93768ad3a80da2c60987b22b827831b3';

abstract class _$RepeatersWithActiveSpots extends $AsyncNotifier<Set<String>> {
  FutureOr<Set<String>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Set<String>>, Set<String>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<Set<String>>, Set<String>>,
        AsyncValue<Set<String>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
