---
description: "Task list for 005-location-coverage-search"
---

# Tasks: Ricerca località / punto libero con ricezione stimata (Pro)

**Input**: Design documents from `/specs/005-location-coverage-search/`
**Prerequisites**: [plan.md](plan.md), [spec.md](spec.md), [research.md](research.md), [data-model.md](data-model.md), [contracts/](contracts/)

**Tests**: inclusi. Non è una scelta di stile: la costituzione del progetto (Principio II) impone almeno un integration test sul percorso principale per ogni feature che tocchi dati Supabase, e `flutter analyze` a zero warning come gate di merge.

**Organization**: i task sono raggruppati per user story, così che ogni storia sia implementabile, testabile e rilasciabile da sola.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: eseguibile in parallelo (file diversi, nessuna dipendenza da task incompleti)
- **[Story]**: la user story di appartenenza (US1…US5)
- Ogni descrizione contiene il percorso file esatto

## Path Conventions

Progetto Flutter, Clean Architecture per feature. Prefisso import: `package:hamqrg/...`.
Codice in `lib/`, test in `test/` (integration flat alla radice, unit in `test/common/`).

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: dipendenze, inizializzazione e artefatti esterni

- [X] T001 Aggiungere `remote_caching: ^1.0.19` a `pubspec.yaml` ed eseguire `flutter pub get`
- [X] T002 Inizializzare la cache in `lib/main.dart` prima di `runApp` con `defaultCacheDuration: Duration(days: 365)` e `verboseMode: kDebugMode`, come da [contracts/cache-and-storage.md](contracts/cache-and-storage.md)
- [X] T003 [P] Creare lo scheletro di cartelle `lib/src/features/coverage_search/{data/{datasource,model,mappers,repository},domain,presentation/widgets,provider,errors}`
- [X] T004 [P] Creare la migrazione `analytics_events` (tabella, RLS insert-only, indice) nel repo `ham_qrg_supabase/supabase/migrations/`, schema in [contracts/analytics-events.md](contracts/analytics-events.md)
- [X] T005 [P] Applicare la migrazione T004 sull'ambiente di sviluppo e verificare che un insert anonimo passi e una select venga rifiutata dalla RLS

**Checkpoint**: dipendenze installate, cache inizializzata, backend pronto a ricevere eventi

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: la macchina di **selezione del punto**, condivisa da US1 e US2 — nessuna delle due è dimostrabile senza di essa

**⚠️ CRITICAL**: nessuna user story può iniziare prima del completamento di questa fase

### Dominio condiviso

- [X] T006 [P] Creare l'enum `SearchPointOrigin` e l'entità `@freezed SearchPoint` in `lib/src/features/coverage_search/domain/search_point.dart`
- [X] T007 [P] Creare l'enum `SearchBreadth` (quick 80 / medium 100 / extended 150 km) con getter `radiusKm` in `lib/src/features/coverage_search/domain/search_breadth.dart`
- [X] T008 [P] Creare le entità `@freezed CoverageEntry` e `CoverageResult` (con getter `reachableCount` ed `entriesFor(Set<AccessMode>)`) in `lib/src/features/coverage_search/domain/coverage_result.dart`
- [X] T009 [P] Creare l'entità `@freezed PlaceSuggestion` in `lib/src/features/coverage_search/domain/place_suggestion.dart`
- [X] T010 Eseguire `dart run build_runner build --delete-conflicting-outputs` dopo T006–T009

### Funzioni pure (testabili senza I/O)

