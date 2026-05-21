# Research — SOTA Integration

**Feature**: 004-sota-integration
**Date**: 2026-05-19
**Status**: All NEEDS CLARIFICATION resolved

Le 5 domande della sessione `/speckit.clarify` sono state risposte e integrate nello spec (sezione Clarifications). Questo documento consolida le decisioni tecniche aggiuntive emerse durante il design del piano.

## R1. HTTP client e base URL

**Decision**: `Dio` istanziato fresh nel datasource SOTA (parità POTA), base URL `https://api-db2.sota.org.uk`. Timeout connessione/risposta 10 s ciascuno. Header `Accept: application/json`.

**Rationale**: POTA usa già lo stesso pattern (`PotaApiDatasource(Dio())` in [pota_api_datasource.dart:40](../../lib/src/features/pota/data/datasource/pota_api_datasource.dart#L40)). L'API SOTA è pubblica e anonima, niente interceptor di auth richiesto. Una nuova istanza Dio per datasource evita coupling cross-feature.

**Alternatives**:
- Shared `Dio` singleton in `lib/clients/api/`: rigettato perché non c'è bisogno di interceptor condivisi e introduce coupling.
- `http` package: rigettato per coerenza POTA (Dio è già la dipendenza standard del progetto).

**Nota URL**: l'utente ha fornito `https://api-db2.sota.org.uk//api/...` (doppio slash). È un refuso: l'API funziona con singolo slash. Lo confermiamo nei contracts.

## R2. JSON casing mix (camelCase + PascalCase)

**Decision**: usare `@JsonKey(name: 'AltM')` e `@JsonKey(name: 'AltFt')` per i due campi PascalCase nella response spots. Tutti gli altri campi seguono camelCase standard e non richiedono override.

**Rationale**: SOTA spots response è genuinamente eterogenea (`activatorCallsign` vs `AltM`). `json_serializable` di default usa il nome esatto del field Dart (in camelCase), quindi serve override esplicito SOLO per i due campi PascalCase.

**Alternatives**:
- Configurazione globale `@JsonSerializable(fieldRename: FieldRename.snake)`: rigettato perché i campi NON sono snake_case.
- Manual parsing: rigettato per coerenza con il pattern freezed + `fromJson` del progetto.

## R3. Frequency unit divergenza POTA vs SOTA

**Decision**: SOTA mantiene `frequency` in MHz come `double` nel modello e nell'entità (corrispondenza 1:1 con il dato API). UI mostra in MHz. La utility `bandFromFrequencyMhz(double mhz)` è nuova in `sota_mappers.dart`, distinta dall'esistente `bandFromFrequencyKhz(String khz)` di POTA.

**Rationale**: lo standard SOTA è MHz (decisione registrata in spec Clarifications). Convertire SOTA in kHz internamente per "unificare" sarebbe artificiale e contro-intuitivo per la community SOTA. Le due utility hanno logica identica per le soglie di banda — la differenza è solo la conversione di unità all'ingresso.

**Alternatives**:
- Convertire tutto in Hz come Repeater fa (`frequencyHz: int`): rigettato perché la lettura/scrittura della UI sarebbe innaturale e perderebbe la precisione decimale.
- Estendere `bandFromFrequencyKhz` perché accetti MHz: rigettato per chiarezza e testabilità separata.

## R4. Punti SOTA e palette colore

**Decision**: scala SOTA standard {1, 2, 4, 6, 8, 10}. Colori palette in `lib/themes/app_colors.dart` nuova classe `SotaPointsColors`:

| Points | Color name | Hex (light) |
|--------|-----------|-------------|
| 1 | neutralLow | `#94A3B8` (slate-400) |
| 2 | neutral | `#64748B` (slate-500) |
| 4 | green | `#16A34A` (green-600) |
| 6 | amber | `#D97706` (amber-600) |
| 8 | orange | `#EA580C` (orange-600) |
| 10 | gold | `#CA8A04` (yellow-600 dark) |

**Rationale**: scala calda crescente comunica visivamente "valore crescente". Eccezione costituzionale documentata (analoga a `AccessModeHelper` per access modes): brand-specific, non rappresentabile via `theme.colorScheme.*`. Costanti separate per light/dark se serve, ma la palette base è leggibile su entrambi i temi.

**Alternatives**:
- Usare solo `theme.colorScheme.tertiary` con varianti alpha: rigettato perché perde la differenziazione tra fasce.
- 5 fasce invece di 6: rigettato perché SOTA ha 6 valori standard, mappiamo 1:1.

## R5. Altitude band per marker mappa

**Decision**: tre fasce.

| Range altitudine | Color | Marker icon |
|-----------------|-------|-------------|
| <1000 m | green-600 | triangle |
| 1000–2000 m | amber-600 | triangle |
| >2000 m | blue/white (`#3B82F6`) | triangle with snowcap accent |

Utility: `altitudeBand(int meters) → AltitudeBand` enum + `colorForBand(band)`.

**Rationale**: scala visiva intuitiva (verde = collina, ambra = montagna media, blu/bianco = alta quota con neve). Discrete tre fasce sono sufficienti per il glance ravvicinato sulla mappa; più fasce introducono rumore visivo.

**Alternatives**:
- Gradient continuo basato su altezza assoluta: rigettato per leggibilità mappa quando i marker si sovrappongono.
- Fascia "estrema" >3000 m con icona dedicata: rinviato — può essere aggiunto in V2 senza modifiche al data model.

## R6. Line-of-sight classifier

**Decision**: algoritmo geometrico semplice client-side, eseguito dopo ricezione del profilo dalla edge function.

Input: lista di `AltimetricProfilePoint(lat, lon, elevationM, distanceKm)` con index 0 = osservatore, index n-1 = cima.

```
let h0 = points[0].elevationM      // osservatore (eleva = terreno; antenna assumed 1.5m, opzionale)
let h1 = points[n-1].elevationM    // cima
let maxObstruction = 0
let obstructionIdx = -1
for i in 1..n-2:
  let t = i / (n-1)
  let losLine = h0 + t * (h1 - h0)            // linea retta osservatore→cima
  let margin = points[i].elevationM - losLine
  if margin > 10:                              // soglia 10 m per rumore DEM
    if margin > maxObstruction:
      maxObstruction = margin
      obstructionIdx = i
return (clear: obstructionIdx == -1, obstruction: ...)
```

**Rationale**: il classifier opera sulla linea retta tra le due quote (ignora rifrazione atmosferica e curvatura terrestre — irrilevanti per distanze <100 km tipiche SOTA). La soglia 10 m elimina il rumore DEM senza nascondere ostacoli reali. La complessità è O(n) con n≤200, eseguibile in millisecondi sul main thread senza isolate.

**Alternatives**:
- Includere curvatura terrestre con formula `bulge = d²/(2R) ≈ 0.078 m × d_km²`: utile sopra 50 km, ma il backend Open-Meteo non garantisce precisione DEM tale; aggiunge complessità senza valore pratico per SOTA tipica (<30 km link).
- Considerare antenna height: l'utente non la fornisce, default 0 è onesto; eventuali integrazioni future possono aggiungere parametro.
- Eseguire il calcolo lato backend nella edge function: rigettato — la function è generica per repeaters, non vogliamo aggiungere logica feature-specific lì.

## R7. Distance thresholds per Summit Pursuit

**Decision**:

| Distanza utente↔cima | Comportamento |
|---------------------|---------------|
| <0.5 km | Nessun grafico. Messaggio "Sei praticamente sulla cima". |
| 0.5 km – 500 km | Profilo richiesto + grafico + classifier LOS. |
| >500 km | Nessuna chiamata edge function. Solo distanza+bearing+dislivello + messaggio "Cima troppo distante per il profilo di terreno". |

**Rationale**: <500 m il profilo è degenere; >500 km la curvatura terrestre rende il LOS geometrico falso (oltre l'orizzonte ottico ~80 km a livello del mare; oltre i 500 km la rifrazione ionosferica domina e il terreno è irrilevante). Inoltre l'API Open-Meteo elevation può rallentare significativamente sopra 500 km (200 punti di campionamento su distanza grande).

**Alternatives**:
- Soglia massima 1000 km: rigettato per latenza e utilità nulla.
- Soglia 50 km (linea radio VHF): rigettato perché SOTA si fa anche in HF con propagazione skip, la cima può essere a 300 km.

## R8. Reuse del widget chart altimetrico

**Decision**: estrarre il widget chart da `lib/src/features/repeaters/presentation/detail/widgets/altimetric_profile_bottom_sheet.dart` in `lib/common/widgets/altimetric_profile_chart.dart`. Il widget originale del bottom sheet diventa un wrapper che usa il nuovo componente comune. SOTA usa `AltimetricProfileChart` direttamente (NON in bottom sheet — inline nella pagina dettaglio).

**Rationale**: vincolo DRY costituzionale (CLAUDE.md "DRY principle"). Due implementazioni dello stesso grafico finirebbero a divergere. La memoria utente "DRY — reusable widgets" lo richiede esplicitamente.

**Alternatives**:
- Duplicare il widget per SOTA: rigettato.
- Lasciarlo dentro `features/repeaters` e importarlo cross-feature da SOTA: anti-pattern di clean architecture (dipendenza cross-feature).

## R9. Mapbox markers per SOTA

**Decision**: marker custom triangolari renderizzati come icone bitmap pre-generate (uno per altitude band: 3 icone), registrate nel marker manager Mapbox come fatto per i marker POTA esistenti. Clustering via API Mapbox built-in con soglia distanza 50 px.

**Rationale**: Mapbox SDK consuma icone come immagini; SVG inline non è supportato direttamente. Pre-generare 3 PNG (one-time durante il design) è il pattern stabilito nel progetto per i marker POTA/repeaters.

**Alternatives**:
- Usare il package `flutter_map` + Marker widget: rigettato perché il progetto è committed su Mapbox.
- Color overlay programmatic su una singola icona: complica codice senza beneficio.

## R10. Refresh policy della lista

**Decision**: solo pull-to-refresh manuale (decisione registrata nello spec). Nessun timer in foreground.

**Rationale**: parità POTA, rispetta rate-limit non documentato dell'API pubblica SOTA, codice più semplice.

## R11. Persistenza cache (decisione spec)

**Decision**: nessuna cache su disco. Solo cache in-memory via `ProviderContainer` Riverpod. `SotaRepository._summitCache: Map<String, SotaSummit>` per evitare ri-fetch del summit durante la sessione (parità con `PotaRepository._parkCache`).

**Rationale**: già motivato in spec Clarifications (Q4=A). Apertura offline è caso degradato accettato.

## R12. Integration test strategy

**Decision**:

- `test/sota_provider_test.dart` — `@Tags(['integration'])`. Usa `Dio` reale contro `api-db2.sota.org.uk` (lettura idempotente). Test:
  1. `getActiveSpots()` ritorna lista non vuota e ogni elemento ha campi richiesti.
  2. `getSummit('I/PM-272')` ritorna un summit con coordinate valide.
  3. `getSummit('XX/INVALID')` lancia eccezione mappata in `SotaSummitNotFound`.
- Integration test della edge function NON re-implementato — esiste già in `ham_qrg_supabase/supabase/tests/` per i repeaters. Sufficient.
- Unit test:
  - `bandFromFrequencyMhz`: 14.075→'20m', 7.150→'40m', 1.840→'160m', 145.500→'2m', edge cases.
  - `altitudeBand`: 999→low, 1000→mid, 1999→mid, 2000→high.
  - `pointsBandColor`: 1→neutralLow, 10→gold.
  - `lineOfSightClassifier`: caso piatto → clear; caso con picco oltre soglia → obstructed.

**Rationale**: i tipi POTA/Repeaters hanno copertura analoga; SC-008 impegna a parità.

**Alternatives**:
- Mock HTTP via `dio_test`: rigettato — i test integration di questo progetto usano endpoint reali (constitution Principle II Rationale).

## R13. Naming asset e icone

**Decision**: assets richiesti:

- `assets/images/sota_logo.png` — logo SOTA ufficiale 28×28, alpha trasparente. Se la licenza ufficiale SOTA pone restrizioni d'uso commerciale, fallback su icona generica `assets/images/sota_mountain_icon.png` (montagna stilizzata, free-design).
- `assets/images/sota_marker_low.png`, `sota_marker_mid.png`, `sota_marker_high.png` — 48×48 triangoli con fill colorato corrispondente alla altitude band.

**Rationale**: parità con `pota_logo.png` già presente in `assets/images/`. La verifica licenza SOTA è un task del designer/PM, non blocca lo sviluppo (fallback disponibile).

**Alternatives**:
- Icone vettoriali SVG: rigettato perché Flutter standard non supporta SVG senza package extra; il progetto usa PNG.
- Icona unica con tint runtime: rigettato per Mapbox (vedi R9).

## R14. Routing path strategy

**Decision**: aggiungere 3 path in `app_router.dart` sotto il `MainRouter`:

- `'sota'` → `SotaSpotsRoute`
- `'sota/map'` → `SotaSpotsMapRoute`
- `'sota/:spotId/:summitCode'` → `SotaSpotDetailRoute`

Lo stesso identico pattern del POTA esistente (`pota`, `pota/map`, `pota/:spotId/:reference`). Il param `summitCode` può contenere `/` (es. `I/PM-272`) — auto_route gestisce l'URL encoding/decoding automaticamente.

**Rationale**: parità POTA per coerenza navigazionale + deep linking.

**Alternatives**:
- Codificare `/` come `_` nel path: rigettato perché complica il roundtrip URL→dato.

## Riepilogo decisioni

| Area | Decisione |
|------|-----------|
| HTTP client | Dio fresh instance, timeout 10 s |
| Base URL SOTA | `https://api-db2.sota.org.uk` |
| JSON casing | `@JsonKey(name: 'AltM')` e `'AltFt'` per i due PascalCase |
| Frequency unit | MHz double (parità API), utility `bandFromFrequencyMhz` |
| Points palette | `SotaPointsColors` in `app_colors.dart`, 6 colori |
| Altitude bands | <1000 / 1000–2000 / >2000 m, 3 colori marker |
| LOS classifier | Geometrico O(n), soglia ostacolo 10 m |
| Distance limits | 0.5 km min, 500 km max per profilo |
| Chart widget | Estratto in `lib/common/widgets/altimetric_profile_chart.dart` (DRY) |
| Map markers | 3 PNG pre-generate triangle, clustering Mapbox |
| Refresh | Solo pull-to-refresh manuale |
| Cache | In-memory only (`Map<String, SotaSummit>`) |
| Test | Integration reale, parità POTA |
| Assets | `sota_logo.png` + 3 marker PNG |
| Routing | `/sota`, `/sota/map`, `/sota/:spotId/:summitCode` |
