// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserSettingsController)
final userSettingsControllerProvider = UserSettingsControllerProvider._();

final class UserSettingsControllerProvider
    extends $AsyncNotifierProvider<UserSettingsController, UserState> {
  UserSettingsControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userSettingsControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userSettingsControllerHash();

  @$internal
  @override
  UserSettingsController create() => UserSettingsController();
}

String _$userSettingsControllerHash() =>
    r'1afcd25d3c12e5b7eec47fd08ff5d844364a5fbd';

abstract class _$UserSettingsController extends $AsyncNotifier<UserState> {
  FutureOr<UserState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<UserState>, UserState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<UserState>, UserState>,
        AsyncValue<UserState>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
