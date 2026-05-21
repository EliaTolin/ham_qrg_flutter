---
description: "Task list for feature implementation: SOTA Integration con Summit Pursuit"
---

# Tasks: SOTA Integration con "Summit Pursuit"

**Input**: Design documents from `/specs/004-sota-integration/`
**Prerequisites**: plan.md ✓, spec.md ✓, research.md ✓, data-model.md ✓, contracts/ ✓, quickstart.md ✓

**Tests**: Included — la costituzione del progetto (Principle II) richiede integration test per feature che toccano Supabase (US2 → edge function) e SC-008 dello spec impegna a parità di copertura test con POTA.

**Organization**: Tasks grouped by user story (5 US, priorities P1–P3) per implementazione indipendente.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: User story (US1, US2, US3, US4, US5) — required only in story phases
- Include exact file paths in descriptions

## Path Conventions

Flutter mobile app, monorepo. Feature root: `lib/src/features/sota/`. Backend Supabase separato (no changes required).

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Inizializzazione progetto, asset, l10n, palette.

- [X] T001 Create SOTA feature directory tree at lib/src/features/sota/{data/{datasource,model,mappers,repository},domain,errors,provider/{get_sota_spots,get_sota_summit},presentation/{sota_spots_page/{controller/state,widgets},sota_spot_detail_page/{controller/state,widgets},sota_spots_map_page/widgets,widgets}}
- [X] T002 [P] Add SOTA logo asset (28×28) at assets/images/sota_logo.png (downloaded 280×280 from sota.org.uk official; Flutter scales as needed)
- [ ] T003 [P] Add 3 altitude-banded triangle markers at assets/images/sota_marker_low.png, assets/images/sota_marker_mid.png, assets/images/sota_marker_high.png (48×48 each) — DEFERRED: will use programmatic markers (Material Icons + tinting) in US3 to avoid blocking on PNG generation
- [X] T004 Register asset paths under flutter > assets in pubspec.yaml — NOT NEEDED: existing wildcard `assets/images/` already covers sota_logo.png
- [X] T005 [P] Add SotaPointsColors + SotaAltitudeColors palette to lib/themes/app_colors.dart
- [X] T006 [P] Add all sota* l10n keys to lib/l10n/app_it.arb (45 keys + placeholder metadata)
- [X] T007 [P] Mirror all sota* l10n keys in lib/l10n/app_en.arb with English translations
- [X] T008 [P] Mirror all sota* l10n keys in lib/l10n/app_es.arb (English fallback, parity guaranteed; refinement post-MVP)
- [X] T009 [P] Mirror all sota* l10n keys in lib/l10n/app_fr.arb (English fallback) + additionally cs/de/hr/hu/nl/pl/pt/ro/sk/sl/sr (15 ARB files total — script-based parity)
- [X] T010 Run flutter gen-l10n to regenerate localization classes (sotaTitle verified in generated files)

**Checkpoint**: Filesystem, assets, theme, l10n pronti.

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Data layer + DRY refactor del chart altimetrico. Necessari per TUTTE le user stories.

**⚠️ CRITICAL**: No user story work can begin until this phase is complete

### Data layer — modelli, mappers, errors

- [X] T011 [P] Create SotaSpotModel DTO with @freezed and @JsonKey(name: 'AltM'/'AltFt') for the PascalCase fields in lib/src/features/sota/data/model/sota_spot_model.dart
- [X] T012 [P] Create SotaSummitModel DTO with @freezed in lib/src/features/sota/data/model/sota_summit_model.dart (note: altM/altFt are camelCase here, no @JsonKey needed)
- [X] T013 [P] Create domain entity SotaSpot + SotaSpotType enum with @freezed in lib/src/features/sota/domain/sota_spot.dart
- [X] T014 [P] Create domain entity SotaSummit with @freezed in lib/src/features/sota/domain/sota_summit.dart
- [X] T015 [P] Create error classes SotaApiException and SotaSummitNotFound in lib/src/features/sota/errors/sota_errors.dart
- [X] T016 Run dart run build_runner build --delete-conflicting-outputs to generate freezed/json for T011–T014
- [X] T017 Implement SotaMappers (spotFromModel, summitFromModel) and standalone utilities (bandFromFrequencyMhz, altitudeBand, pointsTier, bearingDegrees) in lib/src/features/sota/data/mappers/sota_mappers.dart per data-model.md (LOS classifier added later in US2)

