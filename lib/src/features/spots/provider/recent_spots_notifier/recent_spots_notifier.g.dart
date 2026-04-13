// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_spots_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RecentSpotsNotifier)
final recentSpotsProvider = RecentSpotsNotifierProvider._();

final class RecentSpotsNotifierProvider
    extends $AsyncNotifierProvider<RecentSpotsNotifier, List<RepeaterSpot>> {
  RecentSpotsNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'recentSpotsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$recentSpotsNotifierHash();

  @$internal
  @override
  RecentSpotsNotifier create() => RecentSpotsNotifier();
}

String _$recentSpotsNotifierHash() =>
    r'1b818c0d7a69a06c03ce73f3db187b0c5614d5c2';

abstract class _$RecentSpotsNotifier
    extends $AsyncNotifier<List<RepeaterSpot>> {
  FutureOr<List<RepeaterSpot>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<RepeaterSpot>>, List<RepeaterSpot>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<RepeaterSpot>>, List<RepeaterSpot>>,
        AsyncValue<List<RepeaterSpot>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