- [X] T011 [P] Implementare il parser di coordinate decimali (regex + validazione range ±90/±180) in `lib/src/features/coverage_search/domain/coordinate_parser.dart`, per FR-004 e FR-009
- [X] T012 [P] Implementare `isSamePlace(SearchPoint, SearchPoint)` con distanza haversine e soglia 200 m in `lib/src/features/coverage_search/domain/search_point.dart`, per FR-048
- [X] T013 [P] Scrivere gli unit test del parser di coordinate (formati validi, separatori `,` e spazio, virgola decimale, fuori range, stringhe ambigue) in `test/common/utils/coordinate_parser_test.dart`
- [X] T014 [P] Scrivere gli unit test della regola di prossimità (dentro 200 m, appena fuori, antipodi, attraversamento dell'antimeridiano) in `test/common/utils/search_point_proximity_test.dart`

### Geocodifica

- [X] T015 [P] Definire l'interfaccia astratta `GeocodingDatasource` in `lib/src/features/coverage_search/data/datasource/geocoding_datasource.dart`
- [X] T016 Implementare `MapboxGeocodingDatasource` (Dio, endpoint v6 forward, `limit=5`, lingua dalla locale, `CancelToken` per annullare le richieste superate) in `lib/src/features/coverage_search/data/datasource/mapbox_geocoding_datasource.dart`, contratto in [contracts/geocoding.md](contracts/geocoding.md)
- [X] T017 [P] Creare `PlaceSuggestionModel` con `fromJson` (attenzione all'ordine GeoJSON **lon, lat**) e il mapper verso `PlaceSuggestion` in `lib/src/features/coverage_search/data/model/place_suggestion_model.dart` e `.../mappers/place_suggestion_mapper.dart`
- [X] T018 Implementare `CoverageSearchRepository.searchPlaces(query)` in `lib/src/features/coverage_search/data/repository/coverage_search_repository.dart`
- [X] T019 Creare il provider `searchPlacesProvider` in `lib/src/features/coverage_search/provider/search_places/search_places_provider.dart`
- [X] T020 Scrivere l'integration test della geocodifica (località nota → coordinate attese entro tolleranza; query senza risultati → lista vuota) in `test/coverage_search_geocoding_test.dart` con `@Tags(['integration'])`

### Selezione del punto sulla mappa

- [X] T021 Estendere `RepeatersMapState` con `searchPoint`, `searchBreadth` e `pointError` in `lib/src/features/repeaters/presentation/map/controller/state/repeaters_map_state.dart`, poi rieseguire `build_runner`
- [X] T022 Aggiungere al `RepeatersMapController` i metodi `selectPoint`, `clearPoint` e `setBreadth`, mantenendo `AsyncData` in caso di errore e valorizzando `pointError` (mai `AsyncError`), in `lib/src/features/repeaters/presentation/map/controller/repeaters_map_controller.dart`
- [X] T023 Implementare il widget `PlaceSearchBar` (debounce 350 ms, minimo 3 caratteri, suggerimenti con contesto, riconoscimento coordinate, ricerche recenti quando il campo è vuoto, **via d'uscita coordinate/pressione prolungata sempre visibile** — Mapbox restituisce quasi sempre risultati fuzzy anziché una lista vuota) in `lib/src/features/coverage_search/presentation/widgets/place_search_bar.dart`
- [X] T024 Implementare la persistenza delle ricerche recenti (tetto 10, FIFO) su `StorageClient` in `lib/src/features/coverage_search/data/repository/recent_searches_repository.dart`, per FR-010
- [X] T025 Innestare `PlaceSearchBar` e il marker del punto sulla mappa, con stile distinto dai marker ripetitore e dalla posizione GPS, in `lib/src/features/repeaters/presentation/map/repeaters_map_page.dart`
- [X] T026 Registrare `LongTapInteraction` via `addInteraction` per la selezione con pressione prolungata in `lib/src/features/repeaters/presentation/map/repeaters_map_page.dart`, per FR-005
- [X] T027 Aggiungere le chiavi ARB della selezione del punto (barra, suggerimenti, errori coordinate, nessun risultato, recenti) a `lib/l10n/app_it.arb` e tradurle in tutte e 15 le lingue, poi `flutter gen-l10n`

**Checkpoint**: un utente qualsiasi può cercare una località, incollare coordinate o tenere premuto sulla mappa e vedere il pin nel punto corretto. Nessun calcolo ancora.

---

## Phase 3: User Story 1 — Ricezione da un punto arbitrario (Pro) (Priority: P1) 🎯 MVP

**Goal**: un utente Pro fissa un punto e ottiene la lista dei ripetitori raggiungibili, ordinata per segnale, con ampiezza selezionabile.

**Independent Test**: con account Pro, cercare una località nota, verificare che il pin sia corretto e che la lista dei raggiungibili coincida con quella ottenuta posizionandosi fisicamente in quel punto.

### Tests for User Story 1

- [X] T028 [P] [US1] Scrivere l'integration test della valutazione da punto arbitrario (punto noto → conteggio > 0, ordinamento per dbm decrescente, presenza di distanza e verdetto) in `test/coverage_search_provider_test.dart` con `@Tags(['integration'])`
- [X] T029 [P] [US1] Scrivere l'integration test che verifica che **cambiando ampiezza** sullo stesso punto il numero di candidati valutati cresca, in `test/coverage_search_provider_test.dart`

### Implementation for User Story 1

- [X] T030 [US1] Creare `evaluatePointProvider(point, breadth)` che riusa `getReachableRepeatersProvider` passando `radiusKm` dall'ampiezza e **senza passare `accessModes`** (FR-027), in `lib/src/features/coverage_search/provider/evaluate_point/evaluate_point_provider.dart`
- [X] T031 [US1] Implementare il gate Pro sulla valutazione: per un utente non Pro il provider **non deve essere invocato** (FR-013, FR-014); nessun calcolo, nessuna richiesta al servizio di copertura, in `lib/src/features/coverage_search/provider/evaluate_point/evaluate_point_provider.dart`
- [X] T032 [P] [US1] Implementare il widget `BreadthSelector` con le tre etichette che comunicano il compromesso portata/attesa, non le sole cifre (FR-025), in `lib/src/features/coverage_search/presentation/widgets/breadth_selector.dart`
- [X] T033 [US1] Persistere e ripristinare l'ultima ampiezza scelta su `StorageClient` sotto `coverage_search.breadth` (FR-026) in `lib/src/features/coverage_search/data/repository/coverage_search_repository.dart`
- [X] T034 [US1] Implementare `CoverageResultSheet` (mobile): conteggio in evidenza, lista ordinata con `RepeaterCard` esistente, distanza e intensità, colori dei modi via `AccessModeHelper`, in `lib/src/features/coverage_search/presentation/widgets/coverage_result_sheet.dart`
- [X] T035 [US1] Applicare i filtri di modo attivi **solo alla presentazione** e segnalare il numero di raggiungibili nascosti con azione di rimozione filtri (FR-028, FR-030) in `lib/src/features/coverage_search/presentation/widgets/coverage_result_sheet.dart`
- [X] T036 [US1] Implementare i tre stati vuoti distinti — nessun raggiungibile, nessun ripetitore censito, tutti nascosti dai filtri (FR-021 e edge case) — in `lib/src/features/coverage_search/presentation/widgets/coverage_result_sheet.dart`
- [X] T037 [US1] Implementare indicatore di avanzamento, annullamento del calcolo in corso e banner di errore recuperabile che **non distrugge** punto e risultato precedente (FR-022, FR-023) in `lib/src/features/coverage_search/presentation/widgets/coverage_result_sheet.dart`
- [X] T038 [US1] Gestire il cambio di ampiezza con calcolo in corso: annullare il precedente e avviarne uno nuovo senza sovrapporre risultati (edge case) in `lib/src/features/repeaters/presentation/map/controller/repeaters_map_controller.dart`
- [X] T039 [US1] Collegare il tocco su una voce del risultato alla rotta di dettaglio ripetitore passando **solo l'ID** (FR-020, Principio I) in `lib/src/features/coverage_search/presentation/widgets/coverage_result_sheet.dart`
- [X] T040 [US1] Aggiungere le chiavi ARB del risultato (conteggio con plurale ICU, stati vuoti, errori, etichette ampiezza, nascosti dai filtri) a `lib/l10n/app_it.arb`, tradurle in tutte e 15 le lingue, poi `flutter gen-l10n` con 0 messaggi mancanti

**Checkpoint**: US1 completa e verificabile da sola. Un Pro valuta qualunque punto, cambia ampiezza, filtra e apre i dettagli. Un non Pro non ottiene alcun calcolo.

---

## Phase 4: User Story 2 — Il non Pro incontra il valore e converte (Priority: P2)

**Goal**: al non Pro il punto scelto produce un teaser personalizzato col nome del posto e una CTA a un tocco dal paywall, senza che venga eseguito alcun calcolo.

**Independent Test**: con account non Pro, cercare una località, verificare che la mappa navighi, che il teaser porti il nome scelto, che nessun valore reale compaia, che nessuna richiesta parta verso il servizio di copertura e che la CTA apra il paywall in un tocco.

### Tests for User Story 2

- [X] T041 [P] [US2] Scrivere l'integration test dell'inserimento eventi in `analytics_events` (insert riuscito, select rifiutata dalla RLS) in `test/analytics_client_test.dart` con `@Tags(['integration'])`
- [X] T042 [P] [US2] Scrivere l'unit test che verifica che il payload dell'evento **non possa contenere** coordinate o nomi di località (FR-067, garanzia di firma) in `test/common/utils/analytics_event_payload_test.dart`

### Implementation for User Story 2

- [X] T043 [P] [US2] Definire gli enum chiusi `AnalyticsEvent` e `AnalyticsSurface` e l'interfaccia `AnalyticsClient` (solo enum + contatore intero, nessun parametro libero) in `lib/clients/analytics/analytics_client.dart`
- [X] T044 [US2] Implementare `SupabaseAnalyticsClient` fire-and-forget (`unawaited`, eccezioni catturate e inoltrate a Talker, mai propagate) in `lib/clients/analytics/impl/supabase_analytics_client.dart`, per FR-068
- [X] T045 [US2] Implementare `CoverageTeaser` riusando `ProBlurGate`: titolo personalizzato col nome della località scelta (FR-025 spec), righe segnaposto sfocate che riproducono la forma del risultato, benefici brevi, una sola CTA sempre visibile senza scorrere, in `lib/src/features/coverage_search/presentation/widgets/coverage_teaser.dart`
- [X] T046 [US2] Collegare il teaser al ramo non Pro della selezione del punto, verificando che **nessuna** chiamata al servizio di copertura venga emessa (FR-014), in `lib/src/features/repeaters/presentation/map/repeaters_map_page.dart`
- [X] T047 [US2] Collegare la CTA a `openReachabilityPaywall` e implementare il ritorno post-acquisto: pin ancora presente e **calcolo reale avviato automaticamente** (FR-031 spec), in `lib/src/features/coverage_search/presentation/widgets/coverage_teaser.dart`
- [X] T048 [US2] Gestire l'utente anonimo che avvia l'acquisto: richiesta di collegare un account **prima** dell'addebito, senza farlo uscire dal contesto corrente (FR-034 spec) in `lib/src/features/coverage_search/presentation/widgets/coverage_teaser.dart`
- [X] T049 [US2] Aggiungere il percorso di ripristino acquisti raggiungibile dal teaser (FR-033 spec) in `lib/src/features/coverage_search/presentation/widgets/coverage_teaser.dart`
- [X] T050 [US2] Strumentare il funnel sulla superficie `map_teaser`: punto selezionato, teaser mostrato, CTA toccata, paywall presentato, acquisto completato, paywall chiuso (FR-064, FR-065) in `lib/src/features/coverage_search/presentation/widgets/coverage_teaser.dart`
- [X] T051 [P] [US2] Strumentare la superficie esistente `reach_button`, oggi priva di misurazione (FR-066), in `lib/src/features/repeaters/presentation/reachable/widgets/reachable_map_button.dart`
- [X] T052 [P] [US2] Strumentare la superficie esistente `reach_badge`, oggi priva di misurazione (FR-066), in `lib/src/features/repeaters/presentation/reachable/widgets/repeater_reach_badge.dart`
- [X] T053 [US2] Aggiungere le chiavi ARB del teaser (titolo con placeholder località, benefici, CTA, ripristino acquisti) a `lib/l10n/app_it.arb`, tradurle in tutte e 15 le lingue, poi `flutter gen-l10n`

**Checkpoint**: US1 e US2 funzionano entrambe. Il percorso di conversione è completo e misurato su tutte e tre le superfici.

---

## Phase 5: User Story 3 — Salvataggio postazione e consultazione offline (Priority: P2)

**Goal**: un Pro salva una valutazione come postazione e la riapre in campo senza rete, con tutti i dati per sintonizzarsi; le postazioni non spariscono mai da sole.

**Independent Test**: salvare una postazione online, passare in modalità aereo, riaprirla e verificare che lista e parametri operativi siano leggibili con la data del dato.

### Tests for User Story 3

- [X] T054 [P] [US3] Scrivere l'integration test del ciclo salva → leggi → refresh, incluso il caso offline simulato (rete non disponibile → la postazione si apre comunque completa), in `test/saved_stations_test.dart` con `@Tags(['integration'])`
- [X] T055 [P] [US3] Scrivere l'unit test della soglia di obsolescenza a 30 giorni e del calcolo della data mostrata come `min(cachedAt)` fra i ripetitori risolti (R4) in `test/common/utils/saved_station_staleness_test.dart`

### Livello di cache condiviso

- [X] T056 [P] [US3] Creare `CachedRepeaterModel` (envelope `{repeater, cachedAt}`) con `toJson`/`fromJson` in `lib/src/features/coverage_search/data/model/cached_repeater_model.dart`
- [X] T057 [US3] Definire la costante `kNeverExpires = DateTime.utc(9999, 12, 31)` e l'interfaccia `RepeaterCacheDatasource` (`readCached`, `readFresh`, `writeAll`) in `lib/src/features/coverage_search/data/datasource/repeater_cache_datasource.dart`
- [X] T058 [US3] Implementare `RemoteCachingRepeaterDatasource` con chiave `repeater:v1:<id>`, `cacheFirst` per `readCached`, `networkFirst` per `readFresh`, e **un solo** metodo di scrittura che non espone la scadenza come parametro (INV-2), in `lib/src/features/coverage_search/data/datasource/remote_caching_repeater_datasource.dart`
- [X] T059 [US3] Rifare `getRepeaterByIdProvider` in modo che passi da `readFresh`, abilitando l'aggiornamento indiretto da qualunque punto dell'app (R5), in `lib/src/features/repeaters/provider/get_repeater_by_id/get_repeater_by_id_provider.dart`
- [X] T060 [US3] Verificare con `grep` che `RemoteCaching.instance.clearCache()` non compaia in `lib/` e documentare INV-1 in un commento sul datasource in `lib/src/features/coverage_search/data/datasource/remote_caching_repeater_datasource.dart`

### Archivio delle postazioni

- [X] T061 [P] [US3] Creare `SavedStationModel` con `toJson`/`fromJson` e il mapper verso `SavedStation` in `lib/src/features/coverage_search/data/model/saved_station_model.dart` e `.../mappers/saved_station_mapper.dart`
- [X] T062 [P] [US3] Creare le entità `@freezed SavedStation` e `HydratedStation` (con `missingIds`) in `lib/src/features/coverage_search/domain/saved_station.dart` e `.../domain/hydrated_station.dart`, poi rieseguire `build_runner`
- [X] T063 [US3] Implementare `PrefsSavedStationsDatasource` su `StorageClient` con chiave indice e chiave per record, scrivendo **prima il record e poi l'indice** per non lasciare ID orfani in caso di fallimento (FR-049), in `lib/src/features/coverage_search/data/datasource/prefs_saved_stations_datasource.dart`
- [X] T064 [US3] Implementare `SavedStationsRepository` (list, read, save, rename, delete) senza **alcun** percorso che rimuova una postazione se non per azione esplicita (FR-051) in `lib/src/features/coverage_search/data/repository/saved_stations_repository.dart`
- [X] T065 [US3] Implementare `SavedStationsNotifier` con `add`, `rename`, `delete`, `refresh(id)` e `refreshAll()` in `lib/src/features/coverage_search/provider/saved_stations_notifier/saved_stations_notifier.dart`

### Flusso di salvataggio e consultazione

- [X] T066 [US3] Implementare l'azione "Salva postazione" con nome modificabile precompilato da `point.label`, gate Pro e write-through di tutti i ripetitori in cache prima di scrivere il record (autosufficienza dal primo istante, R5), in `lib/src/features/coverage_search/provider/saved_stations_notifier/saved_stations_notifier.dart`
- [X] T067 [US3] Implementare il rilevamento del duplicato entro 200 m con proposta di aggiornamento **rifiutabile** (FR-048) in `lib/src/features/coverage_search/provider/saved_stations_notifier/saved_stations_notifier.dart`
- [X] T068 [US3] Implementare `hydrateStationProvider` che risolve gli ID dalla cache con `readCached` e raccoglie i mancanti in `missingIds` senza far fallire la pagina, in `lib/src/features/coverage_search/provider/hydrate_station/hydrate_station_provider.dart`
- [X] T069 [US3] Implementare `StationDetailPage` (mobile): lista completa con frequenza, modo, toni e parametri di accesso, indicazione esplicita di dato memorizzato e sua data, voci non risolte mostrate come "non disponibile offline", in `lib/src/features/coverage_search/presentation/station_detail_page/station_detail_page.dart` con controller e state in `.../controller/`
- [X] T070 [US3] Applicare i filtri di modo alla postazione salvata **anche offline**, poiché la copia conservata contiene tutti i modi (FR-029), in `lib/src/features/coverage_search/presentation/station_detail_page/station_detail_page.dart`
- [X] T071 [US3] Implementare la segnalazione di dato oltre 30 giorni con proposta di aggiornamento non bloccante (FR-046) in `lib/src/features/coverage_search/presentation/station_detail_page/station_detail_page.dart`
- [X] T072 [US3] Implementare l'aggiornamento massivo con avanzamento, annullamento ed esito per singola postazione, conservando intatta la copia precedente di quelle non aggiornate (FR-052, FR-053), in `lib/src/features/coverage_search/provider/saved_stations_notifier/saved_stations_notifier.dart`
- [X] T073 [US3] Gestire il fallimento del salvataggio per spazio esaurito con errore esplicito, **senza mai** liberare spazio rimuovendo postazioni esistenti (FR-049 ed edge case), in `lib/src/features/coverage_search/data/repository/saved_stations_repository.dart`
- [X] T074 [US3] Registrare la rotta `/stations/:stationId` in `lib/router/app_router.dart` e rigenerare con `build_runner`
- [X] T075 [US3] Aggiungere le chiavi ARB delle postazioni (salva, rinomina, elimina, duplicato, dato offline, dato vecchio, aggiornamento massivo, esiti) a `lib/l10n/app_it.arb`, tradurle in tutte e 15 le lingue, poi `flutter gen-l10n`

**Checkpoint**: una postazione salvata si apre offline, completa. Aprire un ripetitore altrove nell'app la aggiorna indirettamente.

---

## Phase 6: User Story 4 — Lista delle postazioni salvate (Priority: P3)

**Goal**: tutti raggiungono "Le mie postazioni": i Pro trovano le proprie, i non Pro una vetrina che mostra cosa otterrebbero.

**Independent Test**: aprire la lista con account non Pro (vetrina + CTA al paywall), poi con account Pro (postazioni reali ordinate dalla più recente).

### Implementation for User Story 4

- [X] T076 [US4] Implementare `SavedStationsPage` (mobile) con lista ordinata per `lastRefreshedAt` decrescente: nome, riferimento geografico, numero di raggiungibili, data dell'ultimo aggiornamento (FR-055), in `lib/src/features/coverage_search/presentation/saved_stations_page/saved_stations_page.dart` con controller e state in `.../controller/`
- [X] T077 [US4] Implementare lo stato vuoto per Pro senza postazioni, con rimando alla mappa (FR-058), in `lib/src/features/coverage_search/presentation/saved_stations_page/saved_stations_page.dart`
- [X] T078 [US4] Implementare la vetrina per non Pro con postazioni di esempio realistiche e dettagli sfocati, riusando benefici, CTA e comportamento post-acquisto del teaser (FR-056, FR-057), in `lib/src/features/coverage_search/presentation/saved_stations_page/widgets/stations_showcase.dart`
- [X] T079 [US4] Strumentare il funnel sulla superficie `stations_list` (FR-065) in `lib/src/features/coverage_search/presentation/saved_stations_page/widgets/stations_showcase.dart`
- [X] T080 [US4] Esporre l'azione di aggiornamento massivo (T072) dalla lista, con avanzamento e riepilogo, in `lib/src/features/coverage_search/presentation/saved_stations_page/saved_stations_page.dart`
- [X] T081 [US4] Registrare la rotta `/stations` in `lib/router/app_router.dart` e aggiungere gli accessi dalla mappa e dall'area personale, poi rigenerare con `build_runner`
- [X] T082 [US4] Aggiungere le chiavi ARB della lista e della vetrina a `lib/l10n/app_it.arb`, tradurle in tutte e 15 le lingue, poi `flutter gen-l10n`

**Checkpoint**: entrambi i punti d'ingresso alla conversione sono attivi e misurati.

---

## Phase 7: User Story 5 — Esperienza coerente su tablet (Priority: P3)

**Goal**: su tablet mappa e risultati convivono nella stessa schermata, e lista e dettaglio sono affiancati.

**Independent Test**: eseguire l'intero flusso di US1 su tablet in orizzontale e verticale, verificando che nulla sia troncato e che mappa e lista siano leggibili insieme.

### Implementation for User Story 5

- [X] T083 [P] [US5] Implementare `CoverageResultPanel` (pannello laterale affiancato alla mappa, non modale) in `lib/src/features/coverage_search/presentation/widgets/coverage_result_panel.dart`
- [X] T084 [US5] Innestare `ResponsiveLayout` sulla mappa con `mobile` (sheet) e `tablet` (panel), senza `LayoutBuilder` inline né breakpoint riscritti a mano (Principio V), in `lib/src/features/repeaters/presentation/map/repeaters_map_page.dart`
- [X] T085 [P] [US5] Implementare `saved_stations_tablet.dart` con lista e dettaglio affiancati in `lib/src/features/coverage_search/presentation/saved_stations_page/saved_stations_tablet.dart`
- [X] T086 [P] [US5] Implementare `station_detail_tablet.dart` in `lib/src/features/coverage_search/presentation/station_detail_page/station_detail_tablet.dart`
- [X] T087 [US5] Verificare che il teaser su tablet occupi il riquadro dei risultati mantenendo la CTA visibile senza scorrere (scenario 5 di US5) in `lib/src/features/coverage_search/presentation/widgets/coverage_teaser.dart`
- [~] T088 RICHIEDE DISPOSITIVO — non eseguibile senza app in esecuzione. [US5] Verificare la conservazione di punto selezionato e risultato al cambio di orientamento o dimensione finestra (FR-060) su tutte le schermate della feature

**Checkpoint**: tutte le schermate sono complete su entrambi i form factor, come richiesto dal Principio V.

---

## Phase 8: Polish & Cross-Cutting Concerns

- [X] T089 [P] Verificare che `flutter gen-l10n` riporti **0 untranslated message(s)** su tutte e 15 le lingue (SC-012)
- [X] T090 [P] Eseguire `flutter analyze` con zero warning e `dart format lib test` senza differenze residue
- [X] T091 Eseguire la verifica di traffico con account non Pro: nessuna richiesta al servizio di copertura in un'intera sessione (SC-008)
- [~] T092 COPERTO DA TEST AUTOMATICO (`test/saved_stations_test.dart`, "should reflect a repeater refreshed elsewhere in the app"); resta da confermare sull'app reale. Eseguire la verifica dell'aggiornamento indiretto descritta in [quickstart.md](quickstart.md): salva postazione → apri un suo ripetitore altrove → riapri la postazione, la data deve essere nuova
- [~] T093 RICHIEDE DISPOSITIVO in modalità aereo. Il comportamento è coperto da `test/saved_stations_test.dart`. Eseguire la verifica offline reale in modalità aereo su almeno 5 postazioni diverse (SC-004) e misurare l'apertura sotto i 2 secondi (SC-005)
- [X] T094 Eseguire la verifica di durabilità: riavvii dell'app, aggiornamento di versione e 30 giorni simulati di inattività senza che alcuna postazione scompaia (SC-015)
- [~] T095 RICHIEDE ACQUISTO REALE sullo store. Verificare il ritorno post-acquisto entro 3 secondi con il pin intatto e il calcolo avviato (SC-010)
- [~] T096 RICHIEDE DISPOSITIVO/simulatore. Verificare i layout su almeno 4 combinazioni dimensione/orientamento senza contenuto troncato (SC-011)
- [X] T097 [P] Aggiornare `CLAUDE.md` con la sezione sulle due invarianti della cache (INV-1, INV-2), perché sono convenzioni che il compilatore non può imporre

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: nessuna dipendenza
- **Foundational (Phase 2)**: dipende dal Setup — **blocca US1 e US2**
- **US1 (Phase 3)**: dipende da Foundational
- **US2 (Phase 4)**: dipende da Foundational; riusa il gate Pro introdotto in T031
- **US3 (Phase 5)**: dipende da US1 (serve un risultato da salvare)
- **US4 (Phase 6)**: dipende da US3 (serve qualcosa da elencare) e riusa la CTA di US2
- **US5 (Phase 7)**: dipende dalle schermate che rende responsive (US1, US3, US4)
- **Polish (Phase 8)**: dipende da tutte le storie desiderate

### Nota sull'indipendenza

US1 e US2 sono genuinamente indipendenti fra loro una volta completata la Phase 2, ed è per questo che la selezione del punto sta in Foundational e non dentro US1: entrambe ne hanno bisogno e nessuna delle due è dimostrabile senza. US3, US4 e US5 hanno invece dipendenze reali e dichiarate — fingere il contrario avrebbe prodotto storie non testabili.

### Within Each User Story

- I test vanno scritti prima e devono fallire
- Entità prima dei modelli, modelli prima dei repository, repository prima dei provider, provider prima delle pagine
- `build_runner` dopo ogni modifica a `@freezed`, `@riverpod` o `@RoutePage()`
- Le chiavi ARB si aggiungono **e si traducono in tutte e 15 le lingue** nello stesso task, mai "dopo"

### Parallel Opportunities

- T003–T005 (setup) in parallelo
- T006–T009 (entità di dominio) in parallelo, poi T010 le raccoglie
- T011–T014 (funzioni pure e loro test) in parallelo
- T051 e T052 (strumentazione delle due superfici esistenti) in parallelo
- T083, T085, T086 (layout tablet, file distinti) in parallelo
- Con più sviluppatori: completata la Phase 2, uno prende US1 e uno US2

---

## Parallel Example: Foundational

```bash
# Entità di dominio, file distinti:
T006 SearchPoint          T007 SearchBreadth
T008 CoverageResult       T009 PlaceSuggestion
# → poi T010 (build_runner) una sola volta per tutte

# Funzioni pure e i rispettivi unit test:
T011 coordinate_parser    T013 coordinate_parser_test
T012 isSamePlace          T014 search_point_proximity_test
```

---

## Implementation Strategy

### MVP (US1)

1. Phase 1 Setup → 2. Phase 2 Foundational → 3. Phase 3 US1 → **fermarsi e validare**.

A quel punto un utente Pro cerca qualunque posto del pianeta e scopre cosa raggiunge da lì. È già il salto di prodotto: dall'app che dice "cosa senti adesso" a quella che dice "cosa sentirai da lì". Rilasciabile.

### Consegna incrementale

1. Setup + Foundational → la barra e il pin funzionano per tutti
2. **+ US1** → il Pro ottiene la risposta *(MVP)*
3. **+ US2** → il non Pro incontra il teaser e il funnel inizia a misurare
4. **+ US3** → la postazione salvata rende la funzione utile in campo, dove non c'è rete
5. **+ US4** → il secondo punto d'ingresso alla conversione
6. **+ US5** → l'esperienza è completa su entrambi i form factor

Il punto 3 merita un'osservazione di sequenza: fino a quando US2 non è in piedi, l'app **misura zero**. Se il rilascio dell'MVP dovesse restare in produzione per più di qualche giorno prima di US2, si perde proprio la baseline del funnel su cui poi si giudicherà ogni ottimizzazione. Vale la pena tenerle vicine.

---

## Verifiche manuali residue

I cinque task marcati `[~]` non sono eseguibili da riga di comando: richiedono
l'app in esecuzione su dispositivo, la modalità aereo o un acquisto reale sullo
store. Il comportamento sottostante è comunque coperto dai test automatici dove
possibile — in particolare l'aggiornamento indiretto e la consultazione offline
hanno ciascuno il proprio test di integrazione.

## Notes

- `[P]` = file diversi, nessuna dipendenza da task incompleti
- Ogni storia è completabile e verificabile prima di passare alla successiva
- Commit dopo ogni task o gruppo logico; ogni commit deve passare `flutter analyze`
- Le due invarianti della cache (mai `clearCache()`, sempre la sentinella) non sono verificabili dal compilatore: T060 e T097 esistono apposta per renderle visibili a chi arriverà dopo
