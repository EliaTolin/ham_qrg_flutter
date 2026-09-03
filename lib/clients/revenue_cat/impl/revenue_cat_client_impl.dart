import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hamqrg/clients/revenue_cat/model/pro_price_hint.dart';
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

  /// Il pulsante di chiusura della paywall **si chiede sempre**.
  ///
  /// Su Android la paywall è un'activity a schermo intero: con il default del
  /// package (`displayCloseButton: false`) l'unica uscita è il back di
  /// sistema, e una paywall senza via d'uscita visibile è una violazione
  /// delle norme Play sugli abbonamenti — ci è già costata un rifiuto in
  /// revisione. Su iOS il modal si chiude anche con lo swipe, ma la X esplicita
  /// non fa danno.
  ///
  /// Attenzione: il flag vale per i template originali ed è **ignorato dalle
  /// paywall V2**. Su una paywall costruita col nuovo editor il pulsante di
  /// chiusura va abilitato come componente in dashboard: questa riga da sola
  /// non basta a garantirlo.
  static const bool _displayCloseButton = true;

  @override
  Future<bool> presentPaywall({String? placementId}) async {
    final result = await RevenueCatUI.presentPaywall(
      offering: await _offeringFor(placementId),
      displayCloseButton: _displayCloseButton,
    );
    return _isPurchaseSuccess(result);
  }

  @override
  Future<bool> presentPaywallIfNeeded({String? placementId}) async {
    final result = await RevenueCatUI.presentPaywallIfNeeded(
      AppConfigs.revenueCatProEntitlementId,
      offering: await _offeringFor(placementId),
      displayCloseButton: _displayCloseButton,
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

  @override
  Future<ProPriceHint?> priceHint({String? placementId}) async {
    if (AppConfigs.getRevenueCatApiKey().isEmpty) return null;
    try {
      final offering = await _offeringFor(placementId) ??
          (await Purchases.getOfferings()).current;
      final packages = offering?.availablePackages ?? const <Package>[];
      if (packages.isEmpty) return null;

      // Fra i piani si sceglie il **mensile equivalente più basso**, non il
      // prezzo assoluto più basso: è l'unico numero che l'utente può
      // confrontare fra un piano annuale e uno mensile, ed è quello che
      // rende vera la parola "da". `pricePerMonthString` lo dà già
      // calcolato e formattato dallo store, valuta inclusa.
      Package? cheapest;
      for (final package in packages) {
        final perMonth = package.storeProduct.pricePerMonth;
        if (perMonth == null ||
            package.storeProduct.pricePerMonthString == null) {
          continue;
        }
        final best = cheapest?.storeProduct.pricePerMonth;
        if (best == null || perMonth < best) cheapest = package;
      }

      if (cheapest != null) {
        final product = cheapest.storeProduct;
        // Una prova gratuita è l'informazione che converte di più fra tutte
        // quelle disponibili qui: se c'è, viene prima del prezzo.
        final hasFreeTrial = product.introductoryPrice?.price == 0;
        // Su tutto ciò che non è mensile, il mensile equivalente da solo
        // direbbe una cifra che l'utente non vedrà mai sull'estratto conto:
        // si porta dietro anche quella vera.
        final isBilledMonthly = cheapest.packageType == PackageType.monthly;
        return ProPriceHint(
          kind: hasFreeTrial
              ? ProPriceKind.trialThenPerMonth
              : ProPriceKind.perMonth,
          price: product.pricePerMonthString!,
          billedTotal: isBilledMonthly ? null : product.priceString,
        );
      }

      // Nessun abbonamento nell'offering: resta l'acquisto una tantum, per il
      // quale un "al mese" non esiste e non va inventato.
      final lifetime = packages.reduce(
        (a, b) => a.storeProduct.price <= b.storeProduct.price ? a : b,
      );
      return ProPriceHint(
        kind: ProPriceKind.lifetime,
        price: lifetime.storeProduct.priceString,
      );
    } catch (error, stackTrace) {
      // Il prezzo è un ornamento della CTA, non la CTA: se non arriva, la
      // superficie deve restare comprabile lo stesso.
      await Sentry.captureException(error, stackTrace: stackTrace);
      return null;
    }
  }

  @override
  Future<void> presentCustomerCenter() async {
    if (AppConfigs.getRevenueCatApiKey().isEmpty) return;
    await RevenueCatUI.presentCustomerCenter();
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
