import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';

class AppConfigs {
  static String getSite() {
    return 'https://hamqrg.com';
  }

  static String getSupabaseKey() {
    if (kDebugMode) {
      return 'sb_publishable_-cqwNT33Pqa9pFczqIITCA_HUscMay6';
    } else {
      return 'sb_publishable_-cqwNT33Pqa9pFczqIITCA_HUscMay6';
    }
  }

  static String getSupabaseUrl() {
    if (kDebugMode) {
      return 'https://dhmzkhipxvxtbbchvquc.supabase.co';
    } else {
      return 'https://dhmzkhipxvxtbbchvquc.supabase.co';
    }
  }

  static int defaultExpiresInSecondsImage() {
    const day = 15;
    return day * 24 * 60 * 60;
  }

  static String getTelegramLink() {
    return 'https://t.me/ham_ita';
  }

  static String getIz8wnhSite() {
    return 'https://www.iz8wnh.it';
  }

  /// Identificativo di **HamQRG** su App Store (`it.auroradigital.hamqrg`).
  ///
  /// Verificabile in ogni momento con
  /// `itunes.apple.com/lookup?bundleId=it.auroradigital.hamqrg`: da qui
  /// nascono i link allo store, e un id sbagliato manda l'utente sulla
  /// scheda di un'altra app invece che sull'aggiornamento.
  static String getAppStoreId() {
    return '6758155828';
  }

  static String getMapboxAccessToken() {
    return 'pk.eyJ1IjoiZWxpYXRvbGluIiwiYSI6ImNtOTh3aWRweTA3ZTMybHNic3NoeGI1dmcifQ.e4bCIdcgXs0iddLhEbhhiA';
  }

  /// Base URL of the RF coverage prediction service (ham_qrg_coverage).
  static String getCoverageServiceBaseUrl() {
    return 'https://t64usvmyfhe218lmqitrgchn.auroradigital.it';
  }

  /// API key sent as the `x-api-key` header to the coverage service.
  ///
  /// Note: embedding this in the client only raises the bar — it is not a
  /// true secret. It gates casual abuse, not a determined attacker. For
  /// stronger protection, proxy the service behind a Supabase edge function.
  static String getCoverageServiceApiKey() {
    return '8679783a324088f12f2120e2b1505c2f28378d4320117d84509f8ba715557801';
  }

  /// Whether the coverage map is gated behind HamQRG Pro.
  /// Pro-only for release: the promo card is shown to everyone (teaser), but
  /// opening the map requires Pro (presents the paywall resolved for the
  /// `coveragePromo` placement).
  static bool get coverageRequiresPro => true;

  /// Whether "what can I reach from here" (reachability) is a Pro feature.
  /// Pro-only by design: non-Pro users see a blurred teaser, never the data.
  static bool get reachabilityRequiresPro => true;

  static String getOneSignalAppId() {
    return 'b25acb1c-1194-4f0d-8d7a-346e6deb747b';
  }

  /// RevenueCat public SDK API key.
  ///
  /// These are the *public* SDK keys from the RevenueCat dashboard
  /// (Project → API Keys), safe to ship in the client.
  ///
  /// In debug builds we always use the shared TEST key; release builds use the
  /// platform-specific PRODUCTION keys: `appl_…` (iOS), `goog_…` (Android).
  static String getRevenueCatApiKey() {
    if (kDebugMode) {
      return 'test_hUOcyfFjPhkgBamQlEYAyIflXpb';
    }

    const iosKey = 'appl_NknezsTohLBhtcBYuPNGUlVOOfq';
    const androidKey = 'goog_EoiJjcfLUFuxAnFLQYlwbfLrGfd';

    if (Platform.isIOS || Platform.isMacOS) {
      return iosKey;
    }
    if (Platform.isAndroid) {
      return androidKey;
    }
    return '';
  }

  /// Identifier of the RevenueCat entitlement that unlocks HamQRG Pro.
  /// Must match the entitlement identifier configured in the dashboard
  /// (verified at runtime: the active entitlement is "HamQRG Pro").
  static String get revenueCatProEntitlementId => 'HamQRG Pro';

  /// Distance in kilometers beyond which a confirmation dialog is shown.
  static double get feedbackDistanceWarningKm => 100;

  /// Maximum distance in kilometers from repeater to submit feedback.
  static double get maxFeedbackDistanceKm => 400;
}
