// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pota_spot_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PotaSpotDetailController)
final potaSpotDetailControllerProvider = PotaSpotDetailControllerFamily._();

final class PotaSpotDetailControllerProvider extends $AsyncNotifierProvider<
    PotaSpotDetailController, PotaSpotDetailState> {
  PotaSpotDetailControllerProvider._(
      {required PotaSpotDetailControllerFamily super.from,
      required (
        int,
        String,
      )
          super.argument})
      : super(
          retry: null,
          name: r'potaSpotDetailControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$potaSpotDetailControllerHash();

  @override
  String toString() {
    return r'potaSpotDetailControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  PotaSpotDetailController create() => PotaSpotDetailController();

  @override
  bool operator ==(Object other) {
    return other is PotaSpotDetailControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$potaSpotDetailControllerHash() =>
    r'9fe8a206b611cb37e95d1d59a1702c4e62f32934';

final class PotaSpotDetailControllerFamily extends $Family
    with
        $ClassFamilyOverride<
            PotaSpotDetailController,
            AsyncValue<PotaSpotDetailState>,
            PotaSpotDetailState,
            FutureOr<PotaSpotDetailState>,
            (
              int,
              String,
            )> {
  PotaSpotDetailControllerFamily._()
      : super(
          retry: null,
          name: r'potaSpotDetailControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  PotaSpotDetailControllerProvider call(
    int spotId,
    String reference,
  ) =>
      PotaSpotDetailControllerProvider._(argument: (
        spotId,
        reference,
      ), from: this);

  @override
  String toString() => r'potaSpotDetailControllerProvider';
}

abstract class _$PotaSpotDetailController
    extends $AsyncNotifier<PotaSpotDetailState> {
  late final _$args = ref.$arg as (
    int,
    String,
  );
  int get spotId => _$args.$1;
  String get reference => _$args.$2;

  FutureOr<PotaSpotDetailState> build(
    int spotId,
    String reference,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<PotaSpotDetailState>, PotaSpotDetailState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<PotaSpotDetailState>, PotaSpotDetailState>,
        AsyncValue<PotaSpotDetailState>,
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
