// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repeater_detail_map_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RepeaterDetailMapController)
final repeaterDetailMapControllerProvider =
    RepeaterDetailMapControllerFamily._();

final class RepeaterDetailMapControllerProvider extends $AsyncNotifierProvider<
    RepeaterDetailMapController, RepeaterDetailMapState> {
  RepeaterDetailMapControllerProvider._(
      {required RepeaterDetailMapControllerFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'repeaterDetailMapControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$repeaterDetailMapControllerHash();

  @override
  String toString() {
    return r'repeaterDetailMapControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RepeaterDetailMapController create() => RepeaterDetailMapController();

  @override
  bool operator ==(Object other) {
    return other is RepeaterDetailMapControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$repeaterDetailMapControllerHash() =>
    r'29c824aa7e51fe568791d4f3410907af32fa2cca';

final class RepeaterDetailMapControllerFamily extends $Family
    with
        $ClassFamilyOverride<
            RepeaterDetailMapController,
            AsyncValue<RepeaterDetailMapState>,
            RepeaterDetailMapState,
            FutureOr<RepeaterDetailMapState>,
            String> {
  RepeaterDetailMapControllerFamily._()
      : super(
          retry: null,
          name: r'repeaterDetailMapControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  RepeaterDetailMapControllerProvider call(
    String repeaterId,
  ) =>
      RepeaterDetailMapControllerProvider._(argument: repeaterId, from: this);

  @override
  String toString() => r'repeaterDetailMapControllerProvider';
}

abstract class _$RepeaterDetailMapController
    extends $AsyncNotifier<RepeaterDetailMapState> {
  late final _$args = ref.$arg as String;
  String get repeaterId => _$args;

  FutureOr<RepeaterDetailMapState> build(
    String repeaterId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref
        as $Ref<AsyncValue<RepeaterDetailMapState>, RepeaterDetailMapState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<RepeaterDetailMapState>, RepeaterDetailMapState>,
        AsyncValue<RepeaterDetailMapState>,
        Object?,
        Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}
