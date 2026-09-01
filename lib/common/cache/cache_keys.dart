import 'dart:convert';

import 'package:crypto/crypto.dart';

/// Costruttori di frammenti di chiave per la cache offline.
///
/// Una chiave deve essere **deterministica** per la stessa richiesta logica:
/// le coordinate GPS cambiano a ogni avvio e le liste di id arrivano in ordini
/// diversi, quindi vanno normalizzate prima di finire nella chiave.
abstract final class CacheKeys {
  /// Coordinata arrotondata a [decimals] cifre (1 ≈ 11 km, 2 ≈ 1,1 km,
  /// 3 ≈ 110 m, 4 ≈ 11 m).
  static String coord(double value, int decimals) =>
      value.toStringAsFixed(decimals);

  /// Impronta stabile di una lista di id, indipendente dall'ordine.
  static String idsHash(Iterable<String> ids) =>
      sha1.convert(utf8.encode(([...ids]..sort()).join(','))).toString();

  /// Modalità d'accesso normalizzate (`all` se nessun filtro).
  static String modes(List<String>? accessModes) =>
      accessModes == null || accessModes.isEmpty
          ? 'all'
          : ([...accessModes]..sort()).join(',');

  /// Aggancio verso il basso alla griglia di passo [step].
  static double snapDown(double value, double step) =>
      (value / step).floorToDouble() * step;

  /// Aggancio verso l'alto alla griglia di passo [step].
  static double snapUp(double value, double step) =>
      (value / step).ceilToDouble() * step;
}
