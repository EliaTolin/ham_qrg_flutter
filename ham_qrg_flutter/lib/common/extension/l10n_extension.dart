import 'package:flutter/material.dart';
import 'package:hamqrg/l10n/app_localizations.dart';

extension BuildContextEntension<T> on BuildContext {
  AppLocalizations get localization =>
      AppLocalizations.of(this)!; // ignore: use_build_context_synchronously

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return localization.january;
      case 2:
        return localization.february;
      case 3:
        return localization.march;
      case 4:
        return localization.april;
      case 5:
        return localization.may;
      case 6:
        return localization.june;
      case 7:
        return localization.july;
      case 8:
        return localization.august;
      case 9:
        return localization.september;
      case 10:
        return localization.october;
      case 11:
        return localization.november;
      case 12:
        return localization.december;
      default:
        return 'not_valid';
    }
  }
}
