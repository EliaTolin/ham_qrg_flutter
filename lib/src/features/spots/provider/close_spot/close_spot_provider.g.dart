// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'close_spot_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(closeSpot)
final closeSpotProvider = CloseSpotFamily._();

final class CloseSpotProvider extends $FunctionalProvider<
        AsyncValue<RepeaterSpot>, RepeaterSpot, FutureOr<RepeaterSpot>>
    with $FutureModifier<RepeaterSpot>, $FutureProvider<RepeaterSpot> {
  CloseSpotProvider._(
      {required CloseSpotFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'closeSpotProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$closeSpotHash();

  @override
  String toString() {
    return r'closeSpotProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<RepeaterSpot> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<RepeaterSpot> create(Ref ref) {
    final argument = this.argument as String;
    return closeSpot(
      ref,
      spotId: argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CloseSpotProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$closeSpotHash() => r'd79e5d5c58320bf978a6f5eb250d40c28169414d';

final class CloseSpotFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<RepeaterSpot>, String> {
  CloseSpotFamily._()
      : super(
          retry: null,
          name: r'closeSpotProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  CloseSpotProvider call({
    required String spotId,
  }) =>
      CloseSpotProvider._(argument: spotId, from: this);

  @override
  String toString() => r'closeSpotProvider';
}
