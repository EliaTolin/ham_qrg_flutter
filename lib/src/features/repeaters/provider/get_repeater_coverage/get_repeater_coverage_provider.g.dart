// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_repeater_coverage_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getRepeaterCoverage)
final getRepeaterCoverageProvider = GetRepeaterCoverageFamily._();

final class GetRepeaterCoverageProvider extends $FunctionalProvider<
        AsyncValue<RepeaterCoverage>,
        RepeaterCoverage,
        FutureOr<RepeaterCoverage>>
    with $FutureModifier<RepeaterCoverage>, $FutureProvider<RepeaterCoverage> {
  GetRepeaterCoverageProvider._(
      {required GetRepeaterCoverageFamily super.from,
      required ({
        String repeaterId,
        double lat,
        double lon,
        int frequencyHz,
      })
          super.argument})
      : super(
          retry: null,
          name: r'getRepeaterCoverageProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getRepeaterCoverageHash();

  @override
  String toString() {
    return r'getRepeaterCoverageProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<RepeaterCoverage> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<RepeaterCoverage> create(Ref ref) {
    final argument = this.argument as ({
      String repeaterId,
      double lat,
      double lon,
      int frequencyHz,
    });
    return getRepeaterCoverage(
      ref,
      repeaterId: argument.repeaterId,
      lat: argument.lat,
      lon: argument.lon,
      frequencyHz: argument.frequencyHz,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetRepeaterCoverageProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getRepeaterCoverageHash() =>
    r'df2df646d034ce70e33d65a06cbd31b77816650c';

final class GetRepeaterCoverageFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<RepeaterCoverage>,
            ({
              String repeaterId,
              double lat,
              double lon,
              int frequencyHz,
            })> {
  GetRepeaterCoverageFamily._()
      : super(
          retry: null,
          name: r'getRepeaterCoverageProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetRepeaterCoverageProvider call({
    required String repeaterId,
    required double lat,
    required double lon,
    required int frequencyHz,
  }) =>
      GetRepeaterCoverageProvider._(argument: (
        repeaterId: repeaterId,
        lat: lat,
        lon: lon,
        frequencyHz: frequencyHz,
      ), from: this);

  @override
  String toString() => r'getRepeaterCoverageProvider';
}
