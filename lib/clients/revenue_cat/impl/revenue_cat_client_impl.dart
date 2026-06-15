import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hamqrg/clients/revenue_cat/revenue_cat_client.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
  Future<bool> isPro() async {
    if (AppConfigs.getRevenueCatApiKey().isEmpty) return false;
    final info = await Purchases.getCustomerInfo();
    return _hasProEntitlement(info);
  }

  @override
  Stream<bool> proStatusChanges() {
    final controller = StreamController<bool>();
    void listener(CustomerInfo info) => controller.add(_hasProEntitlement(info));

    Purchases.addCustomerInfoUpdateListener(listener);
    controller.onCancel =
        () => Purchases.removeCustomerInfoUpdateListener(listener);
    return controller.stream;
  }

  @override
  Future<bool> presentPaywall() async {
    final result = await RevenueCatUI.presentPaywall(
      offering: await _defaultOffering(),
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

  /// Resolves the "default" offering to display in the paywall, falling back
  /// to the current offering. Returns `null` if offerings can't be fetched,
  /// in which case the SDK shows the current offering's paywall.
  Future<Offering?> _defaultOffering() async {
    try {
      final offerings = await Purchases.getOfferings();
      return offerings.all[AppConfigs.revenueCatDefaultOfferingId] ??
          offerings.current;
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
