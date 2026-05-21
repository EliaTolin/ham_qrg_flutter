# Implementation Plan: SOTA Integration con "Summit Pursuit"

**Branch**: `004-sota-integration` | **Date**: 2026-05-19 | **Spec**: [spec.md](spec.md)
**Input**: Feature specification from `/specs/004-sota-integration/spec.md`

## Summary

Integrare SOTA (Summits On The Air) come feature speculare a POTA con un fattore differenziante WOW: il **Summit Pursuit**, ossia il profilo altimetrico del terreno tra la QTH dell'utente e la cima attivata, calcolato dalla edge function `get_altimetric_profile` già presente nel backend Supabase. L'integrazione consuma l'API pubblica anonima di `api-db2.sota.org.uk` (endpoint `/api/spots/200/all/all` e `/api/summits/{summitCode}`) e si materializza in: pagina lista filtrabile, mappa con marker triangolari colorati per fascia altitudinale, dettaglio spot con Summit Card + grafico LOS, quarto tab paritario nella dashboard. Architettura: clean architecture per feature (`lib/src/features/sota/`), Riverpod 3.x notifiers, freezed states con `hasLoadError` per non perdere dati, refresh manuale pull-to-refresh, no cache persistente — parità totale con il pattern POTA esistente. Reuse del `getAltimetricProfileProvider` esistente; il widget del grafico altimetrico viene estratto in `lib/common/widgets/` per condivisione DRY tra Repeaters e SOTA.

## Technical Context

**Language/Version**: Dart 3.x / Flutter 3.x (versione vincolata da `pubspec.yaml` del progetto)
**Primary Dependencies**: Riverpod 3.x (`riverpod_annotation: ^4.0`), `freezed_annotation`, `json_serializable`, `auto_route`, `dio` (HTTP), `supabase_flutter` (edge function invocation), `mapbox_maps_flutter`, `geolocator` (location), `fl_chart` (grafico altimetrico, già presente)
**Storage**: Nessuno per MVP — solo cache in-memory via `ProviderContainer` Riverpod. Nessuna scrittura su SharedPreferences/SQLite per SOTA.
**Testing**: `flutter test` (unit + integration). Integration test tagged `@Tags(['integration'])` con datasource/repository reali via `ProviderContainer`. Smoke test per non-regressione POTA/Spot/Repeaters.
**Target Platform**: iOS 13+, Android API 23+ (vincoli del progetto Flutter esistente). Web non target.
**Project Type**: Mobile app (Flutter monorepo client; backend Supabase separato in `ham_qrg_supabase`).
**Performance Goals**: Lista SOTA visibile <2 s su 4G mediana (SC-001); Summit Card popolata <500 ms; profilo altimetrico completo <2 s in condizioni nominali (SC-002). 60 fps di scroll lista (parità POTA).
**Constraints**:
- Refresh policy: solo pull-to-refresh, NO auto-refresh (parità POTA, evita pressione su API pubblica SOTA).
- L'API pubblica SOTA non ha auth ma rate limit ragionevole (non documentato; teniamo 1 richiesta lista per refresh utente).
- Edge function `get_altimetric_profile` richiede JWT Supabase (anche utenti anonimi ne hanno uno).
- Geolocalizzazione opzionale per la WOW: senza GPS la Summit Card resta usabile, ma il grafico LOS è sostituito da un invito.
**Scale/Scope**: ~280 spot SOTA in pagina lista (cap API), ~50 cime uniche in vista mappa (clustering Mapbox), 1 chiamata `get_altimetric_profile` per apertura dettaglio (max ~100 punti elevazione).

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

### I. Clean Architecture Discipline → ✅ PASS

- Layout `lib/src/features/sota/{data,domain,presentation,provider,errors}/` rispetta la gerarchia Datasource → Repository → Provider → Controller → Page.
- DTO `@freezed` con `fromJson` in `data/model/`, entità di dominio pure in `domain/`, mapper in `data/mappers/`.
- Pagine `HookConsumerWidget` con `@RoutePage()`, ricevono solo ID primitivi (`spotId`, `summitCode`).
- Imports `package:hamqrg/...`.
- `build_runner` da eseguire dopo l'aggiunta di `@riverpod` / `@freezed`.

### II. Testing Standards → ✅ PASS

- `flutter analyze` con 0 warning (very_good_analysis).
- Integration test reali su SOTA datasource (mock HTTP) e su edge function (chiamata reale Supabase con anonymous sign-in). File flat: `test/sota_provider_test.dart`.
- Unit test per mapper, band-from-frequency-MHz, formattazione bearing/distance, classificazione LOS (free vs obstructed).
- `dart format lib test` clean.