### Data layer — datasource + repository

- [X] T018 [P] Create abstract datasource interface SotaDatasource in lib/src/features/sota/data/datasource/sota_datasource.dart (methods: getActiveSpots, getSummit)
- [X] T019 Implement SotaApiDatasource (Dio against https://api-db2.sota.org.uk, 10s timeout, @riverpod provider) in lib/src/features/sota/data/datasource/sota_api_datasource.dart per contracts/sota-api-spots.md and contracts/sota-api-summit.md
- [X] T020 Implement SotaRepository with @Riverpod(keepAlive: true) and in-memory Map<String, SotaSummit> summit cache in lib/src/features/sota/data/repository/sota_repository.dart
- [X] T021 Run dart run build_runner build --delete-conflicting-outputs to generate provider .g.dart files

### Shared providers

- [X] T022 [P] Create getSotaSpotsProvider in lib/src/features/sota/provider/get_sota_spots/get_sota_spots_provider.dart (delegates to SotaRepository.getActiveSpots)
- [X] T023 [P] Create getSotaSummitProvider with family parameter summitCode in lib/src/features/sota/provider/get_sota_summit/get_sota_summit_provider.dart (delegates to SotaRepository.getSummit, leverages repo cache)
- [X] T024 Run dart run build_runner build --delete-conflicting-outputs to generate provider .g.dart files for T022–T023

### DRY refactor — extract altimetric profile chart

- [X] T025 Extract chart widget from lib/src/features/repeaters/presentation/detail/widgets/altimetric_profile_bottom_sheet.dart into new shared widget lib/common/widgets/altimetric_profile_chart.dart (params: AltimetricProfile profile, optional title, optional LineOfSight result for overlay; renders fl_chart with terrain gradient and LOS dashed line)
- [X] T026 Update lib/src/features/repeaters/presentation/detail/widgets/altimetric_profile_bottom_sheet.dart to consume the new AltimetricProfileChart widget (regression check: existing repeater detail still works)
- [X] T027 Verify flutter analyze passes with zero warnings after the extraction refactor

**Checkpoint**: Foundation ready - user story implementation can now begin in parallel.

---

## Phase 3: User Story 1 — Vedere gli spot SOTA live (Priority: P1) 🎯 MVP

**Goal**: Lista filtrabile e ordinabile degli spot SOTA correnti con badge altitudine, badge punti e freshness indicator. È l'esperienza base SOTA — da sola fornisce valore d'uso.

**Independent Test**: L'utente apre la pagina SOTA, vede la lista popolata, applica un filtro banda (es. "20m"), vede solo gli spot in 20m, fa pull-to-refresh, e tocca uno spot per aprire il dettaglio (stub in questa fase, completato in US2).

### Tests for User Story 1

- [ ] T028 [P] [US1] Unit tests for SotaMappers utilities (bandFromFrequencyMhz across all bands, altitudeBand boundaries 999/1000/1999/2000, pointsTier mapping, bearingDegrees 4 cardinals) in test/sota_mappers_test.dart
- [ ] T029 [P] [US1] Integration test getActiveSpots returns non-empty list with required fields in test/sota_provider_test.dart (@Tags(['integration']))

### Implementation for User Story 1

- [X] T030 [P] [US1] Create SotaSpotsSortOrder enum (time, distance) in lib/src/features/sota/presentation/sota_spots_page/controller/state/sota_spots_sort_order.dart
- [X] T031 [US1] Create SotaSpotsState with @freezed (spots, filteredSpots, selectedBand, selectedMode, minPoints, selectedAssociation, sortOrder, distanceBySummitCode, hasLoadError, isRefreshing, availableBands, availableModes, availableAssociations) per data-model.md in lib/src/features/sota/presentation/sota_spots_page/controller/state/sota_spots_state.dart
- [X] T032 [US1] Run dart run build_runner build --delete-conflicting-outputs to generate freezed state class
- [X] T033 [US1] Implement SotaSpotsController @riverpod notifier with build() (initial fetch via getSotaSpotsProvider), refresh() (with hasLoadError pattern — never AsyncError on mutation, per CLAUDE.md), filterByBand, filterByMode, setSortOrder methods in lib/src/features/sota/presentation/sota_spots_page/controller/sota_spots_controller.dart
- [X] T034 [US1] Run dart run build_runner build --delete-conflicting-outputs to generate controller .g.dart
- [X] T035 [P] [US1] Create SotaPointsBadge widget (uses SotaPointsColors.forPoints) in lib/src/features/sota/presentation/sota_spots_page/widgets/sota_points_badge.dart
- [X] T036 [P] [US1] Create SotaAltitudeBadge widget (shows "{m} m", styled per design) in lib/src/features/sota/presentation/sota_spots_page/widgets/sota_altitude_badge.dart
- [X] T037 [P] [US1] Create SotaModeBadge widget (shared across pages) in lib/src/features/sota/presentation/widgets/sota_mode_badge.dart
- [X] T038 [US1] Create SotaSpotListItem widget (activator, freq+band, mode badge, summit name+code, altitude badge, points badge, freshness indicator with theme-derived colors; QRT attenuation when spot.type == qrt) in lib/src/features/sota/presentation/sota_spots_page/widgets/sota_spot_list_item.dart (depends on T035, T036, T037)
- [X] T039 [US1] Create SotaSpotsPage @RoutePage() mobile layout with AppBar (logo + title + map icon stub), filter chips for band/mode, sort menu, pull-to-refresh, list of SotaSpotListItem in lib/src/features/sota/presentation/sota_spots_page/sota_spots_page.dart
- [X] T040 [US1] Create SotaSpotsTablet variant (filters laterally, list with wider cards, parity POTA tablet) in lib/src/features/sota/presentation/sota_spots_page/sota_spots_tablet.dart
- [X] T041 [US1] Wrap mobile + tablet in ResponsiveLayout inside SotaSpotsPage build()
- [X] T042 [US1] Add /sota route entry in lib/router/app_router.dart under MainRouter children: AutoRoute(path: 'sota', page: SotaSpotsRoute.page)
- [X] T043 [US1] Run dart run build_runner build --delete-conflicting-outputs to regenerate app_router.gr.dart
- [X] T044 [US1] Verify flutter analyze passes; manually open /sota route and confirm the list renders with at least one fixture spot from the live API

**Checkpoint**: Lista SOTA navigabile e funzionante. Compatibile mobile + tablet. Pull-to-refresh attivo. Tap su spot apre dettaglio (placeholder — verrà sostituito in US2).

---

## Phase 4: User Story 2 — Summit Pursuit con profilo altimetrico (Priority: P1) 🌟 WOW

**Goal**: Dettaglio spot con Summit Card e grafico del profilo altimetrico tra QTH utente e cima (LOS classifier). È la WOW feature, fattore differenziante vs POTA.

**Independent Test**: L'utente con GPS attivo apre il dettaglio di uno spot italiano: Summit Card popolata entro 500 ms, grafico altimetrico + verdetto "Vista libera"/"Possibile ostruzione" entro 2 s. L'utente disabilita il GPS: card resta visibile, sezione pursuit mostra invito ad attivare GPS senza degradare il resto. L'utente apre uno spot oltreoceano (>500 km): card visibile, profilo sostituito da messaggio "Cima troppo distante".

### Tests for User Story 2

- [ ] T045 [P] [US2] Unit tests for classifyLineOfSight in test/sota_mappers_test.dart (caso piatto → clear; caso ostacolo singolo >10m → obstructed con margin; caso ostacolo <10m → clear)
- [ ] T046 [P] [US2] Integration test getSummit("I/PM-272") returns valid summit + getSummit("XX/INVALID-999") throws SotaSummitNotFound in test/sota_provider_test.dart

### Implementation for User Story 2

- [X] T047 [P] [US2] Create domain entities SummitPursuit + LineOfSight + PursuitUnavailableReason enum with @freezed in lib/src/features/sota/domain/summit_pursuit.dart
- [X] T048 [US2] Run dart run build_runner build --delete-conflicting-outputs to generate freezed
- [X] T049 [US2] Add classifyLineOfSight(AltimetricProfile) function to lib/src/features/sota/data/mappers/sota_mappers.dart per research.md R6 (geometric O(n), 10m noise threshold)
- [X] T050 [US2] Create SotaSpotDetailState with @freezed (spot, summit?, summitLoading, summitError, pursuit?, pursuitLoading, pursuitError, pursuitUnavailable?) in lib/src/features/sota/presentation/sota_spot_detail_page/controller/state/sota_spot_detail_state.dart
- [X] T051 [US2] Implement SotaSpotDetailController @riverpod family (spotId, summitCode) with two independent async sections: (a) summit fetch via getSotaSummitProvider, (b) pursuit computation — pre-check distance (<0.5 km tooClose; >500 km tooFar) and GPS availability; if all OK call getAltimetricProfileProvider then classifier in lib/src/features/sota/presentation/sota_spot_detail_page/controller/sota_spot_detail_controller.dart
- [X] T052 [US2] Run dart run build_runner build --delete-conflicting-outputs to generate controller .g.dart and state freezed
- [X] T053 [P] [US2] Create SummitCard widget (name, code, altitude m+ft, points trophy, association flag/name, region, locator, distance+bearing+elevation delta) in lib/src/features/sota/presentation/sota_spot_detail_page/widgets/summit_card.dart
- [X] T054 [P] [US2] Create SummitRestrictionsBanner widget (shown when summit.hasRestrictions or summit.valid == false) in lib/src/features/sota/presentation/sota_spot_detail_page/widgets/summit_restrictions_banner.dart
- [X] T055 [US2] Create SummitPursuitSection widget (consumes pursuit state; renders AltimetricProfileChart from lib/common/widgets/ when data available, with LineOfSight overlay; shows skeleton during loading; shows reason message for each PursuitUnavailableReason; retry button on pursuitError) in lib/src/features/sota/presentation/sota_spot_detail_page/widgets/summit_pursuit_section.dart
- [X] T056 [US2] Create SotaSpotDetailPage @RoutePage() mobile layout with PathParam spotId + summitCode, sections: Summit Card → Summit Pursuit → Spot info (freq/mode/comments/time/activator) → action buttons (Copy frequency, Open on map, Share) in lib/src/features/sota/presentation/sota_spot_detail_page/sota_spot_detail_page.dart
- [X] T057 [US2] Create SotaSpotDetailTablet variant (Summit Card + Pursuit side-by-side, parity POTA tablet) in lib/src/features/sota/presentation/sota_spot_detail_page/sota_spot_detail_tablet.dart
- [X] T058 [US2] Wrap mobile + tablet in ResponsiveLayout inside SotaSpotDetailPage build()
- [X] T059 [US2] Update SotaSpotListItem onTap (and any other navigation entry points) to push SotaSpotDetailRoute(spotId: spot.id, summitCode: spot.summitCode)
- [X] T060 [US2] Add /sota/:spotId/:summitCode route in lib/router/app_router.dart and run dart run build_runner build --delete-conflicting-outputs
- [ ] T061 [US2] Manual smoke test: open Italian spot detail → chart appears <2 s with LOS verdict; open USA spot (>500 km from Italy) → "Too far" message; toggle GPS off → "No location" invite; toggle GPS on → chart reloads

**Checkpoint**: WOW feature funzionante. Independent error handling tra Summit Card e Pursuit verified (FR-070/071).

---

## Phase 5: User Story 3 — Mappa SOTA con marker altimetrici (Priority: P2)

**Goal**: Mappa Mapbox con marker triangolari delle cime con spot attivi, colorati per fascia altitudinale, clustering, tap → bottom sheet → dettaglio.

**Independent Test**: L'utente apre la mappa SOTA dalla list page (icona mappa), vede marker triangolari posizionati alle coordinate corrette delle cime; un marker a <1000 m è verde, uno >2000 m è blu/bianco. Tocca un marker → bottom sheet con Summit Card. Bottom sheet ha pulsante "Apri dettaglio" che porta al Summit Pursuit.

### Implementation for User Story 3

- [X] T062 [US3] Create SotaSummitMarker helper (selects marker PNG asset based on altitudeBand: low/mid/high) in lib/src/features/sota/presentation/sota_spots_map_page/widgets/sota_summit_marker.dart
- [X] T063 [US3] Create SotaSpotsMapPage @RoutePage() with Mapbox map view (riusa il pattern di lib/src/features/pota/presentation/pota_spots_map_page/pota_spots_map_page.dart): registers 3 marker icons, fetches spots via getSotaSpotsProvider, dedupes by summitCode, fetches summit detail for each unique code via getSotaSummitProvider, places markers at summit lat/lon; supports Mapbox clustering at low zoom; on tap shows bottom sheet with SummitCard + "Apri dettaglio" button in lib/src/features/sota/presentation/sota_spots_map_page/sota_spots_map_page.dart
- [X] T064 [US3] Center the map on user position when available (cachedUserPositionProvider) with zoom ~9; fallback to Italy bounding box if no location and no spots in Italy region
- [X] T065 [US3] Add map icon button in SotaSpotsPage app bar that pushes SotaSpotsMapRoute (replaces stub from US1 T039)
- [X] T066 [US3] Add /sota/map route in lib/router/app_router.dart and run dart run build_runner build --delete-conflicting-outputs
- [X] T067 [US3] Manual smoke test: open SOTA map; verify markers visible at correct positions; verify color matches altitude band; tap marker → bottom sheet → "Apri dettaglio" lands on SotaSpotDetailPage with terrain profile loading

**Checkpoint**: Mappa SOTA navigabile e differenziata visivamente da POTA per altitude band.

---

## Phase 6: User Story 4 — Tab SOTA in dashboard (Priority: P2)

**Goal**: Quarto tab paritario nel selettore dashboard (Ripetitori / Spot / POTA / SOTA) con top 5 spot recenti, live badge, pulsante "Vedi tutti".

**Independent Test**: L'utente apre la dashboard, sceglie il tab SOTA, vede 5 card compatte degli spot più recenti con badge altitudine + punti + freshness; il label del tab mostra badge live se ci sono spot ≤15 min; tap su uno spot → dettaglio Summit Pursuit; tap su "Vedi tutti" → list page full screen.

### Implementation for User Story 4

- [X] T068 [US4] Add _DashboardTab.sota enum value to lib/src/features/dashboard/presentation/dashboard_page/dashboard_page.dart
- [X] T069 [US4] Extend DashboardState (lib/src/features/dashboard/presentation/dashboard_page/controller/state/dashboard_state.dart) with sotaSpots: List<SotaSpot> field (@Default([])); regenerate freezed via dart run build_runner build --delete-conflicting-outputs
- [X] T070 [US4] Update DashboardController.build() in lib/src/features/dashboard/presentation/dashboard_page/controller/dashboard_controller.dart to fetch top-N SOTA spots in parallel with existing fetches (Future.wait) and populate state.sotaSpots
- [X] T071 [US4] Add refreshSota() method to DashboardController analogous to refreshPota()
- [X] T072 [US4] Add 4th ButtonSegment "SOTA" to _TabSelector in dashboard_page.dart with live badge (uses count of spots ≤15 min, reuses _LiveBadge widget pattern)
- [X] T073 [US4] Implement _SotaTabContent widget (modeled after _PotaTabContent): title row + refresh + "Vedi tutti" button, list of compact SOTA spot items with altitude badge, points trophy, freshness; empty state with educational text in lib/src/features/dashboard/presentation/dashboard_page/dashboard_page.dart
- [X] T074 [US4] Wire _SotaTabContent into _ContentSection switch statement in dashboard_page.dart
- [X] T075 [US4] Update lib/src/features/dashboard/presentation/dashboard_page/dashboard_tablet.dart to accept and display sotaSpots in the tablet layout (parity with potaSpots handling)
- [X] T076 [US4] Manual smoke test: dashboard tab SOTA shows top 5 recent spots; "Vedi tutti" routes to SotaSpotsRoute; live badge appears when fresh spots exist; tap on item navigates to SotaSpotDetailRoute; works on tablet ≥840 dp

**Checkpoint**: Dashboard estesa con 4° tab. Verifica che POTA / Repeaters / Spot cluster non regrediscano.

---

## Phase 7: User Story 5 — Filtri avanzati: punti + associazione (Priority: P3)

**Goal**: Aggiungere filtro per fascia di punti (minPoints) e per associazione SOTA (selectedAssociation) alla list page, in aggiunta ai filtri band/mode già implementati in US1.

**Independent Test**: L'utente attiva il filtro "8+ punti", vede solo spot con `points >= 8`. Aggiunge il filtro associazione "Italy", vede solo spot con summitCode che inizia con "I/". Rimuove i filtri tramite il pulsante "Rimuovi filtri" e torna alla lista completa con il contatore aggiornato.

### Implementation for User Story 5

- [X] T077 [US5] Extend SotaSpotsController with filterByMinPoints(int?) and filterByAssociation(String?) methods that update state.minPoints / state.selectedAssociation and recompute filteredSpots in lib/src/features/sota/presentation/sota_spots_page/controller/sota_spots_controller.dart
- [X] T078 [US5] Update the internal _applyFilters() routine in SotaSpotsController to combine all 4 filters (band, mode, minPoints, association) in a single pass; also derive availableAssociations from spots[].summitCode.split('/').first (e.g., "I", "W6", "DL")
- [X] T079 [US5] Add UI in SotaSpotsPage (and tablet variant) for the new filters: a points selector (chips "Tutti", "4+", "6+", "8+", "10") and an association dropdown menu populated from state.availableAssociations; render a "Rimuovi filtri" pill when any filter is non-default in lib/src/features/sota/presentation/sota_spots_page/sota_spots_page.dart
- [X] T080 [US5] Add unit tests in test/sota_mappers_test.dart for the associationCode extraction (e.g., "I/PM-272" → "I", "W6/SC-453" → "W6")
- [X] T081 [US5] Manual smoke test: apply minPoints=8, verify only high-value spots; apply association="I", verify only Italian spots; combine band+mode+minPoints+association, verify count updates correctly; tap "Rimuovi filtri" → restored full list

**Checkpoint**: Filtri avanzati attivi per SOTA Chaser dedicati. Tutti i filtri precedenti (US1) continuano a funzionare.

---

## Phase 8: Polish & Cross-Cutting Concerns

**Purpose**: Quality gates, format, no-regression, l10n parity, tablet QA.

- [X] T082 [P] Run flutter analyze across the whole project; fix any new warning introduced by SOTA feature
- [X] T083 [P] Run dart format lib test and commit any formatting deltas
- [X] T084 [P] Verify all 4 ARB files (it/en/es/fr) have parity on every sota* key (no missing keys); fix any drift
- [X] T085 [P] Update Recent Changes section in CLAUDE.md (already covered by script during /speckit.plan, verify still accurate)
- [ ] T086 Execute the full smoke test checklist from specs/004-sota-integration/quickstart.md section 7 on a physical iOS device
- [X] T087 Execute the smoke test checklist on an Android device (or emulator) ≥840 dp to validate tablet layouts
- [X] T088 Cross-feature regression check: open Repeaters list, Repeaters map, Repeater detail with altimetric profile bottom sheet (must still work after T025–T026 refactor), Favoriti, POTA list, POTA map, POTA detail, Spot Cluster
- [X] T089 Verify cache hit logic: open the same SOTA spot detail twice, second open should not re-fetch summit (devtools network panel inspection)
- [ ] T090 Create PR via gh pr create with title "feat: SOTA integration with Summit Pursuit terrain profile (WOW)" and body linking specs/004-sota-integration/spec.md

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies — può iniziare subito.
- **Foundational (Phase 2)**: Dipende dal completamento di Setup — BLOCCA tutte le user stories.
- **User Story 1 (Phase 3 — P1, MVP)**: Dipende da Foundational.
- **User Story 2 (Phase 4 — P1, WOW)**: Dipende da Foundational. Tocca app_router.dart in T060 — sequenzializzato con T042/T043 di US1 se in parallelo.
- **User Story 3 (Phase 5 — P2, Map)**: Dipende da Foundational. Tocca app_router.dart in T066 — sequenzializzato con altre route changes. T065 modifica file di US1 (SotaSpotsPage) — sequenzializzato con T039.
- **User Story 4 (Phase 6 — P2, Dashboard)**: Dipende da Foundational. NON dipende da US1 in senso stretto (consuma getSotaSpotsProvider direttamente), ma raccomandato dopo US1 per coerenza UX.
- **User Story 5 (Phase 7 — P3, Filtri)**: Dipende da US1 (estende SotaSpotsController + page).
- **Polish (Phase 8)**: Dipende da tutte le user stories desiderate.

### User Story Dependencies

- **US1 (P1)**: Foundational only. Independent test possibile alla fine di Phase 3.
- **US2 (P1)**: Foundational only. Integration con US1 via navigation (tap su spot list item) — gestito in T059.
- **US3 (P2)**: Foundational. Soft-coupled con US1 (icona mappa nella app bar di SotaSpotsPage, T065).
- **US4 (P2)**: Foundational. Indipendente da US1/US2/US3 strutturalmente (anche se ne riusa i target di navigazione).
- **US5 (P3)**: HARD dependency su US1 (estende lo stesso controller + page).

### Within Each User Story

- Tests precedono o accompagnano l'implementation (TDD soft — i test ci sono come scaffold, non strictamente FAIL-first).
- Domain entities → state → controller → widget primitivi → page mobile → page tablet → ResponsiveLayout wrapping → route → smoke test.
- build_runner step deve essere eseguito dopo OGNI gruppo di annotazioni @freezed o @riverpod.
- Commit a fine di ogni layer logico (vedi quickstart.md sezione 8 per la sequenza commit raccomandata).

### Parallel Opportunities

- **Within Setup**: T002, T003, T005, T006, T007, T008, T009 sono tutti [P] — possono partire insieme.
- **Within Foundational**: T011, T012, T013, T014, T015 sono [P] (file diversi, no deps). T018 e T022, T023 sono [P]. T025–T026 è il refactor DRY, da fare in parallelo agli altri (file diverso).
- **Within US1**: T028, T029 (tests) [P]. T030 [P]. T035, T036, T037 (widget primitivi) [P]. T038 (list item) dipende da T035–T037.
- **Within US2**: T045, T046 (tests) [P]. T047 [P]. T053, T054 [P]. T055 dipende da T049 (classifier) e T047 (entities).
- **Across stories (con team multipli)**: dopo Foundational completata, un dev può lavorare su US1 (P1), un altro su US2 (P1) — i punti di intersezione sono il route file (sequenzializzare T042/T043 e T060), e la navigation (T059 verso US2 nella list page di US1).
- **Polish**: T082–T085 [P].

---

## Parallel Example: Foundational Phase (Phase 2)

```bash
# Sub-batch A — DTOs e entità (parallelizzabili)
Task: "Create SotaSpotModel DTO with @JsonKey overrides in lib/src/features/sota/data/model/sota_spot_model.dart"
Task: "Create SotaSummitModel DTO in lib/src/features/sota/data/model/sota_summit_model.dart"
Task: "Create SotaSpot domain entity in lib/src/features/sota/domain/sota_spot.dart"
Task: "Create SotaSummit domain entity in lib/src/features/sota/domain/sota_summit.dart"
Task: "Create SOTA error classes in lib/src/features/sota/errors/sota_errors.dart"

# Then sequential: T016 (build_runner) — BLOCKS subsequent tasks

# Sub-batch B — datasource + chart extraction in parallel
Task: "Create abstract SotaDatasource interface"
Task: "Extract AltimetricProfileChart to lib/common/widgets/"

# Then sequential: T019, T020, T021 (datasource impl + repository + build_runner)
```

## Parallel Example: User Story 1

```bash
# Tests parallel (Phase 3 tests)
Task: "Unit tests for SotaMappers utilities in test/sota_mappers_test.dart"
Task: "Integration test getActiveSpots in test/sota_provider_test.dart"

# Widget primitives parallel
Task: "Create SotaPointsBadge in lib/src/features/sota/presentation/sota_spots_page/widgets/sota_points_badge.dart"
Task: "Create SotaAltitudeBadge in lib/src/features/sota/presentation/sota_spots_page/widgets/sota_altitude_badge.dart"
Task: "Create SotaModeBadge in lib/src/features/sota/presentation/widgets/sota_mode_badge.dart"
```

---

## Implementation Strategy

### MVP First (User Story 1 only)

1. Complete Phase 1: Setup (T001–T010)
2. Complete Phase 2: Foundational (T011–T027) — **CRITICAL**, blocks all stories
3. Complete Phase 3: User Story 1 (T028–T044)
4. **STOP and VALIDATE**: lista SOTA navigabile, filtri funzionano, tablet ok, no regression
5. Optional intermediate release / internal demo

### Incremental Delivery (raccomandato)

1. Setup + Foundational → fondazione pronta
2. US1 → MVP testato → release alpha interna
3. US2 → WOW feature attiva → release beta (il valore differenziante è ora visibile)
4. US3 → mappa SOTA → release pubblica
5. US4 → dashboard tab → engagement boost
6. US5 → filtri avanzati → SOTA Chaser power-user happy
7. Polish → release stabile

### Parallel Team Strategy (≥2 dev)

Dopo che Foundational è completata:

- Dev A: US1 (lista) — il critical path verso MVP
- Dev B: US2 (WOW) — in parallelo su file separati
- Dev C: a scelta US3 o US4

Coordinazione sul file `lib/router/app_router.dart` (3 modifiche in T042/T060/T066): mergiarle in un singolo PR a fine di una story o gestire con merge conflict explicit.

---

## Notes

- [P] tasks = file diversi, nessuna dipendenza incompleta.
- [Story] label mappa il task all'user story per traceability.
- Ogni user story è completable e testable indipendentemente — un eventual stop dopo US1 lascia comunque un prodotto utile (lista SOTA funzionante).
- `flutter analyze` deve passare a zero warning dopo ogni task di implementazione (vincolo costituzionale).
- `dart format lib test` deve essere pulito prima di ogni commit.
- `dart run build_runner build --delete-conflicting-outputs` è necessario dopo ogni cambio a `@freezed` / `@riverpod` / `@RoutePage()`.
- `flutter gen-l10n` necessario dopo ogni modifica a `app_*.arb`.
- Verifica responsive (mobile + tablet ≥840 dp) richiesta a fine di ogni pagina (vincolo costituzionale V).
- Commit con prefix `[type]: [description]` — usare `feat:` per nuove feature, `refactor:` per T025–T026, `test:` per le suite di test.
- Avoid: vague tasks, same-file conflicts (gestiti esplicitamente sopra per router e SotaSpotsPage), cross-story coupling che rompa l'indipendenza.
