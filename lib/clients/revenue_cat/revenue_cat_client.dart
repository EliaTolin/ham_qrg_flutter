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

  /// Attaches identity attributes to the current RevenueCat customer so they
  /// surface in the dashboard and downstream integrations (email/marketing).
  ///
  /// [email] maps to RevenueCat's reserved `$email`, [displayName] to
  /// `$displayName`; [custom] holds extra attributes (e.g. first/last name,
  /// callsign). No-op when the API key is unset. Null/empty values are skipped.
  ///
  /// Must be called AFTER [login] so the attributes land on the right customer.
  Future<void> setUserAttributes({
    String? email,
    String? displayName,
    Map<String, String?> custom,
  });

  /// Whether the customer currently owns the Pro entitlement.
  Future<bool> isPro();

  /// Emits the Pro entitlement status whenever RevenueCat reports a change
  /// (purchase, restore, expiration, webhook-driven refresh, …).
  Stream<bool> proStatusChanges();

  /// Restores purchases made on another device or after a reinstall.
  /// Returns `true` if Pro is active once the restore completes.
  ///
  /// Needed as a visible affordance next to the upsells: a user who already
  /// paid must not have to walk through a paywall to get their entitlement
  /// back — showing them a price they already paid is the fastest way to make
  /// them think they were charged twice.
  Future<bool> restorePurchases();

  /// Presents the RevenueCat remote paywall unconditionally.
  /// Returns `true` if the user purchased or restored Pro.
  ///
  /// [placementId] identifies *where in the app* the purchase was requested
  /// (a placement configured in the RevenueCat dashboard). Which offering —
  /// and therefore which paywall — that placement resolves to is decided
  /// remotely, per audience. Falls back to the project's current offering
  /// when the placement is null or not configured, so the app keeps selling
  /// even with an empty placement setup.
  Future<bool> presentPaywall({String? placementId});

  /// Presents the RevenueCat remote paywall only if the user does not already
  /// own the Pro entitlement. Returns `true` if Pro is (now) active.
  ///
  /// [placementId] behaves as in [presentPaywall].
  Future<bool> presentPaywallIfNeeded({String? placementId});
}
