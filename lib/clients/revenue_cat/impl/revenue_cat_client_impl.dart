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
  Future<bool> presentPaywall({String? offeringId}) async {
    final result = await RevenueCatUI.presentPaywall(
      offering: await _defaultOffering(offeringId),
    );
    return _isPurchaseSuccess(result);
  }

  @override
  Future<bool> presentPaywallIfNeeded() async {
    final result = await RevenueCatUI.presentPaywallIfNeeded(
      AppConfigs.revenueCatProEntitlementId,
      offering: await _defaultOffering(),
    );
    return _isPurchaseSuccess(result);
  }

  /// Resolves the offering to display: the explicit [offeringId] when given,
  /// otherwise the configured default, falling back to the current offering.
  /// Returns `null` if offerings can't be fetched, in which case the SDK shows
  /// the current offering's paywall.
  Future<Offering?> _defaultOffering([String? offeringId]) async {
    try {
      final offerings = await Purchases.getOfferings();
      final preferred = offeringId ?? AppConfigs.revenueCatDefaultOfferingId;
      return offerings.all[preferred] ?? offerings.current;
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
