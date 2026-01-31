// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repeater_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RepeaterDetailController)
final repeaterDetailControllerProvider = RepeaterDetailControllerFamily._();

final class RepeaterDetailControllerProvider extends $AsyncNotifierProvider<
    RepeaterDetailController, RepeaterDetailState> {
  RepeaterDetailControllerProvider._(
      {required RepeaterDetailControllerFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'repeaterDetailControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$repeaterDetailControllerHash();

  @override
  String toString() {
    return r'repeaterDetailControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RepeaterDetailController create() => RepeaterDetailController();

  @override
  bool operator ==(Object other) {
    return other is RepeaterDetailControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$repeaterDetailControllerHash() =>
    r'a714157666606c82d0e3e5d9cac401ef79325e21';

final class RepeaterDetailControllerFamily extends $Family
    with
        $ClassFamilyOverride<
            RepeaterDetailController,
            AsyncValue<RepeaterDetailState>,
            RepeaterDetailState,
            FutureOr<RepeaterDetailState>,
            String> {
  RepeaterDetailControllerFamily._()
      : super(
          retry: null,
          name: r'repeaterDetailControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  RepeaterDetailControllerProvider call(
    String repeaterId,
  ) =>
      RepeaterDetailControllerProvider._(argument: repeaterId, from: this);

  @override
  String toString() => r'repeaterDetailControllerProvider';
}

abstract class _$RepeaterDetailController
    extends $AsyncNotifier<RepeaterDetailState> {
  late final _$args = ref.$arg as String;
  String get repeaterId => _$args;

  FutureOr<RepeaterDetailState> build(
    String repeaterId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<RepeaterDetailState>, RepeaterDetailState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<RepeaterDetailState>, RepeaterDetailState>,
        AsyncValue<RepeaterDetailState>,
        Object?,
        Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}
