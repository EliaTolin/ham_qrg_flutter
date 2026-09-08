# Contratto — `UnitFormat`

**Feature**: 006-imperial-units | **Data**: 2026-09-08

Questo file è il contratto verificabile richiesto da **SC-006**. La tabella qui sotto è la specifica del test `test/unit_format_test.dart`: ogni riga è un caso, e il test fallisce se l'uscita differisce di un carattere.

## Superficie pubblica

```dart
enum UnitSystem { auto, metric, imperial }
enum MeasuredQuantity { distance, elevation }

abstract final class UnitFormat {
  /// Distanza a partire dai metri canonici.
  static String distance(double meters, UnitSystem system, Locale locale);

  /// Quota a partire dai metri canonici.
  static String elevation(double meters, UnitSystem system, Locale locale);

  /// Soglia da citare in un testo: arrotondata per DIFETTO (FR-016).
  static String threshold(double meters, UnitSystem system, Locale locale,
      {MeasuredQuantity quantity = MeasuredQuantity.distance});

  /// Raggio di un preset: arrotondato al più VICINO, senza decimali (FR-009).
  static String presetRadius(double kilometres, UnitSystem system, Locale locale);
}
```

`system` non accetta mai `auto`: la risoluzione avviene una volta sola, nello scope. Passare `auto` è un errore di programmazione e deve fallire in modo rumoroso (`assert`), non ricadere silenziosamente sul metrico.

## Regola di soglia fra unità corta e lunga

Il confronto si fa sul valore **già arrotondato**, non su quello grezzo:

```
metrico:   round(metri) < 1000  → metri ;  altrimenti → km con 1 decimale
imperiale: round(piedi) < 5280  → piedi ;  altrimenti → miglia con 1 decimale
```

Senza questa precisazione comparirebbero `1.000 m` (che è un chilometro) e `5,280 ft` (che è esattamente un miglio) — due modi di scrivere il valore che la riga successiva scrive nell'unità lunga.

## Tabella dei casi — distanze

Uscita mostrata con convenzione numerica **inglese**; in italiano `.` e `,` si scambiano (FR-015).

| Metri in ingresso | Metrico | Imperiale | Perché è nella tabella |
|---|---|---|---|
| `0` | `0 m` | `0 ft` | Zero non è un caso speciale |
| `1` | `1 m` | `3 ft` | Valori minimi |
| `300` | `300 m` | `984 ft` | Distanza breve tipica |
| `999` | `999 m` | `3,278 ft` | Ultimo valore sotto l'unità lunga metrica |
| `999.6` | `1.0 km` | `3,280 ft` | L'arrotondamento fa scattare l'unità lunga |
| `1000` | `1.0 km` | `3,281 ft` | Confine metrico |
| `1609` | `1.6 km` | `5,279 ft` | Ultimo valore ancora scritto in piedi |
| `1609.3` | `1.6 km` | `1.0 mi` | Il guard in azione: senza il confronto sul valore arrotondato qui uscirebbe `5,280 ft` |
| `1609.344` | `1.6 km` | `1.0 mi` | Un miglio esatto |
| `12400` | `12.4 km` | `7.7 mi` | Distanza tipica da un ripetitore |
| `112000` | `112.0 km` | `69.6 mi` | Distanza lunga, decimale mantenuto |
| `400000` | `400.0 km` | `248.5 mi` | Raggio massimo, come distanza (non come soglia) |

## Tabella dei casi — quote

| Metri in ingresso | Metrico | Imperiale | Perché è nella tabella |
|---|---|---|---|
| `0` | `0 m` | `0 ft` | Livello del mare |
| `-5` | `-5 m` | `-16 ft` | Sotto il livello del mare: il segno sopravvive |
| `350` | `350 m` | `1,148 ft` | Collina |
| `1240` | `1,240 m` | `4,068 ft` | Cima SOTA tipica; verifica il raggruppamento migliaia |

## Tabella dei casi — soglie (arrotondamento per difetto)

| Soglia reale | Metrico | Imperiale |
|---|---|---|
| `400000 m` (raggio feedback) | `400 km` | `248 mi` |
| `200 m` (duplicato postazione) | `200 m` | `650 ft` |

Confronto con la riga `400000` della tabella distanze: `248.5 mi` come distanza, `248 mi` come soglia. La differenza è voluta ed è il punto di FR-016.

## Tabella dei casi — preset (arrotondamento al più vicino)

| Preset | Metrico | Imperiale |
|---|---|---|
| `80 km` | `80 km` | `50 mi` |
| `100 km` | `100 km` | `62 mi` |
| `150 km` | `150 km` | `93 mi` |
| `10 km` | `10 km` | `6 mi` |
| `25 km` | `25 km` | `16 mi` |
| `50 km` | `50 km` | `31 mi` |

## Contratto di localizzazione

Il test verifica anche che, a parità di valore e sistema, cambiando `Locale`:

| Valore | `en` | `it` |
|---|---|---|
| `12400 m`, metrico | `12.4 km` | `12,4 km` |
| `1240 m`, quota metrica | `1,240 m` | `1.240 m` |

## Due conseguenze note, accettate

1. **Sotto il miglio si leggono numeri a quattro cifre.** `999 m` diventa `3,278 ft`. È il prezzo diretto della simmetria scelta (chiarimento 1): la stessa cosa succede già oggi in metrico, dove sotto il chilometro si leggono `999 m`. L'alternativa era una soglia più bassa in imperiale, che avrebbe reso i due sistemi non più confrontabili con lo stesso test.

2. **Alcune uscite metriche cambiano rispetto a oggi.** Non esiste una sola "regola metrica attuale": ce ne sono tre in giro per il codice — `repeater_card` mantiene sempre il decimale, `pota_spot_list_item` lo perde sopra i 100 km, `pota_spot_detail_page` sopra i 10 km. Convergere su una regola sola implica che **qualcuna** di quelle tre cambi. Con la regola scelta, un parco POTA a 112 km passa da `112 km` a `112.0 km`. È l'unica differenza visibile lato metrico, è uniforme e va comunicata invece che scoperta.
