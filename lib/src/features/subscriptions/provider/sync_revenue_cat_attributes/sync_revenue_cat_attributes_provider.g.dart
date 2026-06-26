// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_revenue_cat_attributes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Keeps the RevenueCat customer's identity attributes (email, display name,
/// first/last name, callsign) in sync with the authenticated profile.
///
/// Reactive + keepAlive: mount it once at startup (read from the splash) and it
/// re-pushes whenever [getProfileProvider] changes — covering sign-in, profile
/// updates (e.g. callsign set during onboarding) and account switches.
///
/// No-op while no profile is available (anonymous user); RevenueCat's
/// `logOut` already clears the attributes on sign-out.

@ProviderFor(syncRevenueCatAttributes)
final syncRevenueCatAttributesProvider = SyncRevenueCatAttributesProvider._();

/// Keeps the RevenueCat customer's identity attributes (email, display name,
/// first/last name, callsign) in sync with the authenticated profile.
///
/// Reactive + keepAlive: mount it once at startup (read from the splash) and it
/// re-pushes whenever [getProfileProvider] changes — covering sign-in, profile
/// updates (e.g. callsign set during onboarding) and account switches.
///
/// No-op while no profile is available (anonymous user); RevenueCat's
/// `logOut` already clears the attributes on sign-out.

final class SyncRevenueCatAttributesProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// Keeps the RevenueCat customer's identity attributes (email, display name,
  /// first/last name, callsign) in sync with the authenticated profile.
  ///
  /// Reactive + keepAlive: mount it once at startup (read from the splash) and it
  /// re-pushes whenever [getProfileProvider] changes — covering sign-in, profile
  /// updates (e.g. callsign set during onboarding) and account switches.
  ///
  /// No-op while no profile is available (anonymous user); RevenueCat's
  /// `logOut` already clears the attributes on sign-out.
  SyncRevenueCatAttributesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'syncRevenueCatAttributesProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$syncRevenueCatAttributesHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return syncRevenueCatAttributes(ref);
  }
}

String _$syncRevenueCatAttributesHash() =>
    r'5a0793e19c3366208948f7b2ffb189be331aa536';
