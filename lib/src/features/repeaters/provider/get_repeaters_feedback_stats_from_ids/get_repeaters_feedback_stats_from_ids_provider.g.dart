// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_repeaters_feedback_stats_from_ids_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getRepeatersFeedbackStatsFromIds)
final getRepeatersFeedbackStatsFromIdsProvider =
    GetRepeatersFeedbackStatsFromIdsFamily._();

final class GetRepeatersFeedbackStatsFromIdsProvider
    extends $FunctionalProvider<
        AsyncValue<Map<String, RepeaterFeedbackStats>>,
        Map<String, RepeaterFeedbackStats>,
        FutureOr<Map<String, RepeaterFeedbackStats>>>
    with
        $FutureModifier<Map<String, RepeaterFeedbackStats>>,
        $FutureProvider<Map<String, RepeaterFeedbackStats>> {
  GetRepeatersFeedbackStatsFromIdsProvider._(
      {required GetRepeatersFeedbackStatsFromIdsFamily super.from,
      required List<String> super.argument})
      : super(
          retry: null,
          name: r'getRepeatersFeedbackStatsFromIdsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getRepeatersFeedbackStatsFromIdsHash();

  @override
  String toString() {
    return r'getRepeatersFeedbackStatsFromIdsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Map<String, RepeaterFeedbackStats>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, RepeaterFeedbackStats>> create(Ref ref) {
    final argument = this.argument as List<String>;
    return getRepeatersFeedbackStatsFromIds(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetRepeatersFeedbackStatsFromIdsProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getRepeatersFeedbackStatsFromIdsHash() =>
    r'e6051c9a35a5fc3d443f59a259d6685232ad1e0c';

final class GetRepeatersFeedbackStatsFromIdsFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<Map<String, RepeaterFeedbackStats>>,
            List<String>> {
  GetRepeatersFeedbackStatsFromIdsFamily._()
      : super(
          retry: null,
          name: r'getRepeatersFeedbackStatsFromIdsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetRepeatersFeedbackStatsFromIdsProvider call(
    List<String> repeaterIds,
  ) =>
      GetRepeatersFeedbackStatsFromIdsProvider._(
          argument: repeaterIds, from: this);

  @override
  String toString() => r'getRepeatersFeedbackStatsFromIdsProvider';
}
