// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_repeater_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddRepeaterController)
final addRepeaterControllerProvider = AddRepeaterControllerProvider._();

final class AddRepeaterControllerProvider
    extends $NotifierProvider<AddRepeaterController, AddRepeaterState> {
  AddRepeaterControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'addRepeaterControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$addRepeaterControllerHash();

  @$internal
  @override
  AddRepeaterController create() => AddRepeaterController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddRepeaterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddRepeaterState>(value),
    );
  }
}

String _$addRepeaterControllerHash() =>
    r'b7bac26fb61deee3e5d98f7e3539d97d103738ac';

abstract class _$AddRepeaterController extends $Notifier<AddRepeaterState> {
  AddRepeaterState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AddRepeaterState, AddRepeaterState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AddRepeaterState, AddRepeaterState>,
        AddRepeaterState,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
