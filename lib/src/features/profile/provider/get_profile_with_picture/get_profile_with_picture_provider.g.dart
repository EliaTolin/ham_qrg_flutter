// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_with_picture_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getProfileWithPicture)
final getProfileWithPictureProvider = GetProfileWithPictureFamily._();

final class GetProfileWithPictureProvider extends $FunctionalProvider<
        AsyncValue<ProfileWithPicture>,
        ProfileWithPicture,
        FutureOr<ProfileWithPicture>>
    with
        $FutureModifier<ProfileWithPicture>,
        $FutureProvider<ProfileWithPicture> {
  GetProfileWithPictureProvider._(
      {required GetProfileWithPictureFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'getProfileWithPictureProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getProfileWithPictureHash();

  @override
  String toString() {
    return r'getProfileWithPictureProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ProfileWithPicture> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<ProfileWithPicture> create(Ref ref) {
    final argument = this.argument as String;
    return getProfileWithPicture(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetProfileWithPictureProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getProfileWithPictureHash() =>
    r'2744fff2d1b8d70f2ed3eb3a12de1ee38db2ef30';

final class GetProfileWithPictureFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ProfileWithPicture>, String> {
  GetProfileWithPictureFamily._()
      : super(
          retry: null,
          name: r'getProfileWithPictureProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GetProfileWithPictureProvider call(
    String userId,
  ) =>
      GetProfileWithPictureProvider._(argument: userId, from: this);

  @override
  String toString() => r'getProfileWithPictureProvider';
}
