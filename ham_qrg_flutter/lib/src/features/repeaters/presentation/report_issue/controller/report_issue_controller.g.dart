// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_issue_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReportIssueController)
final reportIssueControllerProvider = ReportIssueControllerFamily._();

final class ReportIssueControllerProvider
    extends $AsyncNotifierProvider<ReportIssueController, ReportIssueState> {
  ReportIssueControllerProvider._(
      {required ReportIssueControllerFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'reportIssueControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$reportIssueControllerHash();

  @override
  String toString() {
    return r'reportIssueControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ReportIssueController create() => ReportIssueController();

  @override
  bool operator ==(Object other) {
    return other is ReportIssueControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reportIssueControllerHash() =>
    r'604a632fcb46cddb9ec31138445379fafd43dab6';

final class ReportIssueControllerFamily extends $Family
    with
        $ClassFamilyOverride<
            ReportIssueController,
            AsyncValue<ReportIssueState>,
            ReportIssueState,
            FutureOr<ReportIssueState>,
            String> {
  ReportIssueControllerFamily._()
      : super(
          retry: null,
          name: r'reportIssueControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ReportIssueControllerProvider call(
    String repeaterId,
  ) =>
      ReportIssueControllerProvider._(argument: repeaterId, from: this);

  @override
  String toString() => r'reportIssueControllerProvider';
}

abstract class _$ReportIssueController
    extends $AsyncNotifier<ReportIssueState> {
  late final _$args = ref.$arg as String;
  String get repeaterId => _$args;

  FutureOr<ReportIssueState> build(
    String repeaterId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ReportIssueState>, ReportIssueState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<ReportIssueState>, ReportIssueState>,
        AsyncValue<ReportIssueState>,
        Object?,
        Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}
