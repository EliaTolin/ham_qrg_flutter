// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_onboarding_profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Syncs locally-stored onboarding profile data (userType, callsign) to
/// Supabase after the user registers (Google/Apple sign-in).
///
/// If the Supabase profile already has these fields (e.g., re-login on
/// another device), it does NOT overwrite them.

@ProviderFor(syncOnboardingProfile)
final syncOnboardingProfileProvider = SyncOnboardingProfileProvider._();

/// Syncs locally-stored onboarding profile data (userType, callsign) to
/// Supabase after the user registers (Google/Apple sign-in).
///
/// If the Supabase profile already has these fields (e.g., re-login on
/// another device), it does NOT overwrite them.

final class SyncOnboardingProfileProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// Syncs locally-stored onboarding profile data (userType, callsign) to
  /// Supabase after the user registers (Google/Apple sign-in).
  ///
  /// If the Supabase profile already has these fields (e.g., re-login on
  /// another device), it does NOT overwrite them.
  SyncOnboardingProfileProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'syncOnboardingProfileProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$syncOnboardingProfileHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return syncOnboardingProfile(ref);
  }
}

String _$syncOnboardingProfileHash() =>
    r'a1ef8ad24503b5ae94236ce9ac69ade15dc36a67';
