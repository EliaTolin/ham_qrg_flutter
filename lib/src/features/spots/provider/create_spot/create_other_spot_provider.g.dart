// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_other_spot_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(createOtherSpot)
final createOtherSpotProvider = CreateOtherSpotFamily._();

final class CreateOtherSpotProvider extends $FunctionalProvider<
        AsyncValue<RepeaterSpot>, RepeaterSpot, FutureOr<RepeaterSpot>>
    with $FutureModifier<RepeaterSpot>, $FutureProvider<RepeaterSpot> {
  CreateOtherSpotProvider._(
      {required CreateOtherSpotFamily super.from,
      required ({
        String repeaterId,
        String spottedCallsign,
        String? accessId,
        int? talkgroup,
      })
          super.argument})
      : super(
          retry: null,
          name: r'createOtherSpotProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$createOtherSpotHash();

  @override
  String toString() {
    return r'createOtherSpotProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<RepeaterSpot> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<RepeaterSpot> create(Ref ref) {
    final argument = this.argument as ({
      String repeaterId,
      String spottedCallsign,
      String? accessId,
      int? talkgroup,
    });
    return createOtherSpot(
      ref,
      repeaterId: argument.repeaterId,
      spottedCallsign: argument.spottedCallsign,
      accessId: argument.accessId,
      talkgroup: argument.talkgroup,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CreateOtherSpotProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$createOtherSpotHash() => r'2f432a6ad5606dacbf9d6c449f4355d927f03b1e';

final class CreateOtherSpotFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<RepeaterSpot>,
            ({
              String repeaterId,
              String spottedCallsign,
              String? accessId,
              int? talkgroup,
            })> {
  CreateOtherSpotFamily._()
      : super(
          retry: null,
          name: r'createOtherSpotProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  CreateOtherSpotProvider call({
    required String repeaterId,
    required String spottedCallsign,
    String? accessId,
    int? talkgroup,
  }) =>
      CreateOtherSpotProvider._(argument: (
        repeaterId: repeaterId,
        spottedCallsign: spottedCallsign,
        accessId: accessId,
        talkgroup: talkgroup,
      ), from: this);

  @override
  String toString() => r'createOtherSpotProvider';
}
