// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_repeater_submission_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(submitRepeaterSubmission)
final submitRepeaterSubmissionProvider = SubmitRepeaterSubmissionFamily._();

final class SubmitRepeaterSubmissionProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  SubmitRepeaterSubmissionProvider._(
      {required SubmitRepeaterSubmissionFamily super.from,
      required ({
        String name,
        String callsign,
        int frequencyHz,
        List<Map<String, dynamic>> accesses,
        int? shiftHz,
        String? region,
        String? provinceCode,
        String? locality,
        double? lat,
        double? lon,
        String? locator,
        String? notes,
      })
          super.argument})
      : super(
          retry: null,
          name: r'submitRepeaterSubmissionProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$submitRepeaterSubmissionHash();

  @override
  String toString() {
    return r'submitRepeaterSubmissionProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as ({
      String name,
      String callsign,
      int frequencyHz,
      List<Map<String, dynamic>> accesses,
      int? shiftHz,
      String? region,
      String? provinceCode,
      String? locality,
      double? lat,
      double? lon,
      String? locator,
      String? notes,
    });
    return submitRepeaterSubmission(
      ref,
      name: argument.name,
      callsign: argument.callsign,
      frequencyHz: argument.frequencyHz,
      accesses: argument.accesses,
      shiftHz: argument.shiftHz,
      region: argument.region,
      provinceCode: argument.provinceCode,
      locality: argument.locality,
      lat: argument.lat,
      lon: argument.lon,
      locator: argument.locator,
      notes: argument.notes,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SubmitRepeaterSubmissionProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$submitRepeaterSubmissionHash() =>
    r'1769414f15477c28e666fab81271a20212f5010c';

final class SubmitRepeaterSubmissionFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<void>,
            ({
              String name,
              String callsign,
              int frequencyHz,
              List<Map<String, dynamic>> accesses,
              int? shiftHz,
              String? region,
              String? provinceCode,
              String? locality,
              double? lat,
              double? lon,
              String? locator,
              String? notes,
            })> {
  SubmitRepeaterSubmissionFamily._()
      : super(
          retry: null,
          name: r'submitRepeaterSubmissionProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  SubmitRepeaterSubmissionProvider call({
    required String name,
    required String callsign,
    required int frequencyHz,
    required List<Map<String, dynamic>> accesses,
    int? shiftHz,
    String? region,
    String? provinceCode,
    String? locality,
    double? lat,
    double? lon,
    String? locator,
    String? notes,
  }) =>
      SubmitRepeaterSubmissionProvider._(argument: (
        name: name,
        callsign: callsign,
        frequencyHz: frequencyHz,
        accesses: accesses,
        shiftHz: shiftHz,
        region: region,
        provinceCode: provinceCode,
        locality: locality,
        lat: lat,
        lon: lon,
        locator: locator,
        notes: notes,
      ), from: this);

  @override
  String toString() => r'submitRepeaterSubmissionProvider';
}
