# Implementation Plan: Ricerca località / punto libero con ricezione stimata (Pro)

**Branch**: `005-location-coverage-search` | **Date**: 2026-08-26 | **Spec**: [spec.md](spec.md)
**Input**: Feature specification from `/specs/005-location-coverage-search/spec.md`

## Summary

Barra di ricerca per località, coordinate e pressione prolungata sulla mappa che porta un pin in un punto qualsiasi; per gli utenti Pro il punto produce la lista dei ripetitori raggiungibili, salvabile come "postazione" e consultabile senza rete. Per i non Pro lo stesso gesto produce un teaser personalizzato col nome del posto scelto e una CTA verso il paywall, senza che venga eseguito alcun calcolo.

L'approccio tecnico ruota attorno a una scelta: **separare il dato dell'utente dal dato rigenerabile**. La postazione (punto, livello, verdetti, riferimenti) vive in un archivio proprio a durata illimitata; i payload dei ripetitori vivono in un'unica cache condivisa con scadenza sentinella, letta con `cacheFirst` quando si rende una postazione (accesso puramente locale, zero rete) e con `networkFirst` quando si apre una scheda ripetitore ovunque nell'app (aggiornamento della copia condivisa, con fallback offline). Da qui discende l'efficienza chiesta dal richiedente: aprire un ripetitore a febbraio aggiorna da solo la postazione salvata a ottobre, e cinque postazioni della stessa regione condividono una sola copia di ciascun ripetitore.

Il motore di calcolo non va costruito: `getReachableRepeatersProvider` è già parametrizzato su punto e raggio.

## Technical Context

**Language/Version**: Dart 3.x / Flutter 3.x (vincolati da `pubspec.yaml`)
**Primary Dependencies**: Riverpod 3.x (`riverpod_annotation ^4.0`), `freezed`, `auto_route`, `dio ^5.7`, `supabase_flutter`, `mapbox_maps_flutter ^2.4` (2.25 risolta), `shared_preferences ^2.3`, **`remote_caching ^1.0.19` (nuova, pacchetto interno)**
**Storage**: due archivi distinti — `StorageClient`/SharedPreferences per le postazioni (dato utente, durata illimitata); `remote_caching` (SQLite) con scadenza sentinella per i payload ripetitore (dato rigenerabile e condiviso)
**Testing**: `flutter test`; integration con Supabase reale e `@Tags(['integration'])`; unit per parser coordinate, prossimità 200 m, soglia 30 giorni, envelope di cache
**Target Platform**: iOS e Android (telefono e tablet)
**Project Type**: Mobile app (Flutter, Clean Architecture per feature)
**Performance Goals**: suggerimenti < 1 s (SC-002); risultato ampiezza rapida < 10 s nel 90% (SC-003); apertura postazione offline < 2 s (SC-005)
**Constraints**: nessuna chiamata al servizio di copertura per utenti non Pro (FR-014, SC-008); nessuna rimozione automatica delle postazioni (FR-051); nessuna coordinata negli eventi (FR-067); 15 lingue senza messaggi mancanti (SC-012)
**Scale/Scope**: decine di postazioni per utente; fino a ~300 ripetitori per postazione all'ampiezza estesa; 5 storie utente, ~10 schermate/superfici fra mobile e tablet

## Constitution Check

*GATE: superato prima della Phase 0 e ri-verificato dopo la Phase 1.*

| Principio | Esito | Come è soddisfatto |
|---|---|---|
| **I — Clean Architecture** | ✅ | Nuova feature `coverage_search/` con `data/{datasource,model,mappers,repository}`, `domain/`, `presentation/[page]/controller/state/`, `provider/`. Pagine ricevono solo ID primitivi (`stationId`, `repeaterId`). Import `package:hamqrg/...`. `build_runner` dopo ogni `@freezed`/`@riverpod` |
| **II — Testing** | ✅ | Integration test per geocodifica e per il ciclo salva→leggi→refresh; unit test per le funzioni pure (parser, prossimità, staleness). `flutter analyze` a zero warning, `dart format` senza diff |
| **III — UX Consistency** | ✅ | Colori dei modi via `AccessModeHelper`; chiavi ARB `[feature][element]` in inglese con valori italiani, tradotte in tutte e 15 le lingue; errori di mutazione mantengono `AsyncData` + flag nello state (mai `AsyncError` su pagine con dati); prompt di registrazione senza navigare via (FR-034) |
| **IV — Performance & Reliability** | ✅ | Nessuna query PostgREST complessa introdotta (il calcolo passa dal servizio di copertura HTTP già in uso; la lettura ripetitore usa il repository esistente). `_onProPurchased` già invalida `isProProvider` e ricostruisce l'albero. Nessun `copyWithPrevious`. Mappa e liste conservano l'ultimo dataset con banner non bloccante |
| **V — Responsive Layout** | ✅ | Ogni nuova pagina passa da `ResponsiveLayout` con `mobile` obbligatorio e `tablet` dove il mobile sprecherebbe spazio; widget tablet in `<page>_tablet.dart` accanto alla pagina; nessun `LayoutBuilder` inline; `kTabletBreakpoint` mai riscritto a mano |

