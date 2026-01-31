// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_login_onboarding_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PostLoginOnboardingController)
final postLoginOnboardingControllerProvider =
    PostLoginOnboardingControllerProvider._();

final class PostLoginOnboardingControllerProvider extends $NotifierProvider<
    PostLoginOnboardingController, PostLoginOnboardingState> {
  PostLoginOnboardingControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'postLoginOnboardingControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$postLoginOnboardingControllerHash();

  @$internal
  @override
  PostLoginOnboardingController create() => PostLoginOnboardingController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostLoginOnboardingState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostLoginOnboardingState>(value),
    );
  }
}

String _$postLoginOnboardingControllerHash() =>
    r'7fa4c6b73735ad1c9048d0e5b063ae778224629d';

abstract class _$PostLoginOnboardingController
    extends $Notifier<PostLoginOnboardingState> {
  PostLoginOnboardingState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<PostLoginOnboardingState, PostLoginOnboardingState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<PostLoginOnboardingState, PostLoginOnboardingState>,
        PostLoginOnboardingState,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
