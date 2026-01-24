// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repeater_details_sheet_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RepeaterDetailsSheetController)
final repeaterDetailsSheetControllerProvider =
    RepeaterDetailsSheetControllerFamily._();

final class RepeaterDetailsSheetControllerProvider
    extends $AsyncNotifierProvider<RepeaterDetailsSheetController,
        RepeaterDetailsSheetState> {
  RepeaterDetailsSheetControllerProvider._(
      {required RepeaterDetailsSheetControllerFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'repeaterDetailsSheetControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$repeaterDetailsSheetControllerHash();

  @override
  String toString() {
    return r'repeaterDetailsSheetControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RepeaterDetailsSheetController create() => RepeaterDetailsSheetController();

  @override
  bool operator ==(Object other) {
    return other is RepeaterDetailsSheetControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$repeaterDetailsSheetControllerHash() =>
    r'd0646975d4ea920d16bc9dbdc52855d80f7eb83a';

final class RepeaterDetailsSheetControllerFamily extends $Family
    with
        $ClassFamilyOverride<
            RepeaterDetailsSheetController,
            AsyncValue<RepeaterDetailsSheetState>,
            RepeaterDetailsSheetState,
            FutureOr<RepeaterDetailsSheetState>,
            String> {
  RepeaterDetailsSheetControllerFamily._()
      : super(
          retry: null,
          name: r'repeaterDetailsSheetControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  RepeaterDetailsSheetControllerProvider call(
    String repeaterId,
  ) =>
      RepeaterDetailsSheetControllerProvider._(
          argument: repeaterId, from: this);

  @override
  String toString() => r'repeaterDetailsSheetControllerProvider';
}

abstract class _$RepeaterDetailsSheetController
    extends $AsyncNotifier<RepeaterDetailsSheetState> {
  late final _$args = ref.$arg as String;
  String get repeaterId => _$args;

  FutureOr<RepeaterDetailsSheetState> build(
    String repeaterId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<RepeaterDetailsSheetState>,
        RepeaterDetailsSheetState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<RepeaterDetailsSheetState>,
            RepeaterDetailsSheetState>,
        AsyncValue<RepeaterDetailsSheetState>,
        Object?,
        Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}
