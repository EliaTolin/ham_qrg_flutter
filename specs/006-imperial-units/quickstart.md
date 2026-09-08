# Quickstart — mostrare una distanza o una quota

**Feature**: 006-imperial-units | **Data**: 2026-09-08

Dopo questa feature, **nessun file fuori da `unit_format_helper.dart` scrive `km`, `m`, `mi` o `ft` in una stringa.** Questa pagina dice cosa fare al posto.

## Il caso normale

```dart
// PRIMA
Text('${(distanceMeters / 1000).toStringAsFixed(1)} km')

// DOPO
Text(context.units.distance(distanceMeters))
```

`context.units` è l'estensione su `BuildContext` (`lib/common/extension/unit_system_extension.dart`), speculare a `context.localization`. Risolve lo scope, ha già dentro sia il sistema di misura sia la lingua, e crea la dipendenza che fa ricostruire il widget quando la preferenza cambia.

Per le quote:

```dart
Text(context.units.elevation(summit.altitudeM))
```

## Se il valore è in chilometri e non in metri

Il canonico è il **metro**. Chi ha in mano dei chilometri converte al bordo, non dentro:

```dart
Text(context.units.distance(distanceKm * 1000))
```

## Se il testo viene da una chiave ARB

Il placeholder riceve la **stringa già formattata**, unità compresa. La chiave non contiene mai l'unità:

```json
"reachDistanceFromHere": "{distance} da qui"
```

```dart
Text(l10n.reachDistanceFromHere(context.units.distance(meters)))
```

Se ti accorgi di stare scrivendo `"{distance} km"` in un file ARB, ti stai allontanando da SC-002: quella chiave diventerà una superficie che nessuna preferenza può raggiungere.

## Se stai citando una soglia

Le soglie si arrotondano per difetto, con una funzione diversa (FR-016):

```dart
l10n.repeaterDetailDistanceWarning(
  context.units.threshold(AppConfigs.maxFeedbackDistanceKm * 1000),
)
```

Non scrivere mai il numero della soglia a mano nel file ARB, in nessuna lingua.

## Se stai etichettando un preset

```dart
Text(context.units.presetRadius(breadth.radiusKm))
```

L'identità del preset resta metrica: `SearchBreadth.quick` è e rimane 80 km anche quando a schermo si legge `50 mi`. Non introdurre preset imperiali paralleli — renderebbe incomparabili le postazioni salvate.

## Fuori da un `BuildContext`

Nei test, o in codice che non ha un contesto, si usa direttamente l'helper puro:

```dart
UnitFormat.distance(12400, UnitSystem.imperial, const Locale('en'));  // '7.7 mi'
```

## Che cosa NON si converte

Frequenze, shift, toni CTCSS, dBm, byte, coordinate, locator, azimut, tempi. Continuano a passare da `RepeaterFormatHelper` e `BytesFormatHelper`, che non conoscono `UnitSystem` — ed è di proposito.

## Prima di chiudere una modifica

1. `dart run build_runner build --delete-conflicting-outputs` se hai toccato `@riverpod` o `@freezed`.
2. `flutter gen-l10n` — deve chiudere con **zero** `untranslated message(s)`.
3. Controllo meccanico di copertura, deve restituire zero righe fuori dall'helper:
   ```bash
   grep -rnE "\} ?(km|m|ft|mi)'| (km|m|ft|mi)'" lib --include="*.dart" \
     | grep -vE "\.g\.dart|\.freezed\.dart|unit_format_helper\.dart"
   ```
4. `flutter analyze` a zero warning e `dart format lib test` senza modifiche.
5. Apri la schermata toccata **su mobile e su tablet** (Costituzione V): metà dei siti di formattazione vive nei `*_tablet.dart`.