**Nota su IV**: la costituzione impone funzioni RPC per query con join, fuzzy match o filtri multipli. Questa feature **non introduce query di quel tipo**: riusa `getRepeatersNearby` e `getRepeaterById` esistenti. L'unico artefatto SQL nuovo è la tabella `analytics_events`, che è una scrittura semplice con RLS di solo inserimento.

**Ri-verifica post-Phase 1**: nessun principio violato dal disegno. L'unico punto che merita giustificazione esplicita è nella tabella Complexity Tracking.

## Project Structure

### Documentation (this feature)

```text
specs/005-location-coverage-search/
├── plan.md              # Questo file
├── spec.md              # Specifica (68 FR, 19 SC)
├── research.md          # Phase 0 — 10 decisioni tecniche
├── data-model.md        # Phase 1 — entità, modelli persistiti, validazioni
├── quickstart.md        # Phase 1 — avvio, ordine di lavoro, errori facili
├── contracts/
│   ├── cache-and-storage.md   # Chiavi, sentinella, invarianti, interfacce
│   ├── geocoding.md           # Mapbox v6, parsing coordinate, errori
│   └── analytics-events.md    # Eventi, superfici, tabella + RLS
├── checklists/requirements.md
└── tasks.md             # Phase 2 — creato da /speckit.tasks, NON da qui
```

### Source Code (repository root)

```text
lib/
├── clients/
│   ├── analytics/                          # NUOVO — client fire-and-forget
│   │   ├── analytics_client.dart
│   │   └── impl/supabase_analytics_client.dart
│   └── storage/                            # esistente, riusato
│
├── src/features/coverage_search/           # NUOVA FEATURE
│   ├── data/
│   │   ├── datasource/
│   │   │   ├── geocoding_datasource.dart           # astratto
│   │   │   ├── mapbox_geocoding_datasource.dart    # Dio + token esistente
│   │   │   ├── repeater_cache_datasource.dart      # astratto
│   │   │   ├── remote_caching_repeater_datasource.dart
│   │   │   ├── saved_stations_datasource.dart      # astratto
│   │   │   └── prefs_saved_stations_datasource.dart
│   │   ├── model/
│   │   │   ├── place_suggestion_model.dart
│   │   │   ├── cached_repeater_model.dart          # envelope con cachedAt
│   │   │   └── saved_station_model.dart
│   │   ├── mappers/
│   │   └── repository/
│   │       ├── coverage_search_repository.dart
│   │       └── saved_stations_repository.dart
│   ├── domain/
│   │   ├── search_point.dart                       # + isSamePlace (200 m)
│   │   ├── search_breadth.dart                     # quick/medium/extended
│   │   ├── coverage_result.dart
│   │   ├── saved_station.dart
│   │   └── hydrated_station.dart
│   ├── presentation/
│   │   ├── widgets/
│   │   │   ├── place_search_bar.dart
│   │   │   ├── breadth_selector.dart
│   │   │   ├── coverage_result_sheet.dart          # mobile
│   │   │   ├── coverage_result_panel.dart          # tablet
│   │   │   └── coverage_teaser.dart                # non Pro, riusa ProBlurGate
│   │   ├── saved_stations_page/
│   │   │   ├── controller/{controller,state}
│   │   │   ├── saved_stations_page.dart
│   │   │   └── saved_stations_tablet.dart
│   │   └── station_detail_page/
│   │       ├── controller/{controller,state}
│   │       ├── station_detail_page.dart
│   │       └── station_detail_tablet.dart
│   ├── provider/
│   │   ├── search_places/
│   │   ├── evaluate_point/
│   │   ├── saved_stations_notifier/                # add/rename/delete/refresh/refreshAll
│   │   └── hydrate_station/
│   └── errors/
│
├── src/features/repeaters/
│   ├── presentation/map/repeaters_map_page.dart    # MODIFICATO — barra, pin, LongTapInteraction
│   ├── presentation/reachable/widgets/             # MODIFICATI — strumentazione (FR-066)
│   └── provider/get_repeater_by_id/                # MODIFICATO — passa da readFresh (R5)
│
├── router/app_router.dart                          # MODIFICATO — /stations, /stations/:stationId
└── l10n/app_*.arb                                  # MODIFICATI — 15 lingue

test/
├── coverage_search_provider_test.dart              # integration, @Tags(['integration'])
├── saved_stations_test.dart                        # integration — salva/leggi/refresh/offline
└── common/utils/
    ├── coordinate_parser_test.dart                 # unit
    └── search_point_proximity_test.dart            # unit — regola 200 m
```

