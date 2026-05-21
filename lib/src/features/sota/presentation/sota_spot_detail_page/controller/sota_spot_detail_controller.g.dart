// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sota_spot_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Detail controller for a SOTA spot.
///
/// Loads the summit detail from the public SOTA API, then computes the
/// distance and bearing from the user's QTH to the summit client-side.
/// **Does not** call the altimetric-profile edge function — that backend
/// is designed for short-range repeater paths, not for SOTA summits which
/// can be hundreds of km away.

@ProviderFor(SotaSpotDetailController)
final sotaSpotDetailControllerProvider = SotaSpotDetailControllerFamily._();

/// Detail controller for a SOTA spot.
///
/// Loads the summit detail from the public SOTA API, then computes the
/// distance and bearing from the user's QTH to the summit client-side.
/// **Does not** call the altimetric-profile edge function — that backend
/// is designed for short-range repeater paths, not for SOTA summits which
/// can be hundreds of km away.
final class SotaSpotDetailControllerProvider extends $AsyncNotifierProvider<
    SotaSpotDetailController, SotaSpotDetailState> {
  /// Detail controller for a SOTA spot.
  ///
  /// Loads the summit detail from the public SOTA API, then computes the
  /// distance and bearing from the user's QTH to the summit client-side.
  /// **Does not** call the altimetric-profile edge function — that backend
  /// is designed for short-range repeater paths, not for SOTA summits which
  /// can be hundreds of km away.
  SotaSpotDetailControllerProvider._(
      {required SotaSpotDetailControllerFamily super.from,
      required (
        int,
        String,
      )
          super.argument})
      : super(
          retry: null,
          name: r'sotaSpotDetailControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sotaSpotDetailControllerHash();

  @override
  String toString() {
    return r'sotaSpotDetailControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  SotaSpotDetailController create() => SotaSpotDetailController();

  @override
  bool operator ==(Object other) {
    return other is SotaSpotDetailControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sotaSpotDetailControllerHash() =>
    r'3451d96581e1d819d4002bd057774601e051d485';

/// Detail controller for a SOTA spot.
///
/// Loads the summit detail from the public SOTA API, then computes the
/// distance and bearing from the user's QTH to the summit client-side.
/// **Does not** call the altimetric-profile edge function — that backend
/// is designed for short-range repeater paths, not for SOTA summits which
/// can be hundreds of km away.

final class SotaSpotDetailControllerFamily extends $Family
    with
        $ClassFamilyOverride<
            SotaSpotDetailController,
            AsyncValue<SotaSpotDetailState>,
            SotaSpotDetailState,
            FutureOr<SotaSpotDetailState>,
            (
              int,
              String,
            )> {
  SotaSpotDetailControllerFamily._()
      : super(
          retry: null,
          name: r'sotaSpotDetailControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// Detail controller for a SOTA spot.
  ///
  /// Loads the summit detail from the public SOTA API, then computes the
  /// distance and bearing from the user's QTH to the summit client-side.
  /// **Does not** call the altimetric-profile edge function — that backend
  /// is designed for short-range repeater paths, not for SOTA summits which
  /// can be hundreds of km away.

  SotaSpotDetailControllerProvider call(
    int spotId,
    String summitCode,
  ) =>
      SotaSpotDetailControllerProvider._(argument: (
        spotId,
        summitCode,
      ), from: this);

  @override
  String toString() => r'sotaSpotDetailControllerProvider';
}

/// Detail controller for a SOTA spot.
///
/// Loads the summit detail from the public SOTA API, then computes the
/// distance and bearing from the user's QTH to the summit client-side.
/// **Does not** call the altimetric-profile edge function — that backend
/// is designed for short-range repeater paths, not for SOTA summits which
/// can be hundreds of km away.

abstract class _$SotaSpotDetailController
    extends $AsyncNotifier<SotaSpotDetailState> {
  late final _$args = ref.$arg as (
    int,
    String,
  );
  int get spotId => _$args.$1;
  String get summitCode => _$args.$2;

  FutureOr<SotaSpotDetailState> build(
    int spotId,
    String summitCode,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<SotaSpotDetailState>, SotaSpotDetailState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<SotaSpotDetailState>, SotaSpotDetailState>,
        AsyncValue<SotaSpotDetailState>,
        Object?,
        Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args.$1,
              _$args.$2,
            ));
  }
}
