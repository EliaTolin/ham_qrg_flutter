// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_spots_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ActiveSpotsNotifier)
final activeSpotsProvider = ActiveSpotsNotifierFamily._();

final class ActiveSpotsNotifierProvider
    extends $AsyncNotifierProvider<ActiveSpotsNotifier, List<RepeaterSpot>> {
  ActiveSpotsNotifierProvider._(
      {required ActiveSpotsNotifierFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'activeSpotsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$activeSpotsNotifierHash();

  @override
  String toString() {
    return r'activeSpotsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ActiveSpotsNotifier create() => ActiveSpotsNotifier();

  @override
  bool operator ==(Object other) {
    return other is ActiveSpotsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$activeSpotsNotifierHash() =>
    r'4fec30af52159b7f0ca28c6d51cc89ed15c145bd';

final class ActiveSpotsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
            ActiveSpotsNotifier,
            AsyncValue<List<RepeaterSpot>>,
            List<RepeaterSpot>,
            FutureOr<List<RepeaterSpot>>,
            String> {
  ActiveSpotsNotifierFamily._()
      : super(
          retry: null,
          name: r'activeSpotsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ActiveSpotsNotifierProvider call(
    String repeaterId,
  ) =>
      ActiveSpotsNotifierProvider._(argument: repeaterId, from: this);

  @override
  String toString() => r'activeSpotsProvider';
}

abstract class _$ActiveSpotsNotifier
    extends $AsyncNotifier<List<RepeaterSpot>> {
  late final _$args = ref.$arg as String;
  String get repeaterId => _$args;

  FutureOr<List<RepeaterSpot>> build(
    String repeaterId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<RepeaterSpot>>, List<RepeaterSpot>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<RepeaterSpot>>, List<RepeaterSpot>>,
        AsyncValue<List<RepeaterSpot>>,
        Object?,
        Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}
