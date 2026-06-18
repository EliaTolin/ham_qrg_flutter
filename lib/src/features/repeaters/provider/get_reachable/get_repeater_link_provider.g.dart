// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_repeater_link_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Full point-to-point link (with terrain profile) from the user to one
/// repeater — powers the elevation/signal chart and the preview badge.

@ProviderFor(getRepeaterLink)
final getRepeaterLinkProvider = GetRepeaterLinkFamily._();

/// Full point-to-point link (with terrain profile) from the user to one
/// repeater — powers the elevation/signal chart and the preview badge.

final class GetRepeaterLinkProvider extends $FunctionalProvider<
        AsyncValue<LinkProfile>, LinkProfile, FutureOr<LinkProfile>>
    with $FutureModifier<LinkProfile>, $FutureProvider<LinkProfile> {
  /// Full point-to-point link (with terrain profile) from the user to one
  /// repeater — powers the elevation/signal chart and the preview badge.
  GetRepeaterLinkProvider._(
      {required GetRepeaterLinkFamily super.from,
      required ({
        double userLat,
        double userLon,
        String repeaterId,
        double repeaterLat,
        double repeaterLon,
        int frequencyHz,
        double rxHeightM,
      })
          super.argument})
      : super(
          retry: null,
          name: r'getRepeaterLinkProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getRepeaterLinkHash();

  @override
  String toString() {
    return r'getRepeaterLinkProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<LinkProfile> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<LinkProfile> create(Ref ref) {
    final argument = this.argument as ({
      double userLat,
      double userLon,
      String repeaterId,
      double repeaterLat,
      double repeaterLon,
      int frequencyHz,
      double rxHeightM,
    });
    return getRepeaterLink(
      ref,
      userLat: argument.userLat,
      userLon: argument.userLon,
      repeaterId: argument.repeaterId,
      repeaterLat: argument.repeaterLat,
      repeaterLon: argument.repeaterLon,
      frequencyHz: argument.frequencyHz,
      rxHeightM: argument.rxHeightM,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetRepeaterLinkProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getRepeaterLinkHash() => r'b8034667e7ca4becac2056cca015fd4e8c64837c';

/// Full point-to-point link (with terrain profile) from the user to one
/// repeater — powers the elevation/signal chart and the preview badge.

final class GetRepeaterLinkFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<LinkProfile>,
            ({
              double userLat,
              double userLon,
              String repeaterId,
              double repeaterLat,
              double repeaterLon,
              int frequencyHz,
              double rxHeightM,
            })> {
  GetRepeaterLinkFamily._()
      : super(
          retry: null,
          name: r'getRepeaterLinkProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// Full point-to-point link (with terrain profile) from the user to one
  /// repeater — powers the elevation/signal chart and the preview badge.

  GetRepeaterLinkProvider call({
    required double userLat,
    required double userLon,
    required String repeaterId,
    required double repeaterLat,
    required double repeaterLon,
    required int frequencyHz,
    double rxHeightM = 2.0,
  }) =>
      GetRepeaterLinkProvider._(argument: (
        userLat: userLat,
        userLon: userLon,
        repeaterId: repeaterId,
        repeaterLat: repeaterLat,
        repeaterLon: repeaterLon,
        frequencyHz: frequencyHz,
        rxHeightM: rxHeightM,
      ), from: this);

  @override
  String toString() => r'getRepeaterLinkProvider';
}
