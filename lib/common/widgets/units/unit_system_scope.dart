import 'package:flutter/widgets.dart';
import 'package:hamqrg/common/utils/unit_system.dart';

/// Distribuisce il sistema di misura **già risolto** a tutto l'albero.
///
/// È un `InheritedWidget` e non un provider letto sito per sito perché i
/// punti che formattano sono widget presentazionali e metodi helper privati,
/// senza `ref`: farci arrivare la preferenza come parametro vorrebbe dire
/// toccare la firma di ogni widget intermedio. In più la dipendenza
/// dall'`InheritedWidget` fa ricostruire da sola ogni schermata già montata
/// quando la preferenza cambia — che è ciò che rende FR-004 verificabile
/// invece che sperato.
class UnitSystemScope extends InheritedWidget {
  const UnitSystemScope({
    required this.system,
    required this.locale,
    required super.child,
    super.key,
  }) : assert(
          system != UnitSystem.auto,
          'UnitSystemScope riceve un sistema già risolto: auto va risolto '
          'prima di installare lo scope.',
        );

  /// Sistema risolto: mai [UnitSystem.auto].
  final UnitSystem system;

  /// Lingua attiva, da cui dipendono separatore decimale e raggruppamento
  /// delle migliaia (FR-015). È un asse distinto dal sistema di misura.
  final Locale locale;

  static UnitSystemScope of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<UnitSystemScope>();
    assert(scope != null, 'Nessun UnitSystemScope sopra questo contesto.');
    return scope!;
  }

  @override
  bool updateShouldNotify(UnitSystemScope oldWidget) =>
      system != oldWidget.system || locale != oldWidget.locale;
}
