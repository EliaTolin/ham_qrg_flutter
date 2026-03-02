// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_reports_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserReportsController)
final userReportsControllerProvider = UserReportsControllerProvider._();

final class UserReportsControllerProvider
    extends $AsyncNotifierProvider<UserReportsController, UserReportsState> {
  UserReportsControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userReportsControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userReportsControllerHash();

  @$internal
  @override
  UserReportsController create() => UserReportsController();
}

String _$userReportsControllerHash() =>
    r'f8049ddbd437e82af6b85c0460b6cbc80481db0b';

abstract class _$UserReportsController
    extends $AsyncNotifier<UserReportsState> {
  FutureOr<UserReportsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<UserReportsState>, UserReportsState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<UserReportsState>, UserReportsState>,
        AsyncValue<UserReportsState>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
