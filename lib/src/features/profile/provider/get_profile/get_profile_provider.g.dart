// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getProfile)
final getProfileProvider = GetProfileProvider._();

final class GetProfileProvider
    extends $FunctionalProvider<AsyncValue<Profile>, Profile, FutureOr<Profile>>
    with $FutureModifier<Profile>, $FutureProvider<Profile> {
  GetProfileProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getProfileProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getProfileHash();

  @$internal
  @override
  $FutureProviderElement<Profile> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Profile> create(Ref ref) {
    return getProfile(ref);
  }
}

String _$getProfileHash() => r'6b01506c9209de496ab9d002c839c5906005cbea';