### III. User Experience Consistency → ✅ PASS

- Mode colors riutilizzati (CW/SSB/FM/Digital — già definiti per altre feature; SOTA usa gli stessi nomi).
- Localizzazione `lib/l10n/app_*.arb` con chiavi prefisso `sota` in camelCase (es. `sotaTitle`, `sotaSummitPursuit`, `sotaLosClear`, `sotaLosObstructed`). Aggiunte in **tutti** i file ARB (`app_it.arb`, `app_en.arb`, `app_es.arb`, `app_fr.arb` — vincolo costituzionale Development Workflow).
- Error pattern: refresh fallito → `hasLoadError` in freezed state, NON `AsyncError`. Pagina dettaglio: errori indipendenti per Summit Card e profilo (FR-070/071).
- Anon-friendly: nessuna azione SOTA richiede autenticazione UI; il prompt di registrazione non interviene.

### IV. Performance & Reliability → ✅ PASS

- Nessun PostgREST `!inner` (no Supabase data per SOTA); l'unica chiamata Supabase è la edge function già esistente.
- No auth provider invalidation (read-only).
- Controllers usano pattern try/catch + `state = AsyncData(prev.copyWith(hasLoadError: true))` su mutazioni (CLAUDE.md compliant).
- Timeout HTTP esplicito sul Dio per API SOTA (10 s).

### V. Responsive Layout (Mobile + Tablet) → ✅ PASS

- Tutte le pagine SOTA usano `ResponsiveLayout` con builder `mobile` (required) e `tablet` (where applicable):
  - `sota_spots_page.dart` — mobile (lista verticale) + tablet (split column con filtri laterali, pattern parità POTA tablet)
  - `sota_spot_detail_page.dart` — mobile (sezioni stacked) + tablet (`sota_spot_detail_tablet.dart` con summit card affiancata al profilo, parità POTA)
  - `sota_spots_map_page.dart` — mobile + tablet (riusa pattern Mapbox esistente)
- Breakpoint `kTabletBreakpoint` consumato dal widget condiviso, mai hardcoded.

### Verdict: PASS (zero violazioni)

Nessun elemento da spostare in **Complexity Tracking**.

## Project Structure

### Documentation (this feature)

```text
specs/004-sota-integration/
├── plan.md                  # This file
├── research.md              # Phase 0 output (this run)
├── data-model.md            # Phase 1 output (this run)
├── quickstart.md            # Phase 1 output (this run)
├── contracts/
│   ├── sota-api-spots.md    # SOTA public API spots endpoint contract
│   ├── sota-api-summit.md   # SOTA public API summit detail contract
│   └── edge-altimetric.md   # get_altimetric_profile edge function contract (already shipped)
├── checklists/
│   └── requirements.md      # Spec quality checklist (already exists)
└── tasks.md                 # Phase 2 output (generated by /speckit.tasks, NOT here)
```

### Source Code (repository root)

Nuovo modulo feature: `lib/src/features/sota/` (parità strutturale con `lib/src/features/pota/`).

