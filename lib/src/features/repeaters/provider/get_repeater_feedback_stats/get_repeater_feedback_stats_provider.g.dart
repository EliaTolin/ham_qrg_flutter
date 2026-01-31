// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_repeater_feedback_stats_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getRepeaterFeedbackStats)
final getRepeaterFeedbackStatsProvider = GetRepeaterFeedbackStatsFamily._();

final class GetRepeaterFeedbackStatsProvider extends $FunctionalProvider<
        AsyncValue<RepeaterFeedbackStats?>,
        RepeaterFeedbackStats?,
        FutureOr<RepeaterFeedbackStats?>>
    with
        $FutureModifier<RepeaterFeedbackStats?>,
        $FutureProvider<RepeaterFeedbackStats?> {
  GetRepeaterFeedbackStatsProvider._(
      {required GetRepeaterFeedbackStatsFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'getRepeaterFeedbackStatsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getRepeaterFeedbackStatsHash();

  @override
  String toString() {
    return r'getRepeaterFeedbackStatsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<RepeaterFeedbackStats?> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<RepeaterFeedbackStats?> create(Ref ref) {
    final argument = this.argument as String;
    return getRepeaterFeedbackStats(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetRepeaterFeedbackStatsProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getRepeaterFeedbackStatsHash() =>
    r'f479c527dfa47405042c90236c11200167a7489e';

final class GetRepeaterFeedbackStatsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<RepeaterFeedbackStats?>, String> {
  GetRepeaterFeedbackStatsFamily._()
      : super(
          retry: null,
          name: r'getRepeaterFeedbackStatsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetRepeaterFeedbackStatsProvider call(
    String repeaterId,
  ) =>
      GetRepeaterFeedbackStatsProvider._(argument: repeaterId, from: this);

  @override
  String toString() => r'getRepeaterFeedbackStatsProvider';
}
