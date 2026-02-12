// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_repeater_feedback_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getMyRepeaterFeedback)
final getMyRepeaterFeedbackProvider = GetMyRepeaterFeedbackFamily._();

final class GetMyRepeaterFeedbackProvider extends $FunctionalProvider<
        AsyncValue<RepeaterFeedback?>,
        RepeaterFeedback?,
        FutureOr<RepeaterFeedback?>>
    with
        $FutureModifier<RepeaterFeedback?>,
        $FutureProvider<RepeaterFeedback?> {
  GetMyRepeaterFeedbackProvider._(
      {required GetMyRepeaterFeedbackFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'getMyRepeaterFeedbackProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getMyRepeaterFeedbackHash();

  @override
  String toString() {
    return r'getMyRepeaterFeedbackProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<RepeaterFeedback?> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<RepeaterFeedback?> create(Ref ref) {
    final argument = this.argument as String;
    return getMyRepeaterFeedback(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetMyRepeaterFeedbackProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getMyRepeaterFeedbackHash() =>
    r'b8869c98485ce949c7e0e53952193def935820d8';

final class GetMyRepeaterFeedbackFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<RepeaterFeedback?>, String> {
  GetMyRepeaterFeedbackFamily._()
      : super(
          retry: null,
          name: r'getMyRepeaterFeedbackProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetMyRepeaterFeedbackProvider call(
    String repeaterId,
  ) =>
      GetMyRepeaterFeedbackProvider._(argument: repeaterId, from: this);

  @override
  String toString() => r'getMyRepeaterFeedbackProvider';
}