```text
lib/
├── src/features/sota/
│   ├── data/
│   │   ├── datasource/
│   │   │   ├── sota_datasource.dart                 # abstract interface
│   │   │   └── sota_api_datasource.dart             # Dio impl against api-db2.sota.org.uk
│   │   ├── model/
│   │   │   ├── sota_spot_model.dart                 # @freezed DTO + fromJson
│   │   │   └── sota_summit_model.dart               # @freezed DTO + fromJson
│   │   ├── mappers/
│   │   │   └── sota_mappers.dart                    # Model → Entity + band-from-MHz utility
│   │   └── repository/
│   │       └── sota_repository.dart                 # @Riverpod(keepAlive: true)
│   ├── domain/
│   │   ├── sota_spot.dart                           # @freezed entity
│   │   └── sota_summit.dart                         # @freezed entity
│   ├── errors/
│   │   └── sota_errors.dart                         # SotaApiException, SotaSummitNotFound
│   ├── provider/
│   │   ├── get_sota_spots/
│   │   │   └── get_sota_spots_provider.dart         # action provider
│   │   └── get_sota_summit/
│   │       └── get_sota_summit_provider.dart        # action provider (with in-memory cache)
│   └── presentation/
│       ├── sota_spots_page/
│       │   ├── controller/
│       │   │   ├── sota_spots_controller.dart       # @riverpod notifier
│       │   │   └── state/
│       │   │       ├── sota_spots_state.dart        # @freezed state (filters, sort, hasLoadError)
│       │   │       └── sota_spots_sort_order.dart   # enum (time | distance)
│       │   ├── sota_spots_page.dart                 # @RoutePage()
│       │   ├── sota_spots_tablet.dart               # tablet layout
│       │   └── widgets/
│       │       ├── sota_spot_list_item.dart
│       │       ├── sota_points_badge.dart
│       │       └── sota_altitude_badge.dart
│       ├── sota_spot_detail_page/
│       │   ├── controller/
│       │   │   ├── sota_spot_detail_controller.dart
│       │   │   └── state/
│       │   │       └── sota_spot_detail_state.dart  # @freezed (spot, summit?, summitError, summitLoading)
│       │   ├── sota_spot_detail_page.dart           # @RoutePage()
│       │   ├── sota_spot_detail_tablet.dart
│       │   └── widgets/
│       │       ├── summit_card.dart                 # the WOW header
│       │       ├── summit_pursuit_section.dart      # chart + LOS verdict (uses common chart widget)
│       │       └── summit_restrictions_banner.dart
│       ├── sota_spots_map_page/
│       │   ├── sota_spots_map_page.dart             # @RoutePage()
│       │   └── widgets/
│       │       └── sota_summit_marker.dart          # triangle marker tinted by altitude band
│       └── widgets/
│           └── sota_mode_badge.dart
├── common/
│   └── widgets/
│       └── altimetric_profile_chart.dart            # NEW: extracted from existing altimetric_profile_bottom_sheet.dart (DRY for Repeaters + SOTA)
└── router/
    └── app_router.dart                              # adds /sota, /sota/map, /sota/:spotId/:summitCode

assets/images/
└── sota_logo.png                                    # (or generic mountain icon if licensing blocks)

test/
├── sota_provider_test.dart                          # integration: real Supabase anon + real Dio against fixtures
├── common/widgets/altimetric_profile_chart_test.dart
└── sota_mappers_test.dart                           # unit: band-from-MHz, points-class, LOS classifier
```

**Structure Decision**: `lib/src/features/sota/` con suddivisione speculare a `lib/src/features/pota/` (Clean Architecture costituzionale). Il widget altimetric chart viene estratto da `lib/src/features/repeaters/presentation/detail/widgets/altimetric_profile_bottom_sheet.dart` in `lib/common/widgets/altimetric_profile_chart.dart` per evitare duplicazione (DRY costituzionale Repeaters↔SOTA). Nessuna modifica al backend Supabase: la edge function `get_altimetric_profile` è già deployata e usata.

## Phase 0: Outline & Research — completata

Output: [research.md](research.md). Tutte le NEEDS CLARIFICATION risolte (le 5 domande della sessione `/speckit.clarify` sono già nelle Clarifications dello spec). Sintesi delle decisioni tecniche:

