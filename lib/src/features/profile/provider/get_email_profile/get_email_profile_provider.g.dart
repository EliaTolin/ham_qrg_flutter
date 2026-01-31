// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_email_profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getEmailProfile)
final getEmailProfileProvider = GetEmailProfileProvider._();

final class GetEmailProfileProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  GetEmailProfileProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getEmailProfileProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getEmailProfileHash();

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    return getEmailProfile(ref);
  }
}

String _$getEmailProfileHash() => r'ac4b1ca2d5916f6cf9e56a025cb51092a6bc1ffa';
