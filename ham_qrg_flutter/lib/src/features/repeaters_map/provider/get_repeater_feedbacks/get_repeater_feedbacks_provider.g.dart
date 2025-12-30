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
        AsyncValue<List<Feedback>>, List<Feedback>, FutureOr<List<Feedback>>>
    with $FutureModifier<List<Feedback>>, $FutureProvider<List<Feedback>> {
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
  $FutureProviderElement<List<Feedback>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Feedback>> create(Ref ref) {
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
    r'7e3a1c23f6e19c918841cfbb69279bff004c70b9';

final class GetRepeaterFeedbacksFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<List<Feedback>>,
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

