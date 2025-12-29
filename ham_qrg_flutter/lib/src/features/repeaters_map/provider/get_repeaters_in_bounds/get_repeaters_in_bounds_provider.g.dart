// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_repeaters_in_bounds_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getRepeatersInBounds)
const getRepeatersInBoundsProvider = GetRepeatersInBoundsFamily._();

final class GetRepeatersInBoundsProvider extends $FunctionalProvider<
        AsyncValue<List<Repeater>>, List<Repeater>, FutureOr<List<Repeater>>>
    with $FutureModifier<List<Repeater>>, $FutureProvider<List<Repeater>> {
  const GetRepeatersInBoundsProvider._(
      {required GetRepeatersInBoundsFamily super.from,
      required ({
        double lat1,
        double lon1,
        double lat2,
        double lon2,
        int limit,
        List<RepeaterMode>? modes,
      })
          super.argument})
      : super(
          retry: null,
          name: r'getRepeatersInBoundsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getRepeatersInBoundsHash();

  @override
  String toString() {
    return r'getRepeatersInBoundsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<Repeater>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Repeater>> create(Ref ref) {
    final argument = this.argument as ({
      double lat1,
      double lon1,
      double lat2,
      double lon2,
      int limit,
      List<RepeaterMode>? modes,
    });
    return getRepeatersInBounds(
      ref,
      lat1: argument.lat1,
      lon1: argument.lon1,
      lat2: argument.lat2,
      lon2: argument.lon2,
      limit: argument.limit,
      modes: argument.modes,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetRepeatersInBoundsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getRepeatersInBoundsHash() =>
    r'b994452258a71b196662b5678ee80c24a41ef7b0';

final class GetRepeatersInBoundsFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<List<Repeater>>,
            ({
              double lat1,
              double lon1,
              double lat2,
              double lon2,
              int limit,
              List<RepeaterMode>? modes,
            })> {
  const GetRepeatersInBoundsFamily._()
      : super(
          retry: null,
          name: r'getRepeatersInBoundsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetRepeatersInBoundsProvider call({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
    int limit = 500,
    List<RepeaterMode>? modes,
  }) =>
      GetRepeatersInBoundsProvider._(argument: (
        lat1: lat1,
        lon1: lon1,
        lat2: lat2,
        lon2: lon2,
        limit: limit,
        modes: modes,
      ), from: this);

  @override
  String toString() => r'getRepeatersInBoundsProvider';
}
