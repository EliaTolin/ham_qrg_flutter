// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_nearby_repeaters_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getNearbyRepeaters)
final getNearbyRepeatersProvider = GetNearbyRepeatersFamily._();

final class GetNearbyRepeatersProvider extends $FunctionalProvider<
        AsyncValue<List<Repeater>>, List<Repeater>, FutureOr<List<Repeater>>>
    with $FutureModifier<List<Repeater>>, $FutureProvider<List<Repeater>> {
  GetNearbyRepeatersProvider._(
      {required GetNearbyRepeatersFamily super.from,
      required ({
        double latitude,
        double longitude,
        int limit,
      })
          super.argument})
      : super(
          retry: null,
          name: r'getNearbyRepeatersProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getNearbyRepeatersHash();

  @override
  String toString() {
    return r'getNearbyRepeatersProvider'
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
      double latitude,
      double longitude,
      int limit,
    });
    return getNearbyRepeaters(
      ref,
      latitude: argument.latitude,
      longitude: argument.longitude,
      limit: argument.limit,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetNearbyRepeatersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getNearbyRepeatersHash() =>
    r'4133dddad0e7fc1926a0cbab7b4933bb129722d0';

final class GetNearbyRepeatersFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<List<Repeater>>,
            ({
              double latitude,
              double longitude,
              int limit,
            })> {
  GetNearbyRepeatersFamily._()
      : super(
          retry: null,
          name: r'getNearbyRepeatersProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetNearbyRepeatersProvider call({
    required double latitude,
    required double longitude,
    int limit = 3,
  }) =>
      GetNearbyRepeatersProvider._(argument: (
        latitude: latitude,
        longitude: longitude,
        limit: limit,
      ), from: this);

  @override
  String toString() => r'getNearbyRepeatersProvider';
}
