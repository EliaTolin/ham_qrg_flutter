import 'package:flutter/widgets.dart';
import 'package:hamqrg/common/utils/unit_format_helper.dart';
import 'package:hamqrg/common/utils/unit_system.dart';
import 'package:hamqrg/common/widgets/units/unit_system_scope.dart';

/// Accesso al sistema di misura dal contesto, speculare a
/// `context.localization`.
///
/// Ogni distanza e ogni quota mostrate dall'app passano da qui: nessun file
/// fuori da `unit_format_helper.dart` scrive un simbolo di unità di lunghezza
/// in una stringa.
extension UnitSystemExtension on BuildContext {
  UnitsFormatter get units => UnitsFormatter._(UnitSystemScope.of(this));
}

/// Facciata che completa le chiamate a [UnitFormat] con il sistema risolto e
/// la lingua attiva presi dallo scope.
class UnitsFormatter {
  const UnitsFormatter._(this._scope);

  final UnitSystemScope _scope;

  /// Sistema risolto, per le rare superfici che devono ramificare invece che
  /// formattare (il valore nativo in piedi delle cime SOTA, FR-011).
  UnitSystem get system => _scope.system;

  bool get isImperial => _scope.system == UnitSystem.imperial;

  /// Distanza a partire dai **metri** canonici.
  String distance(double meters) =>
      UnitFormat.distance(meters, _scope.system, _scope.locale);

  /// Distanza a partire dai chilometri, per i chiamanti che li hanno già.
  String distanceFromKm(double kilometres) => distance(kilometres * 1000);

  /// Quota a partire dai metri canonici.
  String elevation(double meters) =>
      UnitFormat.elevation(meters, _scope.system, _scope.locale);

  /// Soglia citata in un testo: arrotondata per difetto (FR-016).
  String threshold(
    double meters, {
    MeasuredQuantity quantity = MeasuredQuantity.distance,
  }) =>
      UnitFormat.threshold(
        meters,
        _scope.system,
        _scope.locale,
        quantity: quantity,
      );

  /// Raggio di un preset: arrotondato al più vicino (FR-009).
  String presetRadius(double kilometres) =>
      UnitFormat.presetRadius(kilometres, _scope.system, _scope.locale);

  /// Quota della cima nell'unità preferita, usando il valore **nativo**
  /// della sorgente invece di riconvertire (FR-011).
  String summitAltitude({required int metres, required int feet}) => isImperial
      ? UnitFormat.nativeFeet(feet, _scope.locale)
      : UnitFormat.nativeMetres(metres, _scope.locale);

  /// La stessa quota nell'altra unità, per le superfici SOTA che le mostrano
  /// entrambe: la cima ha due numeri ufficiali e vale la pena tenerli tutti e
  /// due, cambiando quale dei due è in evidenza.
  String summitAltitudeSecondary({required int metres, required int feet}) =>
      isImperial
          ? UnitFormat.nativeMetres(metres, _scope.locale)
          : UnitFormat.nativeFeet(feet, _scope.locale);

  /// Quota della cima separata in numero e simbolo, per le superfici che
  /// danno ai due pesi tipografici diversi.
  ({String value, String symbol}) summitAltitudeParts({
    required int metres,
    required int feet,
  }) =>
      UnitFormat.summitAltitudeParts(
        metres: metres,
        feet: feet,
        system: _scope.system,
        locale: _scope.locale,
      );

  /// Simbolo dell'unità lunga, per i segnaposto che non mostrano un valore.
  String get longSymbol => UnitFormat.longSymbol(_scope.system);
}
