// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_repeater_feedbacks_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getMyRepeaterFeedbacks)
final getMyRepeaterFeedbacksProvider = GetMyRepeaterFeedbacksFamily._();

final class GetMyRepeaterFeedbacksProvider extends $FunctionalProvider<
        AsyncValue<List<RepeaterFeedback>>,
        List<RepeaterFeedback>,
        FutureOr<List<RepeaterFeedback>>>
    with
        $FutureModifier<List<RepeaterFeedback>>,
        $FutureProvider<List<RepeaterFeedback>> {
  GetMyRepeaterFeedbacksProvider._(
      {required GetMyRepeaterFeedbacksFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'getMyRepeaterFeedbacksProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getMyRepeaterFeedbacksHash();

  @override
  String toString() {
    return r'getMyRepeaterFeedbacksProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<RepeaterFeedback>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<RepeaterFeedback>> create(Ref ref) {
    final argument = this.argument as String;
    return getMyRepeaterFeedbacks(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetMyRepeaterFeedbacksProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getMyRepeaterFeedbacksHash() =>
    r'13139642aef92bb5b1d6da352c058e39579d1019';

final class GetMyRepeaterFeedbacksFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<RepeaterFeedback>>, String> {
  GetMyRepeaterFeedbacksFamily._()
      : super(
          retry: null,
          name: r'getMyRepeaterFeedbacksProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetMyRepeaterFeedbacksProvider call(
    String repeaterId,
  ) =>
      GetMyRepeaterFeedbacksProvider._(argument: repeaterId, from: this);

  @override
  String toString() => r'getMyRepeaterFeedbacksProvider';
}
