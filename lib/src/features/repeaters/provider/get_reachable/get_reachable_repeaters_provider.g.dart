// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reachable_repeaters_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// "Which repeaters can I reach from here?" — fetches nearby repeaters, asks the
/// service which reach the user (point-to-point, same model as the map), and
/// joins the verdicts back onto the full [Repeater] entities for the UI.

@ProviderFor(getReachableRepeaters)
final getReachableRepeatersProvider = GetReachableRepeatersFamily._();

/// "Which repeaters can I reach from here?" — fetches nearby repeaters, asks the
/// service which reach the user (point-to-point, same model as the map), and
/// joins the verdicts back onto the full [Repeater] entities for the UI.

final class GetReachableRepeatersProvider extends $FunctionalProvider<
        AsyncValue<ReachableSummary>,
        ReachableSummary,
        FutureOr<ReachableSummary>>
    with $FutureModifier<ReachableSummary>, $FutureProvider<ReachableSummary> {
  /// "Which repeaters can I reach from here?" — fetches nearby repeaters, asks the
  /// service which reach the user (point-to-point, same model as the map), and
  /// joins the verdicts back onto the full [Repeater] entities for the UI.
  GetReachableRepeatersProvider._(
      {required GetReachableRepeatersFamily super.from,
      required ({
        double latitude,
        double longitude,
        double radiusKm,
      })
          super.argument})
      : super(
          retry: null,
          name: r'getReachableRepeatersProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getReachableRepeatersHash();

  @override
  String toString() {
    return r'getReachableRepeatersProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<ReachableSummary> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<ReachableSummary> create(Ref ref) {
    final argument = this.argument as ({
      double latitude,
      double longitude,
      double radiusKm,
    });
    return getReachableRepeaters(
      ref,
      latitude: argument.latitude,
      longitude: argument.longitude,
      radiusKm: argument.radiusKm,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetReachableRepeatersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getReachableRepeatersHash() =>
    r'04935deba80bb7030379492fee1bbfe1cb4f5d36';

/// "Which repeaters can I reach from here?" — fetches nearby repeaters, asks the
/// service which reach the user (point-to-point, same model as the map), and
/// joins the verdicts back onto the full [Repeater] entities for the UI.

final class GetReachableRepeatersFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<ReachableSummary>,
            ({
              double latitude,
              double longitude,
              double radiusKm,
            })> {
  GetReachableRepeatersFamily._()
      : super(
          retry: null,
          name: r'getReachableRepeatersProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// "Which repeaters can I reach from here?" — fetches nearby repeaters, asks the
  /// service which reach the user (point-to-point, same model as the map), and
  /// joins the verdicts back onto the full [Repeater] entities for the UI.

  GetReachableRepeatersProvider call({
    required double latitude,
    required double longitude,
    double radiusKm = 80.0,
  }) =>
      GetReachableRepeatersProvider._(argument: (
        latitude: latitude,
        longitude: longitude,
        radiusKm: radiusKm,
      ), from: this);

  @override
  String toString() => r'getReachableRepeatersProvider';
}
