// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChangePasswordController)
final changePasswordControllerProvider = ChangePasswordControllerProvider._();

final class ChangePasswordControllerProvider
    extends $AsyncNotifierProvider<ChangePasswordController, void> {
  ChangePasswordControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'changePasswordControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$changePasswordControllerHash();

  @$internal
  @override
  ChangePasswordController create() => ChangePasswordController();
}

String _$changePasswordControllerHash() =>
    r'bcfeb5b5e0a006c959f0e90134d452eddc999541';

abstract class _$ChangePasswordController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<void>, void>,
        AsyncValue<void>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
