// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_repeater_feedback_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(deleteRepeaterFeedback)
final deleteRepeaterFeedbackProvider = DeleteRepeaterFeedbackFamily._();

final class DeleteRepeaterFeedbackProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  DeleteRepeaterFeedbackProvider._(
      {required DeleteRepeaterFeedbackFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'deleteRepeaterFeedbackProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deleteRepeaterFeedbackHash();

  @override
  String toString() {
    return r'deleteRepeaterFeedbackProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as String;
    return deleteRepeaterFeedback(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteRepeaterFeedbackProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteRepeaterFeedbackHash() =>
    r'6574c653677b9814616170e15c855c0c76d037bd';

final class DeleteRepeaterFeedbackFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, String> {
  DeleteRepeaterFeedbackFamily._()
      : super(
          retry: null,
          name: r'deleteRepeaterFeedbackProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  DeleteRepeaterFeedbackProvider call(
    String feedbackId,
  ) =>
      DeleteRepeaterFeedbackProvider._(argument: feedbackId, from: this);

  @override
  String toString() => r'deleteRepeaterFeedbackProvider';
}
