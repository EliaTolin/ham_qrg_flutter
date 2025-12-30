// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_repeater_feedback_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(addRepeaterFeedback)
final addRepeaterFeedbackProvider = AddRepeaterFeedbackFamily._();

final class AddRepeaterFeedbackProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  AddRepeaterFeedbackProvider._(
      {required AddRepeaterFeedbackFamily super.from,
      required ({
        String repeaterId,
        FeedbackType type,
        StationKind station,
        double latitude,
        double longitude,
        String comment,
      })
          super.argument})
      : super(
          retry: null,
          name: r'addRepeaterFeedbackProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$addRepeaterFeedbackHash();

  @override
  String toString() {
    return r'addRepeaterFeedbackProvider'
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
      FeedbackType type,
      StationKind station,
      double latitude,
      double longitude,
      String comment,
    });
    return addRepeaterFeedback(
      ref,
      repeaterId: argument.repeaterId,
      type: argument.type,
      station: argument.station,
      latitude: argument.latitude,
      longitude: argument.longitude,
      comment: argument.comment,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AddRepeaterFeedbackProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$addRepeaterFeedbackHash() =>
    r'e258af1b40aebf3cd404c874196b9a9960d73c6d';

final class AddRepeaterFeedbackFamily extends $Family
    with
        $FunctionalFamilyOverride<
            FutureOr<void>,
            ({
              String repeaterId,
              FeedbackType type,
              StationKind station,
              double latitude,
              double longitude,
              String comment,
            })> {
  AddRepeaterFeedbackFamily._()
      : super(
          retry: null,
          name: r'addRepeaterFeedbackProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  AddRepeaterFeedbackProvider call({
    required String repeaterId,
    required FeedbackType type,
    required StationKind station,
    required double latitude,
    required double longitude,
    required String comment,
  }) =>
      AddRepeaterFeedbackProvider._(argument: (
        repeaterId: repeaterId,
        type: type,
        station: station,
        latitude: latitude,
        longitude: longitude,
        comment: comment,
      ), from: this);

  @override
  String toString() => r'addRepeaterFeedbackProvider';
}