- **HTTP client**: `Dio` nuova istanza per il datasource SOTA (parità POTA — niente shared singleton perché non c'è auth interceptor).
- **Base URL**: `https://api-db2.sota.org.uk` (notare il doppio slash nella URL fornita dall'utente è un refuso — l'API funziona con singolo slash).
- **JSON casing**: i campi SOTA usano camelCase + PascalCase miste (`activatorCallsign`, `summitCode`, `AltM`, `AltFt`). Va usato `@JsonKey(name: 'AltM')` per i campi PascalCase.
- **Frequency unit**: SOTA `frequency` è in **MHz come `double`** (es. `14.065`). POTA usa **kHz come `String`**. Le due unità coesistono nei rispettivi domini; la utility `bandFromFrequencyMhz()` è nuova in `sota_mappers.dart`, distinta da `bandFromFrequencyKhz()` di POTA. La logica delle soglie banda è identica.
- **Timestamp**: `timeStamp` è ISO 8601 UTC con suffisso `Z`. Parsing diretto con `DateTime.parse(...).toLocal()`.
- **Points scale**: standard SOTA = {1, 2, 4, 6, 8, 10}. Colori (eccezione `AppColors`): 1→neutralLow, 2→neutral, 4→green, 6→amber, 8→orange, 10→gold/red. Aggiunti in `lib/themes/app_colors.dart` come palette `SotaPointsColors`.
- **Altitude bands** (per marker mappa): <1000 m → green, 1000–2000 m → amber, >2000 m → blue/white. Definito in `sota_mappers.dart` come `altitudeBand(int meters)`.
- **LOS classifier**: algoritmo geometrico semplice — per ogni punto del profilo (i=1..n-2), verificare se `elevation[i] > linearInterp(elevation[0], elevation[n-1], i/(n-1))`. Se sì per almeno un punto con margine ≥10 m, restituire "Possibile ostruzione" + indice/quota dell'apice. Margine 10 m per ignorare rumore DEM.
- **Distance threshold** per Summit Pursuit: 500 km. Sopra: niente grafico, solo distanza+bearing+dislivello.
- **Distance threshold** minimo: 500 m. Sotto: "Sei praticamente sulla cima".
- **In-memory summit cache**: `Map<String, SotaSummit>` dentro `SotaRepository` con `keepAlive: true` (parità `PotaRepository._parkCache`).
- **Refresh policy**: solo pull-to-refresh. NO timer in foreground.

## Phase 1: Design & Contracts — completata

Output:

- [data-model.md](data-model.md) — entità di dominio + DTO + state machines della pagina lista e dettaglio.
- [contracts/sota-api-spots.md](contracts/sota-api-spots.md) — schema della response dell'endpoint `/api/spots/200/all/all`.
- [contracts/sota-api-summit.md](contracts/sota-api-summit.md) — schema della response dell'endpoint `/api/summits/{code}`.
- [contracts/edge-altimetric.md](contracts/edge-altimetric.md) — request/response della edge function `get_altimetric_profile` (già deployata, doc di riferimento).
- [quickstart.md](quickstart.md) — istruzioni passo-passo per generare, runnare e testare la feature.
- [CLAUDE.md](../../CLAUDE.md) aggiornato — aggiunta la sezione SOTA al modello di feature pattern (delta minimal, sezione "Active Technologies" già copre Dart/Flutter/Riverpod).

### Re-evaluation Constitution Check post-design

Nessun design output ha introdotto violazioni. Verdetto invariato: **PASS**.

## Phase 2: Tasks (NOT produced by this command)

`/speckit.plan` si ferma qui. La fase tasks viene generata da `/speckit.tasks` e produrrà `tasks.md`. Indicazione di massima per il task generator (non vincolante):

1. Scaffold `lib/src/features/sota/` directory tree (vuoto, conforme al **Structure Decision**).
2. Aggiungere `sota_logo.png` ad `assets/images/` (o fallback mountain icon vettoriale).
3. Estrarre `AltimetricProfileChart` widget riusabile in `lib/common/widgets/altimetric_profile_chart.dart`; aggiornare il vecchio `altimetric_profile_bottom_sheet.dart` per usarlo.
4. Aggiungere `SotaPointsColors` palette in `lib/themes/app_colors.dart`.
5. Definire DTO `SotaSpotModel`, `SotaSummitModel` con `@freezed` + `fromJson`. Run `build_runner`.
6. Definire entità domain `SotaSpot`, `SotaSummit`, `SummitPursuit`. Run `build_runner`.
7. Implementare `SotaApiDatasource` + repository (con cache summit in-memory).
8. Implementare provider `getSotaSpotsProvider`, `getSotaSummitProvider`.
9. Aggiungere keys l10n in tutti gli ARB (`app_it.arb`, `app_en.arb`, `app_es.arb`, `app_fr.arb`). Run `gen-l10n`.
10. Implementare `SotaSpotsController` + state freezed + page mobile + tablet.
11. Implementare `SotaSpotDetailController` + state + page mobile + tablet con Summit Card + Summit Pursuit section (riusa `AltimetricProfileChart` + classifier LOS).
12. Implementare `SotaSpotsMapPage` con marker triangoli + clustering.
13. Estendere `app_router.dart` con i 3 path SOTA. Run `build_runner`.
14. Estendere `dashboard_page.dart` con quarto tab SOTA + `_SotaTabContent`.
15. Test unitari `sota_mappers_test.dart` (band-MHz, altitude band, LOS classifier).
16. Integration test `sota_provider_test.dart` (datasource reale via Dio + edge function reale con anonymous sign-in).
17. Smoke test manuale: POTA, Spot Cluster, Repeaters non regrediscono. Tablet layout verificato (vincolo costituzionale V).
18. `flutter analyze`, `dart format lib test`, commit con prefix `feat:` per ogni layer logico.

## Complexity Tracking

Sezione vuota — nessuna violazione costituzionale da giustificare.

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|--------------------------------------|
| — | — | — |
