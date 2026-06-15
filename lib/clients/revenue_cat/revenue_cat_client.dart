/// Abstraction over the RevenueCat SDK (`Purchases`) for the HamQRG Pro tier.
///
/// Implementations proxy the RevenueCat singleton, so the SDK must be
/// configured once at app startup via [configure] before any other call.
abstract class RevenueCatClient {
  /// Configures the RevenueCat SDK. Must be called once at startup.
  /// No-op when the API key is not set (e.g. on unsupported platforms).
  Future<void> configure();

  /// Links the current store/RevenueCat customer to a stable [userId]
  /// (the Supabase user id), so entitlements follow the account across devices.
  Future<void> login(String userId);

  /// Resets RevenueCat back to an anonymous customer (e.g. on sign-out).
  Future<void> logout();

  /// Whether the customer currently owns the Pro entitlement.
  Future<bool> isPro();

  /// Emits the Pro entitlement status whenever RevenueCat reports a change
  /// (purchase, restore, expiration, webhook-driven refresh, …).
  Stream<bool> proStatusChanges();

  /// Presents the RevenueCat remote paywall unconditionally.
  /// Returns `true` if the user purchased or restored Pro.
  Future<bool> presentPaywall();

  /// Presents the RevenueCat remote paywall only if the user does not already
  /// own the Pro entitlement. Returns `true` if Pro is (now) active.
  Future<bool> presentPaywallIfNeeded();
}