**Structure Decision**: nuova feature `coverage_search/` con la gerarchia imposta dalla costituzione, che riusa le entità (`Repeater`, `AccessMode`) e i provider (`getReachableRepeatersProvider`, `getRepeatersNearbyProvider`) della feature `repeaters` invece di duplicarli. La barra di ricerca e il pin sono modifiche chirurgiche alla pagina mappa esistente, perché è lì che vivono per l'utente; tutto il resto — postazioni, lista, teaser, geocodifica — è materiale nuovo e autonomo. La strumentazione tocca anche due widget esistenti in `repeaters/presentation/reachable/`, che oggi non misurano nulla.

## Complexity Tracking

| Violation | Why Needed | Simpler Alternative Rejected Because |
|---|---|---|
| Un pacchetto di **cache** usato per conservare dati che non devono mai sparire (sentinella `DateTime.utc(9999)` + due invarianti da rispettare a mano) | È il disegno indicato dal richiedente ed è quello che rende possibile l'aggiornamento indiretto (R5) e la deduplicazione fra postazioni. Il pacchetto è interno, quindi le invarianti sono governabili | Duplicare il payload dei ripetitori dentro ogni postazione sarebbe immune a `clearCache()` e non richiederebbe invarianti, ma congelerebbe i dati al salvataggio, moltiplicherebbe lo spazio per ~20× e rinuncerebbe all'aggiornamento indiretto — cioè al beneficio principale del disegno |
| Due strategie di lettura diverse (`cacheFirst` / `networkFirst`) sulla **stessa chiave** | È ciò che rende una postazione istantanea e offline-safe *e* al tempo stesso sempre aggiornabile dall'esterno, senza alcun codice di sincronizzazione fra i due percorsi | Una sola strategia non può essere entrambe: `cacheFirst` ovunque non aggiornerebbe mai; `networkFirst` ovunque farebbe 300 richieste all'apertura di una postazione, violando SC-005 |

**Debito riconosciuto**: entrambe le righe sparirebbero se `remote_caching` supportasse nativamente `expires_at NULL` = "non scade mai". Il pacchetto è nostro, quindi è un miglioramento realistico — fuori dallo scope di questa feature, ma da mettere in conto: renderebbe INV-2 superflua e trasformerebbe la sentinella in una scelta esplicita del chiamante invece che in una convenzione da ricordare.

## Phase status

- [x] **Phase 0 — Research** → [research.md](research.md): 10 decisioni, tutte verificate sul codice reale. Nessun `NEEDS CLARIFICATION` residuo.
- [x] **Phase 1 — Design & Contracts** → [data-model.md](data-model.md), [contracts/](contracts/), [quickstart.md](quickstart.md).
- [ ] **Phase 2 — Tasks** → `/speckit.tasks`.

## Dipendenze esterne a questo repository

| Cosa | Dove | Bloccante per |
|---|---|---|
| Tabella `analytics_events` + policy RLS | repo `ham_qrg_supabase` | FR-064→068, SC-017/018 |
| Nessun'altra: il servizio di copertura e la geocodifica Mapbox sono già configurati e pagati | — | — |
