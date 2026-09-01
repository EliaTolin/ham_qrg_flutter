import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hamqrg/clients/revenue_cat/revenue_cat_client.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'revenue_cat_client_impl.g.dart';

/// RevenueCat-backed implementation of [RevenueCatClient].
///
/// Stateless proxy over the global [Purchases] singleton, so any number of
/// instances are safe — they all share the same configured SDK.
class RevenueCatClientImpl implements RevenueCatClient {
  @override
  Future<void> configure() async {
    final apiKey = AppConfigs.getRevenueCatApiKey();
    if (apiKey.isEmpty) return;

    if (kDebugMode) {
      await Purchases.setLogLevel(LogLevel.debug);
    }
    await Purchases.configure(PurchasesConfiguration(apiKey));
  }

  @override
  Future<void> login(String userId) async {
    if (AppConfigs.getRevenueCatApiKey().isEmpty) return;
    await Purchases.logIn(userId);
  }

  @override
  Future<void> logout() async {
    if (AppConfigs.getRevenueCatApiKey().isEmpty) return;
    try {
      await Purchases.logOut();
    } on PlatformException catch (e) {
      // Logging out an already-anonymous customer is a no-op for us.
      final code = PurchasesErrorHelper.getErrorCode(e);
      if (code != PurchasesErrorCode.logOutWithAnonymousUserError) {
        rethrow;
      }
    }
  }

  @override
  Future<void> setUserAttributes({
    String? email,
    String? displayName,
    Map<String, String?> custom = const {},
  }) async {
    if (AppConfigs.getRevenueCatApiKey().isEmpty) return;

    if (email != null && email.isNotEmpty) {
      await Purchases.setEmail(email);
    }
    if (displayName != null && displayName.isNotEmpty) {
      await Purchases.setDisplayName(displayName);
    }

    final attributes = <String, String>{};
    custom.forEach((key, value) {
      if (value != null && value.isNotEmpty) {
        attributes[key] = value;
      }
    });
    if (attributes.isNotEmpty) {
      await Purchases.setAttributes(attributes);
    }
  }

  @override
  Future<bool> restorePurchases() async {
    if (AppConfigs.getRevenueCatApiKey().isEmpty) return false;
    try {
      final info = await Purchases.restorePurchases();
      return _hasProEntitlement(info);
    } catch (error, stackTrace) {
      await Sentry.captureException(error, stackTrace: stackTrace);
      return false;
    }
  }

  @override
  Future<bool> isPro() async {
    if (AppConfigs.getRevenueCatApiKey().isEmpty) return false;
    final info = await Purchases.getCustomerInfo();
    final has = _hasProEntitlement(info);
    if (kDebugMode) {
      debugPrint(
        '[RevenueCat] isPro=$has | expecting entitlement '
        '"${AppConfigs.revenueCatProEntitlementId}" | active='
        '${info.entitlements.active.keys.toList()} | all='
        '${info.entitlements.all.keys.toList()} | activeSubs='
        '${info.activeSubscriptions.toList()}',
      );
    }
    return has;
  }

  @override
  Stream<bool> proStatusChanges() {
    final controller = StreamController<bool>();
    void listener(CustomerInfo info) =>
        controller.add(_hasProEntitlement(info));

    Purchases.addCustomerInfoUpdateListener(listener);
    controller.onCancel =
        () => Purchases.removeCustomerInfoUpdateListener(listener);
    return controller.stream;
  }

  @override
  Future<bool> presentPaywall({String? placementId}) async {
    final result = await RevenueCatUI.presentPaywall(
      offering: await _offeringFor(placementId),
    );
    return _isPurchaseSuccess(result);
  }

  @override
  Future<bool> presentPaywallIfNeeded({String? placementId}) async {
    final result = await RevenueCatUI.presentPaywallIfNeeded(
      AppConfigs.revenueCatProEntitlementId,
      offering: await _offeringFor(placementId),
    );
    return _isPurchaseSuccess(result);
  }

  /// Resolves the offering to display for [placementId], letting the
  /// dashboard — not the binary — decide which paywall the user sees.
  ///
  /// Order: the offering that RevenueCat's targeting rules assign to the
  /// placement, then the project's *current* offering. No offering id is
  /// hardcoded, so swapping the paywall for everyone is a "Make current"
  /// click in the dashboard, and swapping it for one screen or one audience
  /// is a placement/targeting rule.
  ///
  /// A placement can also be configured to resolve to *nothing*, and that
  /// case arrives here as `null` — indistinguishable from "placement not
  /// created yet". We deliberately fall back to the current offering instead
  /// of honouring it: every caller is a Pro gate, so showing no paywall
  /// would leave the feature locked with no way to buy it. Turning an upsell
  /// off is a job for the feature flags, not for a placement.
  ///
  /// Returns `null` when offerings can't be fetched at all (offline, SDK not
  /// configured); the SDK then falls back to the current offering itself.
  Future<Offering?> _offeringFor(String? placementId) async {
    try {
      if (placementId != null) {
        final targeted = await Purchases.getCurrentOfferingForPlacement(
          placementId,
        );
        if (targeted != null) return targeted;
      }
      return (await Purchases.getOfferings()).current;
    } catch (_) {
      return null;
    }
  }

  bool _hasProEntitlement(CustomerInfo info) =>
      info.entitlements.active.containsKey(
        AppConfigs.revenueCatProEntitlementId,
      );

  bool _isPurchaseSuccess(PaywallResult result) =>
      result == PaywallResult.purchased || result == PaywallResult.restored;
}

@Riverpod(keepAlive: true)
RevenueCatClient revenueCatClient(Ref ref) {
  return RevenueCatClientImpl();
}
