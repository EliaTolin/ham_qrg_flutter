// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_spots_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides the paginated spot history for a repeater
/// (active + expired + closed), with Realtime updates.

@ProviderFor(ActiveSpotsNotifier)
final activeSpotsProvider = ActiveSpotsNotifierFamily._();

/// Provides the paginated spot history for a repeater
/// (active + expired + closed), with Realtime updates.
final class ActiveSpotsNotifierProvider
    extends $AsyncNotifierProvider<ActiveSpotsNotifier, List<RepeaterSpot>> {
  /// Provides the paginated spot history for a repeater
  /// (active + expired + closed), with Realtime updates.
  ActiveSpotsNotifierProvider._(
      {required ActiveSpotsNotifierFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'activeSpotsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$activeSpotsNotifierHash();

  @override
  String toString() {
    return r'activeSpotsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ActiveSpotsNotifier create() => ActiveSpotsNotifier();

  @override
  bool operator ==(Object other) {
    return other is ActiveSpotsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$activeSpotsNotifierHash() =>
    r'11cb255720fa9419deee78d94f37998ab865a162';

/// Provides the paginated spot history for a repeater
/// (active + expired + closed), with Realtime updates.

final class ActiveSpotsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
            ActiveSpotsNotifier,
            AsyncValue<List<RepeaterSpot>>,
            List<RepeaterSpot>,
            FutureOr<List<RepeaterSpot>>,
            String> {
  ActiveSpotsNotifierFamily._()
      : super(
          retry: null,
          name: r'activeSpotsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// Provides the paginated spot history for a repeater
  /// (active + expired + closed), with Realtime updates.

  ActiveSpotsNotifierProvider call(
    String repeaterId,
  ) =>
      ActiveSpotsNotifierProvider._(argument: repeaterId, from: this);

  @override
  String toString() => r'activeSpotsProvider';
}

/// Provides the paginated spot history for a repeater
/// (active + expired + closed), with Realtime updates.

abstract class _$ActiveSpotsNotifier
    extends $AsyncNotifier<List<RepeaterSpot>> {
  late final _$args = ref.$arg as String;
  String get repeaterId => _$args;

  FutureOr<List<RepeaterSpot>> build(
    String repeaterId,
  );
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
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}
