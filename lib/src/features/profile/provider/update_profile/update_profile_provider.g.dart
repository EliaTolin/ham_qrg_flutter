// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(updateProfile)
final updateProfileProvider = UpdateProfileFamily._();

final class UpdateProfileProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  UpdateProfileProvider._(
      {required UpdateProfileFamily super.from,
      required Profile super.argument})
      : super(
          retry: null,
          name: r'updateProfileProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$updateProfileHash();

  @override
  String toString() {
    return r'updateProfileProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as Profile;
    return updateProfile(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateProfileProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateProfileHash() => r'66146972803fdcd57f88e40db273a54225f36ff8';

final class UpdateProfileFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, Profile> {
  UpdateProfileFamily._()
      : super(
          retry: null,
          name: r'updateProfileProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  UpdateProfileProvider call(
    Profile profile,
  ) =>
      UpdateProfileProvider._(argument: profile, from: this);

  @override
  String toString() => r'updateProfileProvider';
}
