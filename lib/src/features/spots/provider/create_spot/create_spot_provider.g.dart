// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_spot_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(createSpot)
final createSpotProvider = CreateSpotFamily._();

final class CreateSpotProvider extends $FunctionalProvider<
        AsyncValue<RepeaterSpot>, RepeaterSpot, FutureOr<RepeaterSpot>>
    with $FutureModifier<RepeaterSpot>, $FutureProvider<RepeaterSpot> {
  CreateSpotProvider._(
      {required CreateSpotFamily super.from,
      required ({
        String repeaterId,
        int durationMinutes,
        String? accessId,
      })
          super.argument})
      : super(
          retry: null,
          name: r'createSpotProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$createSpotHash();

  @override
  String toString() {
    return r'createSpotProvider'
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
      int durationMinutes,
      String? accessId,
    });
    return createSpot(
      ref,
      repeaterId: argument.repeaterId,
      durationMinutes: argument.durationMinutes,
      accessId: argument.accessId,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CreateSpotProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$createSpotHash() => r'ced32adcb7c89aca6a9763520862ce8618d9a591';

final class CreateSpotFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<RepeaterSpot>,
            ({
              String repeaterId,
              int durationMinutes,
              String? accessId,
            })> {
  CreateSpotFamily._()
      : super(
          retry: null,
          name: r'createSpotProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  CreateSpotProvider call({
    required String repeaterId,
    required int durationMinutes,
    String? accessId,
  }) =>
      CreateSpotProvider._(argument: (
        repeaterId: repeaterId,
        durationMinutes: durationMinutes,
        accessId: accessId,
      ), from: this);

  @override
  String toString() => r'createSpotProvider';
}
