// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_repeater_feedbacks_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getRepeaterFeedbacks)
final getRepeaterFeedbacksProvider = GetRepeaterFeedbacksFamily._();

final class GetRepeaterFeedbacksProvider extends $FunctionalProvider<
        AsyncValue<List<RepeaterFeedback>>,
        List<RepeaterFeedback>,
        FutureOr<List<RepeaterFeedback>>>
    with
        $FutureModifier<List<RepeaterFeedback>>,
        $FutureProvider<List<RepeaterFeedback>> {
  GetRepeaterFeedbacksProvider._(
      {required GetRepeaterFeedbacksFamily super.from,
      required ({
        String repeaterId,
        int? limit,
      })
          super.argument})
      : super(
          retry: null,
          name: r'getRepeaterFeedbacksProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getRepeaterFeedbacksHash();

  @override
  String toString() {
    return r'getRepeaterFeedbacksProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<RepeaterFeedback>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<RepeaterFeedback>> create(Ref ref) {
    final argument = this.argument as ({
      String repeaterId,
      int? limit,
    });
    return getRepeaterFeedbacks(
      ref,
      repeaterId: argument.repeaterId,
      limit: argument.limit,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetRepeaterFeedbacksProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getRepeaterFeedbacksHash() =>
    r'3d8708f08e709074708f1c66701c58ca9508e41e';

final class GetRepeaterFeedbacksFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<List<RepeaterFeedback>>,
            ({
              String repeaterId,
              int? limit,
            })> {
  GetRepeaterFeedbacksFamily._()
      : super(
          retry: null,
          name: r'getRepeaterFeedbacksProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetRepeaterFeedbacksProvider call({
    required String repeaterId,
    int? limit,
  }) =>
      GetRepeaterFeedbacksProvider._(argument: (
        repeaterId: repeaterId,
        limit: limit,
      ), from: this);

  @override
  String toString() => r'getRepeaterFeedbacksProvider';
}
