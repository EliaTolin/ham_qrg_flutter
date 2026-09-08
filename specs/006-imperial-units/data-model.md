# Fase 1 — Modello dei dati

**Feature**: 006-imperial-units | **Data**: 2026-09-08

La feature non introduce entità di dominio né dati remoti. Il "modello" è composto da un enum di preferenza, un enum di grandezza e le regole che li legano.

---

## `UnitSystem` — la preferenza dell'utente

Enum a tre valori, persistito come stringa.

| Valore | Stringa persistita | Significato |
|---|---|---|
| `auto` | *(chiave assente)* | Deriva dalla regione del dispositivo. Stato iniziale. |
| `metric` | `metric` | Chilometri e metri, sempre. |
| `imperial` | `imperial` | Miglia e piedi, sempre. |

- **Archivio**: `SharedPreferences` via `SharedPrefStorageClient`, chiave `unit_system`.
- **Assenza della chiave = `auto`**, esattamente come `ThemeModeNotifier` tratta l'assenza come `system`. Nessun valore di default da scrivere all'installazione, nessuna migrazione.
- **Valore sconosciuto** (downgrade dell'app, dato corrotto): si ricade su `auto` senza errore.
- Non ha rappresentazione lato server e non compare in alcuna tabella Supabase (FR-003).

### Risoluzione di `auto`

```
regione dispositivo ∈ { US, LR, MM }  →  imperial
altrimenti (inclusa regione assente)  →  metric
```

La regione si legge da `platformDispatcher.locale.countryCode`, **non** dalla lingua dell'app. Il valore risolto non viene mai persistito: resta `auto` in memoria, così un cambio di regione continua a essere seguito.

---

## `MeasuredQuantity` — che cosa si sta scrivendo

Due sole nature, perché determinano regole diverse.

| Valore | Unità canonica | Metrico | Imperiale |
|---|---|---|---|
| `distance` | metri | m sotto 1 km, km sopra | ft sotto 1 mi, mi sopra |
| `elevation` | metri | sempre m | sempre ft |

La quota non ha unità lunga: nessuno scrive l'altitudine di una cima in chilometri, e nemmeno in miglia.

---

## Regole di conversione

Fattori esatti, non approssimati:

- `1 mi = 1609.344 m`
- `1 ft = 0.3048 m`

### Formattazione (FR-007)

| Grandezza | Sistema | Condizione | Uscita |
|---|---|---|---|
| distanza | metrico | `< 1000 m` | metri interi — `850 m` |
| distanza | metrico | `≥ 1000 m` | km con **una** cifra decimale — `12,4 km` |
| distanza | imperiale | `< 1 mi` | piedi interi — `984 ft` |
| distanza | imperiale | `≥ 1 mi` | miglia con **una** cifra decimale — `7.7 mi` |
| quota | metrico | sempre | metri interi — `1.240 m` |
| quota | imperiale | sempre | piedi interi — `4,068 ft` |

Separatore decimale e raggruppamento delle migliaia seguono la **lingua attiva** (FR-015), non il sistema di misura: `12,4 km` in italiano, `12.4 km` in inglese.

### Soglie dichiarate all'utente (FR-016)

Le soglie citate nei testi si arrotondano **per difetto**, mai per eccesso:

| Soglia reale | Metrico | Imperiale |
|---|---|---|
| 400 km (raggio massimo feedback, `AppConfigs.maxFeedbackDistanceKm`) | `400 km` | `248 mi` |
| 200 m (distanza di duplicazione postazione) | `200 m` | `650 ft` |

Regola: miglia troncate all'intero, piedi troncati alla decina inferiore. Il valore verificato resta quello metrico (FR-008): l'arrotondamento vive solo nella frase.

### Preset di raggio (FR-009)

Non sono soglie promesse all'utente ma descrizioni di un'opzione, quindi si arrotondano **al più vicino** e l'identità metrica del preset non cambia mai.

| Preset | Identità (invariata) | Metrico | Imperiale |
|---|---|---|---|
| `SearchBreadth.quick` | 80 km | `80 km` | `50 mi` |
| `SearchBreadth.medium` | 100 km | `100 km` | `62 mi` |
| `SearchBreadth.extended` | 150 km | `150 km` | `93 mi` |
| Regione offline | 10 km | `10 km` | `6 mi` |
| Regione offline | 25 km | `25 km` | `16 mi` |
| Regione offline | 50 km | `50 km` | `31 mi` |

---

## Che cosa **non** entra in questo modello

Per FR-006, e per evitare che un giorno qualcuno "converta" anche queste: frequenze (Hz/kHz/MHz), toni CTCSS, potenza di segnale (dBm), dimensioni dei file e delle regioni offline (byte/MB, formattate da `BytesFormatHelper`), coordinate geografiche, locatori Maidenhead, azimut in gradi, tempi.

**Caso limite da non sbagliare**: `frequency_fun_facts_section.dart:198` formatta una **lunghezza d'onda** in metri (`'${meters.toStringAsFixed(2)} m'`). È una lunghezza, è in metri, e assomiglia in tutto a un sito da convertire — ma è il nome della banda, che in inglese si dice "two meters" esattamente come in italiano. Va lasciata stare.

Restano di competenza di `RepeaterFormatHelper` e `BytesFormatHelper`, che questa feature **non tocca** — salvo rimuovere da `RepeaterFormatHelper` il suo `formatDistance`, che è una distanza e appartiene al nuovo helper.

---

## Dati già memorizzati

Nessuna migrazione. Tutto ciò che l'app salva è già in unità canoniche metriche e resta tale (FR-010):

- postazioni salvate — `saved_station_model` serializza `'km': distanceKm`;
- cache ripetitori `repeater:v1:<id>` — distanze in metri come arrivano dal backend;
- metadati regioni offline — `'radius_km'`.

Cambiare sistema di misura non invalida, non rigenera e non fa riscaricare nulla: la conversione avviene alla lettura.
