// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_repeater_report_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(submitRepeaterReport)
final submitRepeaterReportProvider = SubmitRepeaterReportFamily._();

final class SubmitRepeaterReportProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  SubmitRepeaterReportProvider._(
      {required SubmitRepeaterReportFamily super.from,
      required ({
        String repeaterId,
        String description,
      })
          super.argument})
      : super(
          retry: null,
          name: r'submitRepeaterReportProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$submitRepeaterReportHash();

  @override
  String toString() {
    return r'submitRepeaterReportProvider'
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
      String repeaterId,
      String description,
    });
    return submitRepeaterReport(
      ref,
      repeaterId: argument.repeaterId,
      description: argument.description,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SubmitRepeaterReportProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$submitRepeaterReportHash() =>
    r'0b7d17226aef42bfb0a015f1aa04c0297af5a01a';

final class SubmitRepeaterReportFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<void>,
            ({
              String repeaterId,
              String description,
            })> {
  SubmitRepeaterReportFamily._()
      : super(
          retry: null,
          name: r'submitRepeaterReportProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  SubmitRepeaterReportProvider call({
    required String repeaterId,
    required String description,
  }) =>
      SubmitRepeaterReportProvider._(argument: (
        repeaterId: repeaterId,
        description: description,
      ), from: this);

  @override
  String toString() => r'submitRepeaterReportProvider';
}
