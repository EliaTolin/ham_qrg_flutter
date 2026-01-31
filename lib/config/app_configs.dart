import 'dart:io';

import 'package:flutter/foundation.dart';

class AppConfigs {
  static String getSite() {
    return 'https://quizradiomatori.it/';
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

  static String bannerAdUnitId() {
    if (kDebugMode) {
      return Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716';
    }
    return Platform.isAndroid ? 'banner_ad_unit_id_android' : 'banner_ad_unit_id_ios';
  }

  static String interstitialAdUnitId() {
    if (kDebugMode) {
      return Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/1033173712'
          : 'ca-app-pub-3940256099942544/4411468910';
    }
    return Platform.isAndroid
        ? 'ca-app-pub-7500053685536877/3774719396'
        : 'ca-app-pub-7500053685536877/6707068711';
  }

  static int defaultExpiresInSecondsImage() {
    const day = 15;
    return day * 24 * 60 * 60;
  }

  static String getTelegramLink() {
    return 'https://t.me/hamqrg';
  }

  static String getAppStoreId() {
    return '6754508610';
  }

  static String getMapboxAccessToken() {
    return 'pk.eyJ1IjoiZWxpYXRvbGluIiwiYSI6ImNtOTh3aWRweTA3ZTMybHNic3NoeGI1dmcifQ.e4bCIdcgXs0iddLhEbhhiA';
  }

  /// Distance in kilometers beyond which a confirmation dialog is shown.
  static double get feedbackDistanceWarningKm => 100;

  /// Maximum distance in kilometers from repeater to submit feedback.
  static double get maxFeedbackDistanceKm => 400;
}
