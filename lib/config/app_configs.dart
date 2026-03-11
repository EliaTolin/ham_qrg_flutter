import 'package:flutter/foundation.dart';

class AppConfigs {
  static String getSite() {
    return 'https://hamqrg.com/';
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

  static String getAppStoreId() {
    return '6754508610';
  }

  static String getMapboxAccessToken() {
    return 'pk.eyJ1IjoiZWxpYXRvbGluIiwiYSI6ImNtOTh3aWRweTA3ZTMybHNic3NoeGI1dmcifQ.e4bCIdcgXs0iddLhEbhhiA';
  }

  static String getOneSignalAppId() {
    return 'b25acb1c-1194-4f0d-8d7a-346e6deb747b';
  }

  /// Distance in kilometers beyond which a confirmation dialog is shown.
  static double get feedbackDistanceWarningKm => 100;

  /// Maximum distance in kilometers from repeater to submit feedback.
  static double get maxFeedbackDistanceKm => 400;
}
